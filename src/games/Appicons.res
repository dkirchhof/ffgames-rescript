let meta: Game.meta = {
  name: "Appicons zeichnen",
  url: "/#/appicons-zeichnen",
}

module Data = {
  type icon = {
    name: string,
    index: int,
  }

  let shuffledIcons =
    [
      "Steam",
      "Discord",
      "Twitch",
      "Slack",
      "airbnb",
      "Expedia",
      "Uber",
      "Shazam",
      "Dropbox",
      "Evernote",
      "TeamViewer",
      "Duolingo",
      "Skype",
      "Reddit",
      "WhatsApp",
      "Tinder",
      "Periscope",
      "Twitter",
      "Snapchat",
      "Pinterest",
      "Spotify",
      "Flickr",
      "Facebook Messenger",
      "Chrome",
      "Gmail",
      "Google Maps",
      "Google Drive",
      "Youtube",
      "Hangouts",
      "Instagram",
      "App Store (Apple)",
      "iTunes",
      "Safari",
    ]
    ->Belt.Array.mapWithIndex((index, name) => {name: name, index: index})
    ->Belt.Array.shuffle

  let numberOfRounds = Array.length(shuffledIcons)
}

module Component = {
  open Emotion

  let main = css(`
    display: flex;
    align-items: center;
    flex-direction: column;
    gap: 0.5rem;

    padding: 4rem 0.5rem 0.5rem 0.5rem;
  `)

  let name = css(`
    font-size: 2rem;
  `)

  let icon = css(
    `
    width: 120px;
    height: 120px;
    
    background-image: url(/assets/appicons/appicons.svg);
    background-color: whitesmoke;
    border-radius: 20px;

    &.hide {
        background: none;
        border: 2px dashed ${Shared.Colors.orange};
    }
  `,
  )

  @react.component
  let make = () => {
    let (round, setRound) = React.useState(_ => 1)
    let (showIcon, setShowIcon) = React.useState(_ => false)

    let numberOfRounds = Data.numberOfRounds
    let currentIcon = Data.shuffledIcons[round - 1]

    let onToggleIconClick = _ => {
      setShowIcon(show => !show)
    }

    let onNextRoundClick = _ => {
      if round < numberOfRounds {
        setRound(succ)
        setShowIcon(_ => false)
      }
    }

    let iconClassName = if showIcon {
      icon
    } else {
      cx([icon, "hide"])
    }

    let iconStyle = ReactDOM.Style.make(
      ~backgroundPosition=`${(currentIcon.index * -120)->string_of_int}px`,
      (),
    )

    <div className=Shared.Styles.fullscreenContainer>
      <Header.Component name=meta.name round=1 numberOfRounds=1 />
      <main className=main>
        <div className=name> {React.string(currentIcon.name)} </div>
        <div className={iconClassName} style={iconStyle} />
      </main>
      <footer className=Shared.Styles.footer>
        <button className=Shared.Styles.button onClick=onToggleIconClick>
          {React.string(showIcon ? `Icon verstecken` : `Icon anzeigen`)}
        </button>
        <button className=Shared.Styles.primaryButton onClick=onNextRoundClick>
          {React.string(`Nächste Runde`)}
        </button>
      </footer>
    </div>
  }
}
