let string_of_char = c => String.make(1, c)

let meta: Game.meta = {
  name: "Bandlogo-Hangman",
  url: "/#/bandlogo-hangman",
}

module Data = {
  let shuffledBands = Belt.Array.shuffle([
    "ANATEUS",
    "AVERSE SEFIRA",
    "AZAGHAL",
    "BAZZAH",
    "BESTIAL SUMMONING",
    "BLACK FIRE",
    "BLOODBATH",
    "BLUDGEON",
    "BORKNAGAR",
    "CRYPTIC ABUSE",
    "DARKTHRONE",
    "DAWN OF DREAMS",
    "DEFEATED SANITY",
    "EMPEROR",
    "ENSLAVED",
    "ENTHRONED",
    "ESCHATON",
    "FINNTROLL",
    "GOAT'S ASS TRUMPET",
    "GOSFORTH",
    "GUT ROT",
    "IMMORTAL",
    "INSANITY",
    "KATHARSIS",
    "KORGONTHURUS",
    "KUTURIAT",
    "LEVIATHAN",
    "MATER TENEBRA",
    "MAYHEM",
    "MENTAL INFESTATION",
    "MISERICORDIAM",
    "MOONSPELL",
    "NAGLFAR",
    "NIGHT BRINGER",
    "ORCHIDECTOMY",
    "SADISTIC SAINT",
    "SONGE D'ENFER",
    "SORROWSTORM",
    "SPERM SWAMP",
    "SUMMONING",
    "TUNDRA",
    "UNTORY",
    "WAKING THE CADAVER",
    "WOLVES IN THE THRONE ROOM",
    "XASTHUR",
  ])

  let numberOfRounds = Array.length(shuffledBands)
}

module Slot = {
  type t = {
    char: char,
    hidden: bool,
  }

  let isLetter = c => {
    let n = int_of_char(c)

    (n >= 65 && n < 91) || (n >= 97 && n < 123)
  }

  let make = c => {char: c, hidden: isLetter(c)}

  module Component = {
    open Emotion

    let className = css(`
      display: flex;
      justify-content: center;
      align-items: center;

      width: 1.5rem;
      height: 1.5rem;

      background: ${Shared.Colors.lightGray};
      border-bottom: 2px solid ${Shared.Colors.darkGray};

      font-size: 1rem;
      text-transform: uppercase;
    `)

    @react.component
    let make = (~slot) => {
      <span className>
        {switch slot.hidden {
        | true => " "
        | false => string_of_char(slot.char)
        }->React.string}
      </span>
    }
  }
}

module SlotGroup = {
  type t = array<Slot.t>

  let make = word => Array.init(String.length(word), i => String.get(word, i)->Slot.make)

  module Component = {
    open Emotion

    let className = css(`
      display: flex;
      gap: 0.25rem;
    `)

    @react.component
    let make = (~slots) => {
      <div className>
        {slots
        ->Belt.Array.mapWithIndex((index, slot) =>
          <Slot.Component key={Belt.Int.toString(index)} slot />
        )
        ->React.array}
      </div>
    }
  }
}

module SlotGroups = {
  let make = words =>
    String.split_on_char(' ', words)->Belt.List.map(SlotGroup.make)->Belt.List.toArray

  module Component = {
    open Emotion

    let className = css(`
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 0.5rem 1.5rem;
    `)

    @react.component
    let make = (~slotGroups) => {
      <div className>
        {slotGroups
        ->Belt.Array.mapWithIndex((index, slots) =>
          <SlotGroup.Component key={Belt.Int.toString(index)} slots />
        )
        ->React.array}
      </div>
    }
  }
}

module Letter = {
  type t = {
    char: char,
    guessed: bool,
  }

  let make = c => {char: c, guessed: false}
  let makeList = () => Belt.Array.range(65, 90)->Belt.Array.map(i => i->char_of_int->make)

  module Component = {
    open Emotion

