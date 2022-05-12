let setTranslation: (Browser.htmlElement, Shapes.point) => unit = %raw(`
  function(element, delta) {
    element.style.transform = "translate(" + delta.x + "px, " + delta.y + "px)";
  }
`)

type sortableItem = {
  name: string,
  value: int,
}

module Component = {
  open Emotion

  let main = css(`
    touch-action: none;

    display: flex;
    flex-direction: column;
    justify-content: space-between;

    padding: 0 0.5rem;
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

  type draggingItem<'a> = {
    item: Browser.htmlElement,
    startX: int,
    startY: int,
  }

  @react.component
  let make = () => {
    let draggingItem = React.useRef(None)
    let dropZones = React.useRef([])
    let (round, setRound) = React.useState(_ => 1)
    let (showResultAnimation, setShowResultAnimation) = React.useState(_ => None)

    let (options, setOptions) = React.useState(_ => [
      {name: "zehn", value: 10},
      {name: "null", value: 0},
      {name: "acht", value: 8},
    ])

    let (sortedList, setSortedList) = React.useState(_ => [
      {name: "sechs", value: 6},
      {name: "sieben", value: 7},
      {name: "elf", value: 11},
    ])

    let numberOfRounds = 10 // Data.numberOfRounds

    let onPointerDown = e => {
      let item: Browser.htmlElement = ReactEvent.Pointer.currentTarget(e)->Obj.magic
      let startX = ReactEvent.Pointer.pageX(e)
      let startY = ReactEvent.Pointer.pageY(e)

      item.classList.add(. "dragging")

      draggingItem.current = Some({item: item, startX: startX, startY: startY})

      dropZones.current =
        Browser.document.body
        ->Browser.querySelectorAll("." ++ slot)
        ->Belt.Array.map(element => (element, element.getBoundingClientRect(.)))
    }

    let onPointerUp = e => {
      switch draggingItem.current {
      | Some(item) => {
          let point: Shapes.point = {
            x: ReactEvent.Pointer.pageX(e),
            y: ReactEvent.Pointer.pageY(e),
          }

          let dropZoneIndex =
            dropZones.current->Belt.Array.getIndexBy(((_, rect)) => Shapes.insideRect(point, rect))

          let value = 25
          let items = [20, 30]

          switch dropZoneIndex {
          | Some(index) => {
              let itemBefore = Belt.Array.get(items, index - 1)
              let itemAfter = Belt.Array.get(items, index)

              let correct = switch (itemBefore, itemAfter) {
              // first
              | (None, Some(after)) => value < after

              // between
              | (Some(before), Some(after)) => value > before && value < after

              // last
              | (Some(before), None) => value > before

              // error
              | (None, None) => false
              }

              Js.log(correct)
            }
          | None => ()
          }

          item.item.classList.remove(. "dragging")

          setTranslation(item.item, {x: 0, y: 0})
          draggingItem.current = None
        }
      | None => ()
      }
    }

    let onPointerMove = e => {
      switch draggingItem.current {
      | Some(item) => {
          ReactEvent.Pointer.preventDefault(e)

          let point: Shapes.point = {
            x: ReactEvent.Pointer.pageX(e),
            y: ReactEvent.Pointer.pageY(e),
          }

          let dx = point.x - item.startX
          let dy = point.y - item.startY

          setTranslation(item.item, {x: dx, y: dy})

          dropZones.current->Belt.Array.forEach(((dropZone, rect)) => {
            if Shapes.insideRect(point, rect) {
              if point.y < rect.y + rect.height / 2 {
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
      | None => ()
      }
    }

    let onNextRoundClick = _ => {
      if round < numberOfRounds {
        setRound(r => r + 1)
      }
    }

    let onCloseResultAnimation = () => {
      setShowResultAnimation(_ => None)
    }

    <div className=Shared.Styles.fullscreenContainer>
      <header className=Shared.Styles.header>
        <h1> {React.string(Games.sortieren.name)} </h1>
        <div> {React.string(j`Runde $round / $numberOfRounds`)} </div>
      </header>
      <main className=main onPointerMove onPointerUp>
        <div>
          <div className=legend> {React.string("weniger Bandmitglieder")} </div>

          {sortedList
          ->Belt.Array.mapWithIndex((index, item) => {
            <div className=slot key={Belt.Int.toString(index)}>
              <div className=itemStyle>
                <span> {React.string(item.name)} </span>
                <span> {item.value->Belt.Int.toString->React.string} </span>
              </div>
            </div>
          })
          ->React.array}

          <div className=legend> {React.string("mehr Bandmitglieder")} </div>
        </div>
        <div className=optionsContainer>
          {options
          ->Belt.Array.mapWithIndex((index, item) =>
            <div key={Belt.Int.toString(index)} className=itemStyle onPointerDown>
              {React.string(item.name)}
            </div>
          )
          ->React.array}
        </div>
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

