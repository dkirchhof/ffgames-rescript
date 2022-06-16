let meta: Game.meta = {
  name: "Wer kommt?",
  url: "/#/wer-kommt",
}

module Data = {
  type band = {
    name: string,
    isComing: bool,
  }

  let bands = [
    {name: `1349`, isComing: false},
    {name: `8kids`, isComing: false},
    {name: `Abbath`, isComing: false},
    {name: `Aborted`, isComing: false},
    {name: `Adept`, isComing: false},
    {name: `Airbourne`, isComing: false},
    {name: `Alcest`, isComing: false},
    {name: `Amaranthe`, isComing: true},
    {name: `Amon Amarth`, isComing: false},
    {name: `Amorphis`, isComing: false},
    {name: `Animals as Leaders`, isComing: false},
    {name: `Annisokay`, isComing: false},
    {name: `Anti-Flag`, isComing: true},
    {name: `Any Given Day`, isComing: true},
    {name: `Apocalyptica`, isComing: false},
    {name: `Apologies`, isComing: false},
    {name: `Arch Enemy`, isComing: false},
    {name: `Architects`, isComing: false},
    {name: `Arise from the Fallen`, isComing: false},
    {name: `As Everything Unfolds`, isComing: true},
    {name: `Asking Alexandria`, isComing: false},
    {name: `At the Gates`, isComing: false},
    {name: `Atari Teenage Riot`, isComing: false},
    {name: `August Burns Red`, isComing: false},
    {name: `Avatar`, isComing: false},
    {name: `Bad Omens`, isComing: false},
    {name: `Batushka`, isComing: false},
    {name: `Beartooth`, isComing: true},
    {name: `Behemoth`, isComing: false},
    {name: `Being as an Ocean`, isComing: false},
    {name: `Belphegor`, isComing: false},
    {name: `Benediction`, isComing: false},
    {name: `Billybio`, isComing: false},
    {name: `Black Peaks`, isComing: false},
    {name: `Blackout Problems`, isComing: true},
    {name: `Bleed From Within`, isComing: true},
    {name: `Bleeding Through`, isComing: false},
    {name: `Bob Vylan`, isComing: true},
    {name: `Body Count feat. Ice-T`, isComing: false},
    {name: `Bombus`, isComing: false},
    {name: `Booze & Glory`, isComing: false},
    {name: `Boston Manor`, isComing: true},
    {name: `Boysetsfire`, isComing: true},
    {name: `Broken Teeth`, isComing: false},
    {name: `Brothers in Arms`, isComing: false},
    {name: `Bullet for My Valentine`, isComing: true},
    {name: `Bury Tomorrow`, isComing: true},
    {name: `Caliban`, isComing: false},
    {name: `Callejon`, isComing: false},
    {name: `Cane Hill`, isComing: false},
    {name: `Cannibal Corpse`, isComing: false},
    {name: `Carach Angren`, isComing: false},
    {name: `Carnage Calligraphy`, isComing: false},
    {name: `Combichrist`, isComing: false},
    {name: `Comeback Kid`, isComing: true},
    {name: `Counterfeit`, isComing: false},
    {name: `Counterparts`, isComing: true},
    {name: `Cradle of Filth`, isComing: false},
    {name: `Creeper`, isComing: true},
    {name: `Crossfaith`, isComing: true},
    {name: `Cryptopsy`, isComing: false},
    {name: `Crystal Lake`, isComing: false},
    {name: `D.R.I.`, isComing: false},
    {name: `Dagoba`, isComing: false},
    {name: `Dark Funeral`, isComing: false},
    {name: `Dawn Rayd`, isComing: false},
    {name: `Dead Poet Society`, isComing: true},
    {name: `Deafheaven`, isComing: false},
    {name: `Debauchery`, isComing: false},
    {name: `Ded`, isComing: false},
    {name: `Deez Nuts`, isComing: false},
    {name: `Dethroned`, isComing: false},
    {name: `Die Kassierer`, isComing: false},
    {name: `Dool`, isComing: false},
    {name: `Dragged Under`, isComing: true},
    {name: `Drain`, isComing: true},
    {name: `Dritte Wahl`, isComing: false},
    {name: `Dropkick Murphys`, isComing: false},
    {name: `Dropout Kings`, isComing: true},
    {name: `Drunken Swallows`, isComing: false},
    {name: `Dust Bolt`, isComing: false},
    {name: `Dying Fetus`, isComing: false},
    {name: `Ektomorf`, isComing: false},
    {name: `Elsterglanz`, isComing: false},
    {name: `Emil Bulls`, isComing: true},
    {name: `Emmure`, isComing: false},
    {name: `Employed to Serve`, isComing: false},
    {name: `Entombed A.D.`, isComing: false},
    {name: `Equilibrium`, isComing: true},
    {name: `Eskimo Callboy`, isComing: false},
    {name: `Excrementory Grindfuckers`, isComing: false},
    {name: `Eïs`, isComing: false},
    {name: `First Blood`, isComing: false},
    {name: `Fleshgod Apocalypse`, isComing: false},
    {name: `Flogging Molly`, isComing: false},
    {name: `Four Year Strong`, isComing: false},
    {name: `Frog Leap`, isComing: true},
    {name: `From Fall To Spring`, isComing: true},
    {name: `Future Palace`, isComing: true},
    {name: `Gatecreeper`, isComing: true},
    {name: `Get The Shot`, isComing: true},
    {name: `Ghøstkid`, isComing: true},
    {name: `God Dethroned`, isComing: false},
    {name: `Gutalax`, isComing: true},
    {name: `H2O`, isComing: false},
    {name: `Harakiri for the Sky`, isComing: false},
    {name: `Harms Way`, isComing: false},
    {name: `Hatebreed`, isComing: false},
    {name: `Heaven Shall Burn`, isComing: true},
    {name: `Holding Absence`, isComing: true},
    {name: `I Have None`, isComing: false},
    {name: `Ignite`, isComing: false},
    {name: `Imminence`, isComing: true},
    {name: `In Flames`, isComing: false},
    {name: `In This Moment`, isComing: false},
    {name: `Infected Rain`, isComing: true},
    {name: `Jinjer`, isComing: false},
    {name: `Johnny Deathshadow`, isComing: false},
    {name: `Judas Priest`, isComing: false},
    {name: `Kadavar`, isComing: false},
    {name: `Kanzler & Söhne`, isComing: false},
    {name: `Kataklysm`, isComing: false},
    {name: `Killswitch Engage`, isComing: false},
    {name: `Knocked Loose`, isComing: true},
    {name: `Knorkator`, isComing: false},
    {name: `Konvent`, isComing: true},
    {name: `Kreator`, isComing: false},
    {name: `Kvelertak`, isComing: true},
    {name: `Lamb of God`, isComing: false},
    {name: `Landmvrks`, isComing: true},
    {name: `Life of Agony`, isComing: false},
    {name: `Limp Bizkit`, isComing: false},
    {name: `Lionheart`, isComing: false},
    {name: `Madball`, isComing: false},
    {name: `Malevolence`, isComing: true},
    {name: `Mambo Kurt & Gäste`, isComing: false},
    {name: `Mambo Kurt`, isComing: false},
    {name: `Manos`, isComing: false},
    {name: `Mantar`, isComing: false},
    {name: `Marduk`, isComing: false},
    {name: `Massendefekt`, isComing: false},
    {name: `Me & That Man`, isComing: true},
    {name: `Megaherz`, isComing: false},
    {name: `Meshuggah`, isComing: false},
    {name: `Milking the Goatmachine`, isComing: false},
    {name: `Ministry`, isComing: false},
    {name: `Misharped Fortune`, isComing: false},
    {name: `Miss May I`, isComing: false},
    {name: `Moonsorrow`, isComing: false},
    {name: `Morgoth`, isComing: false},
    {name: `Moscow Death Brigade`, isComing: true},
    {name: `Motionless in White`, isComing: false},
    {name: `Municipal Waste`, isComing: false},
    {name: `Mute Nation`, isComing: false},
    {name: `Napalm Death`, isComing: false},
    {name: `Nasty`, isComing: true},
    {name: `Neck Deep`, isComing: true},
    {name: `Necrophobic`, isComing: false},
    {name: `Northlane`, isComing: false},
    {name: `Nothing More`, isComing: false},
    {name: `Novelists`, isComing: false},
    {name: `Obey the Brave`, isComing: false},
    {name: `Obituary`, isComing: false},
    {name: `Oceans Ate Alaska`, isComing: false},
    {name: `Oceans`, isComing: true},
    {name: `Of Mice & Men`, isComing: false},
    {name: `One Step Closer`, isComing: true},
    {name: `Orange Goblin`, isComing: false},
    {name: `Orbit Culture`, isComing: true},
    {name: `Our Last Night`, isComing: false},
    {name: `Paleface`, isComing: true},
    {name: `Parkway Drive`, isComing: false},
    {name: `Perkele`, isComing: false},
    {name: `Polar`, isComing: false},
    {name: `Polaris`, isComing: false},
    {name: `Portrayal Of Guilt`, isComing: true},
    {name: `Power Trip`, isComing: false},
    {name: `Powerflo`, isComing: false},
    {name: `Primordial`, isComing: false},
    {name: `Pro Pain`, isComing: false},
    {name: `Psychopunch`, isComing: false},
    {name: `Psychostick`, isComing: false},
    {name: `Raised Fist`, isComing: true},
    {name: `Rise of the Northstar`, isComing: false},
    {name: `Risk It`, isComing: false},
    {name: `Rolo Tomassi`, isComing: true},
    {name: `Rotting Christ`, isComing: true},
    {name: `Royal Republic`, isComing: false},
    {name: `SETYØURSAILS`, isComing: true},
    {name: `Scowl`, isComing: true},
    {name: `Seeyouspacecowboy`, isComing: true},
    {name: `Septicflesh`, isComing: false},
    {name: `Sepultura`, isComing: false},
    {name: `Shining`, isComing: false},
    {name: `Siamese`, isComing: true},
    {name: `Sick of It All`, isComing: false},
    {name: `Silence Is Betrayal`, isComing: false},
    {name: `Silent Descent`, isComing: false},
    {name: `Silverstein`, isComing: true},
    {name: `Skynd`, isComing: true},
    {name: `Soilwork`, isComing: true},
    {name: `Sondaschule`, isComing: false},
    {name: `Soulburn`, isComing: false},
    {name: `Soulfly`, isComing: false},
    {name: `Spasm`, isComing: false},
    {name: `Stick To Your Guns`, isComing: true},
    {name: `Stray from the Path`, isComing: false},
    {name: `Suicide Silence`, isComing: true},
    {name: `Swiss & die Andern`, isComing: true},
    {name: `Sylosis`, isComing: false},
    {name: `Tankard`, isComing: false},
    {name: `Tanzwut`, isComing: false},
    {name: `Tausend Löwen unter Feinden`, isComing: false},
    {name: `Tell You What Now`, isComing: false},
    {name: `ten56`, isComing: true},
    {name: `Tendencia`, isComing: false},
    {name: `Tenside`, isComing: false},
    {name: `Terror`, isComing: false},
    {name: `TesseracT`, isComing: false},
    {name: `The Amity Affliction`, isComing: false},
    {name: `The Black Dahlia Murder`, isComing: false},
    {name: `The Butcher Sisters`, isComing: false},
    {name: `The Disaster Area`, isComing: true},
    {name: `The Ghost Inside`, isComing: true},
    {name: `The Hirsch Effekt`, isComing: false},
    {name: `The Ocean`, isComing: false},
    {name: `The Rumjacks`, isComing: true},
    {name: `Thy Art Is Murder`, isComing: false},
    {name: `Toxpack`, isComing: false},
    {name: `Tragedy of Mine`, isComing: false},
    {name: `Trash Boat`, isComing: true},
    {name: `Triptykon`, isComing: false},
    {name: `Trollfest`, isComing: false},
    {name: `Trynity`, isComing: false},
    {name: `Turnstile`, isComing: false},
    {name: `tuXedoo`, isComing: false},
    {name: `Unleashed`, isComing: false},
    {name: `Val Sinestra`, isComing: false},
    {name: `Vallenfyre`, isComing: false},
    {name: `Vein.FM`, isComing: true},
    {name: `Venom Prison`, isComing: false},
    {name: `Venues`, isComing: true},
    {name: `Walking Dead on Broadway`, isComing: false},
    {name: `Wargasm`, isComing: true},
    {name: `We Butter the Bread with Butter`, isComing: false},
    {name: `While She Sleeps`, isComing: false},
    {name: `Whitechapel`, isComing: false},
    {name: `Wisdom in Chains`, isComing: false},
    {name: `Wolf Down`, isComing: false},
    {name: `Wolfheart`, isComing: false},
    {name: `Wolves in the Throne Room`, isComing: false},
    {name: `ZSK`, isComing: false},
    {name: `Ze Gran Zeft`, isComing: false},
    {name: `Zeal & Ardor`, isComing: true},
    {name: `Zombiez`, isComing: true},
  ]
}

