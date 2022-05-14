module Data = {
  type sortableItem = {
    name: string,
    value: int,
  }

  type question = {
    name: string,
    less: string,
    more: string,
    answers: array<sortableItem>,
  }

  let shuffledQuestions = Belt.Array.shuffle([
    {
      name: "aktuelle Bandmitglieder (Stand 13.05.2022)",
      less: "weniger",
      more: "mehr",
      answers: Belt.Array.shuffle([
        {name: "Slipknot", value: 9},
        {name: "Iron Maiden", value: 6},
        {name: "AC/DC", value: 5},
        {name: "Blink-182", value: 3},
        {name: "Metallica", value: 4},
        {name: "Guns n' Roses", value: 7},
      ]),
    },
    {
      name: "Facebook-Follower (Stand 13.05.2022)",
      less: "weniger",
      more: "mehr",
      answers: Belt.Array.shuffle([
        {name: "Linkin Park", value: 56_777_419},
        {name: "System Of A Down", value: 19_389_514},
        {name: "Metallica", value: 36_640_352},
        {name: "Rihanna", value: 102_218_972},
        {name: "Foo Fighters", value: 12_209_167},
        {name: "Rammstein", value: 8_660_305},
      ]),
    },
    {
      name: `mtl. Spotify-Zuhörer (Stand 13.05.2022)`,
      less: "weniger",
      more: "mehr",
      answers: Belt.Array.shuffle([
        {name: "Bury Tomorrow", value: 617_975},
        {name: `Ghøstkid`, value: 274_386},
        {name: "Blackout Problems", value: 72_999},
        {name: "Infected Rain", value: 66_578},
        {name: "Paleface", value: 182_139},
      ]),
    },
    {
      name: `Festival-Besucher`,
      less: "weniger",
      more: "mehr",
      answers: Belt.Array.shuffle([
        {name: "Rock Hard", value: 7500},
        {name: "Rage against Racism", value: 3000},
        {name: "Full Force", value: 25000},
        /* {name: "Dong", value: 2000}, */
        {name: "Wacken", value: 75000},
        {name: "Party.San", value: 8000},
        {name: "Rock am Ring", value: 87000},
        {name: "Summer Breeze", value: 40000},
        {name: "Vainstream", value: 16000},
      ]),
    },
    {
      name: `Bandgründung`,
      less: `früher`,
      more: `später`,
      answers: [
        /* {name: `The Beatles`, value: 1960}, */
        {name: `The Rolling Stones`, value: 1962},
        /* {name: `Scorpions`, value: 1965}, */
        {name: `Led Zeppelin`, value: 1968},
        {name: `Black Sabbath`, value: 1969},
        {name: `Queen`, value: 1970},
        /* {name: `Van Halen`, value: 1972}, */
        /* {name: `Kiss`, value: 1973}, */
        {name: `Iron Maiden`, value: 1975},
        {name: `Misfits`, value: 1977},
        {name: `Slayer`, value: 1981},
        {name: `Guns n' Roses`, value: 1985},
      ],
    },
    {
      name: `Todesjahr`,
      less: `früher`,
      more: `später`,
      answers: [
        {name: `John Lennon`, value: 1980},
        {name: `Jimi Hendrix`, value: 1970},
        {name: `Freddie Mercury`, value: 1991},
        {name: `Kurt Cobain`, value: 1994},
        {name: `Dio`, value: 2010},
        {name: `Lemmy`, value: 2015},
        {name: `Malcom Young`, value: 2017},
      ],
    },
  ])

  let numberOfRounds = Belt.Array.length(shuffledQuestions)
}

let getPointerPosition: ReactEvent.Pointer.t => Shapes.point = event => {
  x: ReactEvent.Pointer.pageX(event),
  y: ReactEvent.Pointer.pageY(event),
}

let getPointerTarget: ReactEvent.Pointer.t => Browser.htmlElement = event => {
  event->ReactEvent.Pointer.currentTarget->Obj.magic
}

let setTranslation: (Browser.htmlElement, Shapes.point) => unit = %raw(`
  function(element, delta) {
    element.style.transform = "translate(" + delta.x + "px, " + delta.y + "px)";
  }
`)

let isItemInRightOrder = (
  selectedItem: Data.sortableItem,
  itemBefore: option<Data.sortableItem>,
  itemAfter: option<Data.sortableItem>,
) => {
  switch (itemBefore, itemAfter) {
  // first
  | (None, Some(after)) => selectedItem.value < after.value

  // between
  | (Some(before), Some(after)) =>
    selectedItem.value > before.value && selectedItem.value < after.value

  // last
  | (Some(before), None) => selectedItem.value > before.value

  // won't happen
  | _ => false
  }
}

let intToLocaleString: int => string = %raw(`
  function(int) {
    if (int < 3000) {
      return int.toString();
    }

    return int.toLocaleString();
  }
`)

module Component = {
  open Emotion

  let main = css(`
    touch-action: none;

    display: flex;
    flex-direction: column;
    justify-content: space-between;

    padding: 0 0.5rem;
  `)

  let name = css(`
    margin-bottom: 0.5rem;

    text-align: center;
  `)

  let legend = css(`
    text-align: center;
    font-size: 0.8rem;
  `)

  let slot = css(`
    padding: 0.25rem 0;

    /* transition: margin .2s; */

    &.spaceTop {
      margin-top: 2.5rem;
    }

    &.spaceBottom {
      margin-bottom: 2.5rem;
    }
  `)

  let optionsContainer = css(`
    display: flex;
    flex-direction: column;
    
    gap: 0.5rem;
  `)

