let meta: Game.meta = {
  name: "Ja? Nein?",
  url: Config.baseUrl ++ "/#/ja-oder-nein",
}

module Data = {
  type yesOrNo = No | Yes

  type answer = {
    text: string,
    rightAnswer: yesOrNo,
    userAnswer: option<yesOrNo>,
  }

  type question = {
    text: string,
    answers: array<answer>,
  }

  let rounds = [
    {
      text: `Über welche Möbel wird in dem Lied "Valhalleluja" gesungen?`,
      answers: [
        {text: `ASKHOLMEN`, rightAnswer: No, userAnswer: None},
        {text: `BAGGEBO`, rightAnswer: No, userAnswer: None},
        {text: `BESTÅ`, rightAnswer: Yes, userAnswer: None},
        {text: `BYÅS`, rightAnswer: No, userAnswer: None},
        {text: `HEMNES`, rightAnswer: No, userAnswer: None},
        {text: `KALLAX`, rightAnswer: No, userAnswer: None},
        {text: `KIVIK`, rightAnswer: Yes, userAnswer: None},
        {text: `KNOPPARP`, rightAnswer: Yes, userAnswer: None},
        {text: `MALM`, rightAnswer: No, userAnswer: None},
        {text: `SLATTUM`, rightAnswer: Yes, userAnswer: None},
        {text: `VITTSJÖ`, rightAnswer: Yes, userAnswer: None},
      ],
    },
    {
      text: `Welche Bands spielen 2022 auf dem Full Force?`,
      answers: [
        {text: `1349`, rightAnswer: No, userAnswer: None},
        {text: `8kids`, rightAnswer: No, userAnswer: None},
        {text: `Abbath`, rightAnswer: No, userAnswer: None},
        {text: `Aborted`, rightAnswer: No, userAnswer: None},
        {text: `Adept`, rightAnswer: No, userAnswer: None},
        {text: `Airbourne`, rightAnswer: No, userAnswer: None},
        {text: `Alcest`, rightAnswer: No, userAnswer: None},
        {text: `Amaranthe`, rightAnswer: Yes, userAnswer: None},
        {text: `Amon Amarth`, rightAnswer: No, userAnswer: None},
        {text: `Amorphis`, rightAnswer: No, userAnswer: None},
        {text: `Animals as Leaders`, rightAnswer: No, userAnswer: None},
        {text: `Annisokay`, rightAnswer: No, userAnswer: None},
        {text: `Anti-Flag`, rightAnswer: Yes, userAnswer: None},
        {text: `Any Given Day`, rightAnswer: Yes, userAnswer: None},
        {text: `Apocalyptica`, rightAnswer: No, userAnswer: None},
        {text: `Apologies`, rightAnswer: No, userAnswer: None},
        {text: `Arch Enemy`, rightAnswer: No, userAnswer: None},
        {text: `Architects`, rightAnswer: No, userAnswer: None},
        {text: `Arise from the Fallen`, rightAnswer: No, userAnswer: None},
        {text: `As Everything Unfolds`, rightAnswer: Yes, userAnswer: None},
        {text: `Asking Alexandria`, rightAnswer: No, userAnswer: None},
        {text: `At the Gates`, rightAnswer: No, userAnswer: None},
        {text: `Atari Teenage Riot`, rightAnswer: No, userAnswer: None},
        {text: `August Burns Red`, rightAnswer: No, userAnswer: None},
        {text: `Avatar`, rightAnswer: No, userAnswer: None},
        {text: `Bad Omens`, rightAnswer: No, userAnswer: None},
        {text: `Batushka`, rightAnswer: No, userAnswer: None},
        {text: `Beartooth`, rightAnswer: Yes, userAnswer: None},
        {text: `Behemoth`, rightAnswer: No, userAnswer: None},
        {text: `Being as an Ocean`, rightAnswer: No, userAnswer: None},
        {text: `Belphegor`, rightAnswer: No, userAnswer: None},
        {text: `Benediction`, rightAnswer: No, userAnswer: None},
        {text: `Billybio`, rightAnswer: No, userAnswer: None},
        {text: `Black Peaks`, rightAnswer: No, userAnswer: None},
        {text: `Blackout Problems`, rightAnswer: Yes, userAnswer: None},
        {text: `Bleed From Within`, rightAnswer: Yes, userAnswer: None},
        {text: `Bleeding Through`, rightAnswer: No, userAnswer: None},
        {text: `Bob Vylan`, rightAnswer: Yes, userAnswer: None},
        {text: `Body Count feat. Ice-T`, rightAnswer: No, userAnswer: None},
        {text: `Bombus`, rightAnswer: No, userAnswer: None},
        {text: `Booze & Glory`, rightAnswer: No, userAnswer: None},
        {text: `Boston Manor`, rightAnswer: Yes, userAnswer: None},
        {text: `Boysetsfire`, rightAnswer: Yes, userAnswer: None},
        {text: `Broken Teeth`, rightAnswer: No, userAnswer: None},
        {text: `Brothers in Arms`, rightAnswer: No, userAnswer: None},
        {text: `Bullet for My Valentine`, rightAnswer: Yes, userAnswer: None},
        {text: `Bury Tomorrow`, rightAnswer: Yes, userAnswer: None},
        {text: `Caliban`, rightAnswer: No, userAnswer: None},
        {text: `Callejon`, rightAnswer: No, userAnswer: None},
        {text: `Cane Hill`, rightAnswer: No, userAnswer: None},
        {text: `Cannibal Corpse`, rightAnswer: No, userAnswer: None},
        {text: `Carach Angren`, rightAnswer: No, userAnswer: None},
        {text: `Carnage Calligraphy`, rightAnswer: No, userAnswer: None},
        {text: `Combichrist`, rightAnswer: No, userAnswer: None},
        {text: `Comeback Kid`, rightAnswer: Yes, userAnswer: None},
        {text: `Counterfeit`, rightAnswer: No, userAnswer: None},
        {text: `Counterparts`, rightAnswer: Yes, userAnswer: None},
        {text: `Cradle of Filth`, rightAnswer: No, userAnswer: None},
        {text: `Creeper`, rightAnswer: Yes, userAnswer: None},
        {text: `Crossfaith`, rightAnswer: Yes, userAnswer: None},
        {text: `Cryptopsy`, rightAnswer: No, userAnswer: None},
        {text: `Crystal Lake`, rightAnswer: No, userAnswer: None},
        {text: `D.R.I.`, rightAnswer: No, userAnswer: None},
        {text: `Dagoba`, rightAnswer: No, userAnswer: None},
        {text: `Dark Funeral`, rightAnswer: No, userAnswer: None},
        {text: `Dawn Rayd`, rightAnswer: No, userAnswer: None},
        {text: `Dead Poet Society`, rightAnswer: Yes, userAnswer: None},
        {text: `Deafheaven`, rightAnswer: No, userAnswer: None},
        {text: `Debauchery`, rightAnswer: No, userAnswer: None},
        {text: `Ded`, rightAnswer: No, userAnswer: None},
        {text: `Deez Nuts`, rightAnswer: No, userAnswer: None},
        {text: `Dethroned`, rightAnswer: No, userAnswer: None},
        {text: `Die Kassierer`, rightAnswer: No, userAnswer: None},
        {text: `Dool`, rightAnswer: No, userAnswer: None},
        {text: `Dragged Under`, rightAnswer: Yes, userAnswer: None},
        {text: `Drain`, rightAnswer: Yes, userAnswer: None},
        {text: `Dritte Wahl`, rightAnswer: No, userAnswer: None},
        {text: `Dropkick Murphys`, rightAnswer: No, userAnswer: None},
        {text: `Dropout Kings`, rightAnswer: Yes, userAnswer: None},
        {text: `Drunken Swallows`, rightAnswer: No, userAnswer: None},
        {text: `Dust Bolt`, rightAnswer: No, userAnswer: None},
        {text: `Dying Fetus`, rightAnswer: No, userAnswer: None},
        {text: `Ektomorf`, rightAnswer: No, userAnswer: None},
        {text: `Elsterglanz`, rightAnswer: No, userAnswer: None},
        {text: `Emil Bulls`, rightAnswer: Yes, userAnswer: None},
        {text: `Emmure`, rightAnswer: No, userAnswer: None},
        {text: `Employed to Serve`, rightAnswer: No, userAnswer: None},
        {text: `Entombed A.D.`, rightAnswer: No, userAnswer: None},
        {text: `Equilibrium`, rightAnswer: Yes, userAnswer: None},
        {text: `Eskimo Callboy`, rightAnswer: No, userAnswer: None},
        {text: `Excrementory Grindfuckers`, rightAnswer: No, userAnswer: None},
        {text: `Eïs`, rightAnswer: No, userAnswer: None},
        {text: `First Blood`, rightAnswer: No, userAnswer: None},
        {text: `Fleshgod Apocalypse`, rightAnswer: No, userAnswer: None},
        {text: `Flogging Molly`, rightAnswer: No, userAnswer: None},
        {text: `Four Year Strong`, rightAnswer: No, userAnswer: None},
        {text: `Frog Leap`, rightAnswer: Yes, userAnswer: None},
        {text: `From Fall To Spring`, rightAnswer: Yes, userAnswer: None},
        {text: `Future Palace`, rightAnswer: Yes, userAnswer: None},
        {text: `Gatecreeper`, rightAnswer: Yes, userAnswer: None},
        {text: `Get The Shot`, rightAnswer: Yes, userAnswer: None},
        {text: `Ghøstkid`, rightAnswer: Yes, userAnswer: None},
        {text: `God Dethroned`, rightAnswer: No, userAnswer: None},
        {text: `Gutalax`, rightAnswer: Yes, userAnswer: None},
        {text: `H2O`, rightAnswer: No, userAnswer: None},
        {text: `Harakiri for the Sky`, rightAnswer: No, userAnswer: None},
        {text: `Harms Way`, rightAnswer: No, userAnswer: None},
        {text: `Hatebreed`, rightAnswer: No, userAnswer: None},
        {text: `Heaven Shall Burn`, rightAnswer: Yes, userAnswer: None},
        {text: `Holding Absence`, rightAnswer: Yes, userAnswer: None},
        {text: `I Have None`, rightAnswer: No, userAnswer: None},
        {text: `Ignite`, rightAnswer: No, userAnswer: None},
        {text: `Imminence`, rightAnswer: Yes, userAnswer: None},
        {text: `In Flames`, rightAnswer: No, userAnswer: None},
        {text: `In This Moment`, rightAnswer: No, userAnswer: None},
        {text: `Infected Rain`, rightAnswer: Yes, userAnswer: None},
        {text: `Jinjer`, rightAnswer: No, userAnswer: None},
        {text: `Johnny Deathshadow`, rightAnswer: No, userAnswer: None},
        {text: `Judas Priest`, rightAnswer: No, userAnswer: None},
        {text: `Kadavar`, rightAnswer: No, userAnswer: None},
        {text: `Kanzler & Söhne`, rightAnswer: No, userAnswer: None},
        {text: `Kataklysm`, rightAnswer: No, userAnswer: None},
        {text: `Killswitch Engage`, rightAnswer: No, userAnswer: None},
        {text: `Knocked Loose`, rightAnswer: Yes, userAnswer: None},
        {text: `Knorkator`, rightAnswer: No, userAnswer: None},
        {text: `Konvent`, rightAnswer: Yes, userAnswer: None},
        {text: `Kreator`, rightAnswer: No, userAnswer: None},
        {text: `Kvelertak`, rightAnswer: Yes, userAnswer: None},
        {text: `Lamb of God`, rightAnswer: No, userAnswer: None},
        {text: `Landmvrks`, rightAnswer: Yes, userAnswer: None},
        {text: `Life of Agony`, rightAnswer: No, userAnswer: None},
        {text: `Limp Bizkit`, rightAnswer: No, userAnswer: None},
        {text: `Lionheart`, rightAnswer: No, userAnswer: None},
        {text: `Madball`, rightAnswer: No, userAnswer: None},
        {text: `Malevolence`, rightAnswer: Yes, userAnswer: None},
        {text: `Mambo Kurt & Gäste`, rightAnswer: No, userAnswer: None},
        {text: `Mambo Kurt`, rightAnswer: No, userAnswer: None},
        {text: `Manos`, rightAnswer: No, userAnswer: None},
        {text: `Mantar`, rightAnswer: No, userAnswer: None},
        {text: `Marduk`, rightAnswer: No, userAnswer: None},
        {text: `Massendefekt`, rightAnswer: No, userAnswer: None},
        {text: `Me & That Man`, rightAnswer: Yes, userAnswer: None},
        {text: `Megaherz`, rightAnswer: No, userAnswer: None},
        {text: `Meshuggah`, rightAnswer: No, userAnswer: None},
        {text: `Milking the Goatmachine`, rightAnswer: No, userAnswer: None},
        {text: `Ministry`, rightAnswer: No, userAnswer: None},
        {text: `Misharped Fortune`, rightAnswer: No, userAnswer: None},
        {text: `Miss May I`, rightAnswer: No, userAnswer: None},
        {text: `Moonsorrow`, rightAnswer: No, userAnswer: None},
        {text: `Morgoth`, rightAnswer: No, userAnswer: None},
        {text: `Moscow Death Brigade`, rightAnswer: Yes, userAnswer: None},
        {text: `Motionless in White`, rightAnswer: No, userAnswer: None},
        {text: `Municipal Waste`, rightAnswer: No, userAnswer: None},
        {text: `Mute Nation`, rightAnswer: No, userAnswer: None},
        {text: `Napalm Death`, rightAnswer: No, userAnswer: None},
        {text: `Nasty`, rightAnswer: Yes, userAnswer: None},
        {text: `Neck Deep`, rightAnswer: Yes, userAnswer: None},
        {text: `Necrophobic`, rightAnswer: No, userAnswer: None},
        {text: `Northlane`, rightAnswer: No, userAnswer: None},
        {text: `Nothing More`, rightAnswer: No, userAnswer: None},
        {text: `Novelists`, rightAnswer: No, userAnswer: None},
        {text: `Obey the Brave`, rightAnswer: No, userAnswer: None},
        {text: `Obituary`, rightAnswer: No, userAnswer: None},
        {text: `Oceans Ate Alaska`, rightAnswer: No, userAnswer: None},
        {text: `Oceans`, rightAnswer: Yes, userAnswer: None},
        {text: `Of Mice & Men`, rightAnswer: No, userAnswer: None},
        {text: `One Step Closer`, rightAnswer: Yes, userAnswer: None},
        {text: `Orange Goblin`, rightAnswer: No, userAnswer: None},
        {text: `Orbit Culture`, rightAnswer: Yes, userAnswer: None},
        {text: `Our Last Night`, rightAnswer: No, userAnswer: None},
        {text: `Paleface`, rightAnswer: Yes, userAnswer: None},
        {text: `Parkway Drive`, rightAnswer: No, userAnswer: None},
        {text: `Perkele`, rightAnswer: No, userAnswer: None},
        {text: `Polar`, rightAnswer: No, userAnswer: None},
        {text: `Polaris`, rightAnswer: No, userAnswer: None},
        {text: `Portrayal Of Guilt`, rightAnswer: Yes, userAnswer: None},
        {text: `Power Trip`, rightAnswer: No, userAnswer: None},
        {text: `Powerflo`, rightAnswer: No, userAnswer: None},
        {text: `Primordial`, rightAnswer: No, userAnswer: None},
        {text: `Pro Pain`, rightAnswer: No, userAnswer: None},
        {text: `Psychopunch`, rightAnswer: No, userAnswer: None},
        {text: `Psychostick`, rightAnswer: No, userAnswer: None},
        {text: `Raised Fist`, rightAnswer: Yes, userAnswer: None},
        {text: `Rise of the Northstar`, rightAnswer: No, userAnswer: None},
        {text: `Risk It`, rightAnswer: No, userAnswer: None},
        {text: `Rolo Tomassi`, rightAnswer: Yes, userAnswer: None},
        {text: `Rotting Christ`, rightAnswer: Yes, userAnswer: None},
        {text: `Royal Republic`, rightAnswer: No, userAnswer: None},
        {text: `SETYØURSAILS`, rightAnswer: Yes, userAnswer: None},
        {text: `Scowl`, rightAnswer: Yes, userAnswer: None},
        {text: `Seeyouspacecowboy`, rightAnswer: Yes, userAnswer: None},
        {text: `Septicflesh`, rightAnswer: No, userAnswer: None},
        {text: `Sepultura`, rightAnswer: No, userAnswer: None},
        {text: `Shining`, rightAnswer: No, userAnswer: None},
        {text: `Siamese`, rightAnswer: Yes, userAnswer: None},
        {text: `Sick of It All`, rightAnswer: No, userAnswer: None},
        {text: `Silence Is Betrayal`, rightAnswer: No, userAnswer: None},
        {text: `Silent Descent`, rightAnswer: No, userAnswer: None},
        {text: `Silverstein`, rightAnswer: Yes, userAnswer: None},
        {text: `Skynd`, rightAnswer: Yes, userAnswer: None},
        {text: `Soilwork`, rightAnswer: Yes, userAnswer: None},
        {text: `Sondaschule`, rightAnswer: No, userAnswer: None},
        {text: `Soulburn`, rightAnswer: No, userAnswer: None},
        {text: `Soulfly`, rightAnswer: No, userAnswer: None},
        {text: `Spasm`, rightAnswer: No, userAnswer: None},
        {text: `Stick To Your Guns`, rightAnswer: Yes, userAnswer: None},
        {text: `Stray from the Path`, rightAnswer: No, userAnswer: None},
        {text: `Suicide Silence`, rightAnswer: Yes, userAnswer: None},
        {text: `Swiss & die Andern`, rightAnswer: Yes, userAnswer: None},
        {text: `Sylosis`, rightAnswer: No, userAnswer: None},
        {text: `Tankard`, rightAnswer: No, userAnswer: None},
        {text: `Tanzwut`, rightAnswer: No, userAnswer: None},
        {text: `Tausend Löwen unter Feinden`, rightAnswer: No, userAnswer: None},
        {text: `Tell You What Now`, rightAnswer: No, userAnswer: None},
        {text: `ten56`, rightAnswer: Yes, userAnswer: None},
        {text: `Tendencia`, rightAnswer: No, userAnswer: None},
        {text: `Tenside`, rightAnswer: No, userAnswer: None},
        {text: `Terror`, rightAnswer: No, userAnswer: None},
        {text: `TesseracT`, rightAnswer: No, userAnswer: None},
        {text: `The Amity Affliction`, rightAnswer: No, userAnswer: None},
        {text: `The Black Dahlia Murder`, rightAnswer: No, userAnswer: None},
        {text: `The Butcher Sisters`, rightAnswer: No, userAnswer: None},
        {text: `The Disaster Area`, rightAnswer: Yes, userAnswer: None},
        {text: `The Ghost Inside`, rightAnswer: Yes, userAnswer: None},
        {text: `The Hirsch Effekt`, rightAnswer: No, userAnswer: None},
        {text: `The Ocean`, rightAnswer: No, userAnswer: None},
        {text: `The Rumjacks`, rightAnswer: Yes, userAnswer: None},
        {text: `Thy Art Is Murder`, rightAnswer: No, userAnswer: None},
        {text: `Toxpack`, rightAnswer: No, userAnswer: None},
        {text: `Tragedy of Mine`, rightAnswer: No, userAnswer: None},
        {text: `Trash Boat`, rightAnswer: Yes, userAnswer: None},
        {text: `Triptykon`, rightAnswer: No, userAnswer: None},
        {text: `Trollfest`, rightAnswer: No, userAnswer: None},
        {text: `Trynity`, rightAnswer: No, userAnswer: None},
        {text: `Turnstile`, rightAnswer: No, userAnswer: None},
        {text: `tuXedoo`, rightAnswer: No, userAnswer: None},
        {text: `Unleashed`, rightAnswer: No, userAnswer: None},
        {text: `Val Sinestra`, rightAnswer: No, userAnswer: None},
        {text: `Vallenfyre`, rightAnswer: No, userAnswer: None},
        {text: `Vein.FM`, rightAnswer: Yes, userAnswer: None},
        {text: `Venom Prison`, rightAnswer: No, userAnswer: None},
        {text: `Venues`, rightAnswer: Yes, userAnswer: None},
        {text: `Walking Dead on Broadway`, rightAnswer: No, userAnswer: None},
        {text: `Wargasm`, rightAnswer: Yes, userAnswer: None},
        {text: `We Butter the Bread with Butter`, rightAnswer: No, userAnswer: None},
        {text: `While She Sleeps`, rightAnswer: No, userAnswer: None},
        {text: `Whitechapel`, rightAnswer: No, userAnswer: None},
        {text: `Wisdom in Chains`, rightAnswer: No, userAnswer: None},
        {text: `Wolf Down`, rightAnswer: No, userAnswer: None},
        {text: `Wolfheart`, rightAnswer: No, userAnswer: None},
        {text: `Wolves in the Throne Room`, rightAnswer: No, userAnswer: None},
        {text: `ZSK`, rightAnswer: No, userAnswer: None},
        {text: `Ze Gran Zeft`, rightAnswer: No, userAnswer: None},
        {text: `Zeal & Ardor`, rightAnswer: Yes, userAnswer: None},
        {text: `Zombiez`, rightAnswer: Yes, userAnswer: None},
      ],
    },
  ]

