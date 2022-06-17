let meta: Game.meta = {
  name: "Maskottchen",
  url: Config.baseUrl ++ "/#/maskottchen",
}

module Data = {
  type mascot = {
    name: string,
    rightAnswer: string,
    wrongAnswers: array<string>,
  }

  let shuffledMascots = [
    {
      name: "Roy",
      rightAnswer: "Children of Bodom",
      wrongAnswers: ["Insomnium", "Dark Tranquillity", "Wintersun"],
    },
    {
      name: "The Guy",
      rightAnswer: "Disturbed",
      wrongAnswers: ["Drowning Pool", "Stone Sour", "Soil"],
    },
    {
      name: "Scary Guy",
      rightAnswer: "Metallica",
      wrongAnswers: ["Anthrax", "White Zombie", "Kreator"],
    },
    {
      name: "Eddie The Head",
      rightAnswer: "Iron Maiden",
      wrongAnswers: ["Judas Priest", "Dio", "Manowar"],
    },
    {
      name: "Hector",
      rightAnswer: "Hammerfall",
      wrongAnswers: ["Blind Guardian", "Dragonforce", "Manowar"],
    },
    {
      name: "Jack O. Lantern",
      rightAnswer: "Helloween",
      wrongAnswers: ["Dream Evil", "Primal Fear", "The Other"],
    },
    {
      name: "Knarrenheinz",
      rightAnswer: "Sodom",
      wrongAnswers: ["1914", "Donnerkopf", "Kanonenfieber"],
    },
    {
      name: "Set Abominae",
      rightAnswer: "Iced Earth",
      wrongAnswers: ["Gamma Ray", "Rage", "Grave Digger"],
    },
    {
      name: "Snaggletooth",
      rightAnswer: `Motörhead`,
      wrongAnswers: ["Danzig", "King Diamond", "Halford"],
    },
    {
      name: "Vic Rattlehead",
      rightAnswer: "Megadeth",
      wrongAnswers: ["Testament", "Exodus", "Pantera"],
    },
  ]->Belt.Array.shuffle

  let numberOfRounds = Array.length(shuffledMascots)
}

module Answer = {
  type t = {
    name: string,
    isRight: bool,
    clicked: bool,
  }

  let make = (name, isRight) => {name: name, isRight: isRight, clicked: false}

  let makeMany = (right, wrong) => {
    Belt.Array.concat(right->Belt.Array.map(make(_, true)), wrong->Belt.Array.map(make(_, false)))
  }

  let update = (answers, answer) => {
    answers->Belt.Array.map(answer' => {
      if answer' === answer {
        {...answer', clicked: true}
      } else {
        answer'
      }
    })
  }
}

module Question = {
  type t = {
    name: string,
    answers: array<Answer.t>,
  }

  let make = (mascot: Data.mascot) => {
    name: mascot.name,
    answers: Answer.makeMany([mascot.rightAnswer], mascot.wrongAnswers)->Belt.Array.shuffle,
  }

  let update = (question, answer) => {
    ...question,
    answers: Answer.update(question.answers, answer),
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

  let name = css(`
    font-size: 2rem;
    text-align: center;
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

  let answersContainer = css(`
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
  `)

  let answerButton = css(
    `
    padding: 0.75rem;

    color: ${Shared.Colors.darkGray};
    background: none;
    border: 1px solid ${Shared.Colors.darkGray};
    border-radius: 0.5rem;

    &.right {
      color: ${Shared.Colors.green};
      border: 1px solid ${Shared.Colors.green};
    }

    &.wrong {
      color: ${Shared.Colors.orange};
      border: 1px solid ${Shared.Colors.orange};
    }
  `,
  )

  let getButtonClass = (answer: Answer.t) => {
    let secondClass = switch (answer.clicked, answer.isRight) {
    | (true, true) => " right"
    | (true, false) => " wrong"
    | _ => ""
    }

    cx([answerButton, secondClass])
  }

  @react.component
  let make = () => {
    let (round, setRound) = React.useState(_ => 1)
    let (question, setQuestion) = React.useState(_ => None)
    let (showImage, setShowImage) = React.useState(_ => false)
    let (showResultAnimation, setShowResultAnimation) = React.useState(_ => None)

    React.useEffect1(() => {
      setShowImage(_ => false)
      setQuestion(_ => Some(Question.make(Data.shuffledMascots[round - 1])))

      None
    }, [round])

    let onAnswerClick = (answer: Answer.t, _) => {
      switch question {
      | Some(question') => {
          setQuestion(_ => Some(Question.update(question', answer)))

          if answer.isRight {
            setShowImage(_ => true)
            setShowResultAnimation(_ => Some(ResultAnimation.Right))
          } else {
            setShowResultAnimation(_ => Some(ResultAnimation.Wrong))
          }
        }
      | None => ()
      }
    }

    let onNextRoundClick = _ => {
      if round < Data.numberOfRounds {
        setRound(succ)
      }
    }

    let onCloseResultAnimation = () => {
      setShowResultAnimation(_ => None)
    }

    <div className=Shared.Styles.fullscreenContainer>
      <Header.Component name=meta.name round numberOfRounds=Data.numberOfRounds />
      <main className=main>
        {switch question {
        | Some(question') =>
          <React.Fragment>
            <div className=name> {React.string(question'.name)} </div>
            <div className=imageContainer>
              {showImage ? <img src={`${Config.baseUrl}/assets/mascots/${question'.name}.jpg`} /> : React.null}
            </div>
            <div className=answersContainer>
              {question'.answers
              ->Belt.Array.mapWithIndex((index, answer) =>
                <button
                  className={getButtonClass(answer)}
                  key={Belt.Int.toString(index)}
                  onClick={onAnswerClick(answer)}>
                  {React.string(answer.name)}
                </button>
              )
              ->React.array}
            </div>
          </React.Fragment>
        | None => React.null
        }}
      </main>
      <footer className=Shared.Styles.footer>
        <button className=Shared.Styles.primaryButton onClick=onNextRoundClick>
          {React.string(`Nächste Runde`)}
        </button>
      </footer>
      <ResultAnimation.Component value=showResultAnimation onAnimationEnd=onCloseResultAnimation />
    </div>
  }
}