    let className = guessed =>
      css(`
        display: flex;
        justify-content: center;
        align-items: center;
        flex-shrink: 0;

        width: 2rem;
        height: 2rem;

        background: ${Shared.Colors.lightGray};
        border-radius: 0.5rem;
        opacity: ${guessed ? "0.3" : "1"};

        font-size: 1rem;
      `)

    @react.component
    let make = (~letter, ~onLetterClick) => {
      let onClick = _ => {
        onLetterClick(letter)
      }

      <kbd className={className(letter.guessed)} onClick>
        {letter.char->string_of_char->React.string}
      </kbd>
    }
  }
}

module Component = {
  open Emotion

  let main = css(`
    display: grid;
    grid-template-rows: auto 1fr auto;
    gap: 0.5rem;

    padding: 0 0.5rem;
  `)

  let imageContainer = css(`
    position: relative;

    > img {
      position: absolute;
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  `)

  let lettersContainer = css(`
    display: flex; 
    gap: 0.5rem;

    overflow-x: scroll;
  `)

  @react.component
  let make = () => {
    let (round, setRound) = React.useState(_ => 1)
    let (slotGroups, setSlotGroups) = React.useState(_ => [])
    let (letters, setLetters) = React.useState(_ => [])
    let (showResultAnimation, setShowResultAnimation) = React.useState(_ => None)

    let numberOfRounds = Data.numberOfRounds
    let img = `/assets/bandlogos/${Data.shuffledBands[round - 1]}.jpg`

    React.useEffect1(() => {
      setSlotGroups(_ => SlotGroups.make(Data.shuffledBands[round - 1]))
      setLetters(_ => Letter.makeList())

      None
    }, [round])

    let onLetterClick = (clickedLetter: Letter.t) => {
      if !clickedLetter.guessed {
        // set letter guessed to true
        setLetters(
          Array.map(letter => {
            if letter === clickedLetter {
              {...letter, guessed: true}
            } else {
              letter
            }
          }),
        )

        // count all slots with this character
        let count = Belt.Array.reduce(slotGroups, 0, (result, slotGroup) =>
          Belt.Array.reduce(slotGroup, result, (subresult, slot) =>
            slot.char === clickedLetter.char ? subresult + 1 : subresult
          )
        )
        if count > 0 {
          // reveal slots
          setSlotGroups(
            Array.map(
              Array.map((slot: Slot.t) => {
                if slot.char === clickedLetter.char {
                  {...slot, hidden: false}
                } else {
                  slot
                }
              }),
            ),
          )
          setShowResultAnimation(_ => Some(ResultAnimation.Right))
        } else {
          setShowResultAnimation(_ => Some(ResultAnimation.Wrong))
        }
      }
    }

    let onResolveClick = _ => {
      setSlotGroups(Array.map(Array.map((slot: Slot.t) => {...slot, hidden: false})))
    }

    let onNextRoundClick = _ => {
      if round < numberOfRounds {
        setRound(succ)
      }
    }

    let onCloseResultAnimation = () => {
      setShowResultAnimation(_ => None)
    }

    <div className=Shared.Styles.fullscreenContainer>
      <Header.Component name=meta.name round=1 numberOfRounds=1 />
      <main className=main>
        <SlotGroups.Component slotGroups />
        <div className=imageContainer> <img src=img /> </div>
        <div className=lettersContainer>
          {letters
          ->Belt.Array.mapWithIndex((index, letter) =>
            <Letter.Component key={Belt.Int.toString(index)} letter onLetterClick />
          )
          ->React.array}
        </div>
      </main>
      <footer className=Shared.Styles.footer>
        <button className=Shared.Styles.button onClick=onResolveClick>
          {React.string(`Auflösen`)}
        </button>
        <button className=Shared.Styles.primaryButton onClick=onNextRoundClick>
          {React.string(`Nächste Runde`)}
        </button>
      </footer>

      <ResultAnimation.Component value=showResultAnimation onAnimationEnd=onCloseResultAnimation />
    </div>
  }
}