  let numberOfRounds = Belt.Array.length(rounds)
}

module Answer = {
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
  let make = (~answer: Data.answer, ~onAnswerClick) => {
    let onYesClick = _ => {
      if Belt.Option.isNone(answer.userAnswer) {
        onAnswerClick(Data.Yes)
      }
    }

    let onNoClick = _ => {
      if Belt.Option.isNone(answer.userAnswer) {
        onAnswerClick(Data.No)
      }
    }

    let match = (answer.rightAnswer, answer.userAnswer)

    let yesClassName = switch match {
    | (Data.Yes, Some(Data.Yes)) => "right" // if yes and yes clicked
    | (Data.No, Some(Data.Yes)) => "wrong" // if no and yes clicked
    | _ => ""
    }

    let noClassName = switch match {
    | (Data.Yes, Some(Data.No)) => "wrong" // if yes and no clicked
    | (Data.No, Some(Data.No)) => "right" // if no and no clicked
    | _ => ""
    }

    <div className>
      <div> {React.string(answer.text)} </div>
      <button className=yesClassName onClick=onYesClick> {React.string(`✔`)} </button>
      <button className=noClassName onClick=onNoClick> {React.string(`✘`)} </button>
    </div>
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

  let questionContainer = css(`
    padding: 1rem 0;
  `)

  @react.component
  let make = () => {
    let (round, setRound) = React.useState(_ => 1)
    let (question, setQuestion) = React.useState(_ => Data.rounds[round - 1])

    React.useEffect1(() => {
      setQuestion(_ => Data.rounds[round - 1])

      None
    }, [round])

    let answerQuestion = (answer: Data.answer, choice: Data.yesOrNo) => {
      let answers = Belt.Array.map(question.answers, a => {
        if a === answer {
          {...a, userAnswer: Some(choice)}
        } else {
          a
        }
      })

      setQuestion(_ => {...question, answers: answers})
    }

    let onNextRoundClick = _ => {
      if round < Data.numberOfRounds {
        setRound(succ)
      }
    }

    <div className=Shared.Styles.fullscreenContainer>
      <Header.Component name=meta.name round numberOfRounds=Data.numberOfRounds />
      <main className=main>
        <div className=questionContainer> {React.string(question.text)} </div>
        {question.answers
        ->Belt.Array.mapWithIndex((index, answer) => {
          <Answer key={Belt.Int.toString(index)} answer onAnswerClick={answerQuestion(answer)} />
        })
        ->React.array}
      </main>
      <footer className=Shared.Styles.footer>
        <button className=Shared.Styles.primaryButton onClick=onNextRoundClick>
          {React.string(`Nächste Runde`)}
        </button>
      </footer>
    </div>
  }
}
