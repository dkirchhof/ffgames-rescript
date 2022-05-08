module Link = {
  open Emotion

  let className = css(`
    color: ${Shared.Colors.orange};

    font-size: 1rem;
    text-align: center;
    text-transform: uppercase;
    text-decoration: none;
  `)

  @react.component
  let make = (~game: Games.t) => {
    <a className href=game.url> {React.string(game.name)} </a>
  }
}

module Component = {
  open Emotion

  let main = css(`
    display: flex;
    flex-direction: column;
    gap: 1rem;

    padding: 0 0.5rem 0.5rem 0.5rem;
  `)

  @react.component
  let make = () => {
    <div className=Shared.Styles.fullscreenContainer>
      <header className=Shared.Styles.header>
        <h1> {React.string("Full Force Games 2022")} </h1>
      </header>
      <main className=main>
        <Link game=Games.appicons />
        <Link game=Games.bandlogoHangman />
        <Link game=Games.pornoPantomime />
        <Link game=Games.werKommt />
      </main>
    </div>
  }
}