module Question = {
  type t = {
    band: Data.band,
    answer: option<bool>,
  }

  let make = band => {band: band, answer: None}
  let makeList = bands => Belt.Array.map(bands, make)

  module Component = {
    open Emotion

    let className = css(
      `
      display: flex;
      align-items: center;
      gap: 0.5rem;

      > div:nth-child(1) {
        flex: 1;
      }

      > button {
        width: 2rem;
        height: 2rem;

        color: ${Shared.Colors.darkGray};
        background: ${Shared.Colors.lightGray};
        border-radius: 0.5rem;
        border: none;

        font-size: 1rem;

        &.right {
          background: ${Shared.Colors.green};
        }

        &.wrong {
          color: ${Shared.Colors.yellow};
          background: ${Shared.Colors.orange};
        }
      }
    `,
    )

    @react.component
    let make = (~question, ~onAnswerClick) => {
      let onYesClick = _ => {
        if Belt.Option.isNone(question.answer) {
          onAnswerClick(true)
        }
      }

      let onNoClick = _ => {
        if Belt.Option.isNone(question.answer) {
          onAnswerClick(false)
        }
      }

      let yesClassName = switch (question.band.isComing, question.answer) {
      | (true, Some(true)) => "right"
      | (false, Some(true)) => "wrong"
      | _ => ""
      }

      let noClassName = switch (question.band.isComing, question.answer) {
      | (true, Some(false)) => "wrong"
      | (false, Some(false)) => "right"
      | _ => ""
      }

      <div className>
        <div> {React.string(question.band.name)} </div>
        <button className=yesClassName onClick=onYesClick> {React.string(`✔`)} </button>
        <button className=noClassName onClick=onNoClick> {React.string(`✘`)} </button>
      </div>
    }
  }
}

module Component = {
  open Emotion

  let main = css(`
    display: flex;
    flex-direction: column;
    gap: 0.5rem;

    margin-bottom: 0.5rem;
    padding: 0 0.5rem;

    overflow-y: scroll;
  `)

  @react.component
  let make = () => {
    let (questions, setQuestions) = React.useState(_ => Question.makeList(Data.bands))

    let answerQuestion = (question: Question.t, answer: bool) => {
      setQuestions(
        Array.map(q => {
          if q === question {
            {...question, answer: Some(answer)}
          } else {
            q
          }
        }),
      )
    }

    <div className=Shared.Styles.fullscreenContainer>
      <Header.Component name=meta.name round=1 numberOfRounds=1 />
      <main className=main>
        {questions
        ->Belt.Array.mapWithIndex((index, question) => {
          <Question.Component
            key={Belt.Int.toString(index)} question onAnswerClick={answerQuestion(question)}
          />
        })
        ->React.array}
      </main>
    </div>
  }
}