  let itemStyle = css(
    `
    display: flex;
    justify-content: space-between;
    align-items: center;

    height: 1rem;
    padding: 0.5rem;

    background: ${Shared.Colors.lightGray};
    border-radius: 0.5rem;

    &.dragging {
      z-index: 1;

      color: ${Shared.Colors.yellow};
      background: ${Shared.Colors.orange};
      box-shadow: 5px 5px 5px rgba(0, 0, 0, .2);
    }
  `,
  )

  type draggingItem = {
    item: Data.sortableItem,
    element: Browser.htmlElement,
    startX: int,
    startY: int,
  }

  @react.component
  let make = () => {
    let (round, setRound) = React.useState(_ => 1)
    let (options, setOptions) = React.useState(_ => [])
    let (sortedList, setSortedList) = React.useState(_ => [])
    let (selectedItem, setSelectedItem) = React.useState(_ => None)
    let (dropZones, setDropZones) = React.useState(_ => [])
    let (showResultAnimation, setShowResultAnimation) = React.useState(_ => None)

    let currentQuestion = Data.shuffledQuestions[round - 1]
    let numberOfRounds = Data.numberOfRounds

    React.useEffect1(() => {
      setSortedList(_ => [currentQuestion.answers[0]])
      setOptions(_ => Belt.Array.sliceToEnd(currentQuestion.answers, 1))

      None
    }, [round])

    let onStartDraggingItem = (item, e) => {
      let element = getPointerTarget(e)
      let startX = ReactEvent.Pointer.pageX(e)
      let startY = ReactEvent.Pointer.pageY(e)

      element.classList.add(."dragging")
      setSelectedItem(_ => Some({item: item, element: element, startX: startX, startY: startY}))

      setDropZones(_ =>
        Browser.document.body
        ->Browser.querySelectorAll("." ++ slot)
        ->Belt.Array.map(element => (element, element.getBoundingClientRect(.)))
      )
    }

    let onDraggingItem = (item, e) => {
      let point = getPointerPosition(e)

      let dx = point.x - item.startX
      let dy = point.y - item.startY

      setTranslation(item.element, {x: dx, y: dy})

      dropZones->Belt.Array.forEach(((dropZone, rect)) => {
        if Shapes.insideRect(point, rect) {
          if Shapes.isAboveCenter(point, rect) {
            dropZone.classList.add(. "spaceTop")
            dropZone.classList.remove(. "spaceBottom")
          } else {
            dropZone.classList.add(. "spaceBottom")
            dropZone.classList.remove(. "spaceTop")
          }
        } else {
          dropZone.classList.remove(. "spaceTop")
          dropZone.classList.remove(. "spaceBottom")
        }
      })
    }

    let onDroppedOnItem = (item, point, index) => {
      let (_, rect) = dropZones[index]

      let sortedListIndex = if Shapes.isAboveCenter(point, rect) {
        index
      } else {
        index + 1
      }

      let itemBefore = Belt.Array.get(sortedList, sortedListIndex - 1)
      let itemAfter = Belt.Array.get(sortedList, sortedListIndex)

      let correct = isItemInRightOrder(item.item, itemBefore, itemAfter)

      if correct {
        setOptions(_ => ArrayUtils.remove(options, item.item))
        setSortedList(_ => ArrayUtils.insertAt(sortedList, item.item, sortedListIndex))
        setShowResultAnimation(_ => Some(ResultAnimation.Right))
      } else {
        setTranslation(item.element, {x: 0, y: 0})
        setShowResultAnimation(_ => Some(ResultAnimation.Wrong))
      }
    }

    let onStopDraggingItem = (item, e) => {
      let point = getPointerPosition(e)

      let dropZoneIndex =
        dropZones->Belt.Array.getIndexBy(((_, rect)) => Shapes.insideRect(point, rect))

      switch dropZoneIndex {
      | Some(index) => onDroppedOnItem(item, point, index)
      | None => ()
      }

      item.element.classList.remove(."dragging")
      setSelectedItem(_ => None)

      dropZones->Belt.Array.forEach(((dropZone, _)) => {
        dropZone.classList.remove(. "spaceTop")
        dropZone.classList.remove(. "spaceBottom")
      })
    }

    let onPointerUp = e => {
      switch selectedItem {
      | Some(item) => onStopDraggingItem(item, e)
      | None => ()
      }
    }

    let onPointerMove = e => {
      switch selectedItem {
      | Some(item) => onDraggingItem(item, e)
      | None => ()
      }
    }

    let onResolveClick = _ => {
      setOptions(_ => [])

      setSortedList(_ =>
        Belt.SortArray.stableSortBy(currentQuestion.answers, (a, b) => compare(a.value, b.value))
      )
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
      <header className=Shared.Styles.header>
        <h1> 
          {React.string(Games.sortieren.name)} 
          /* <a href="/">{React.string(`⬅`)}</a> */
          <BackButton.Component />
        </h1>
        <div> {React.string(j`Runde $round / $numberOfRounds`)} </div>
      </header>
      <main className=main onPointerMove onPointerUp>
        <div>
          <div className=name> {React.string(currentQuestion.name)} </div>
          <div className=legend> {React.string(currentQuestion.less)} </div>
          {sortedList
          ->Belt.Array.map(item => {
            <div className=slot key={Belt.Int.toString(item.value)}>
              <div className=itemStyle>
                <span> {React.string(item.name)} </span>
                <span> {item.value->intToLocaleString->React.string} </span>
              </div>
            </div>
          })
          ->React.array}
          <div className=legend> {React.string(currentQuestion.more)} </div>
        </div>
        <div className=optionsContainer>
          {options
          ->Belt.Array.map(item =>
            <div
              key={Belt.Int.toString(item.value)}
              className=itemStyle
              onPointerDown={onStartDraggingItem(item)}>
              {React.string(item.name)}
            </div>
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
