type sortableItem = {
  name: string,
  value: int,
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

let isItemInRightOrder = (selectedItem, itemBefore, itemAfter) => {
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

  type draggingItem = {
    item: sortableItem,
    element: Browser.htmlElement,
    startX: int,
    startY: int,
  }

  @react.component
  let make = () => {
    let (round, setRound) = React.useState(_ => 1)
    let (showResultAnimation, setShowResultAnimation) = React.useState(_ => None)
    let (selectedItem, setSelectedItem) = React.useState(_ => None)
    let (dropZones, setDropZones) = React.useState(_ => [])

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

    let onStartDraggingItem = (item, e) => {
      let element = getPointerTarget(e)
      let startX = ReactEvent.Pointer.pageX(e)
      let startY = ReactEvent.Pointer.pageY(e)

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

    let onStopDraggingItem = (item, e) => {
      let point = getPointerPosition(e)

      let dropZoneIndex =
        dropZones->Belt.Array.getIndexBy(((_, rect)) => Shapes.insideRect(point, rect))

      switch dropZoneIndex {
      | Some(index) => {
          let (_, rect) = dropZones->Belt.Array.getExn(index)

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
            setSortedList(_ => ArrayUtils.insertAt(sortedList, item.item, index))
            setShowResultAnimation(_ => Some(ResultAnimation.Right))
          } else {
            setTranslation(item.element, {x: 0, y: 0})
            setShowResultAnimation(_ => Some(ResultAnimation.Wrong))
          }
        }
      | None => ()
      }

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
          ->Belt.Array.map(item => {
            <div className=slot key={Belt.Int.toString(item.value)}>
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
        <button className=Shared.Styles.primaryButton onClick=onNextRoundClick>
          {React.string(`Nächste Runde`)}
        </button>
      </footer>
      <ResultAnimation.Component value=showResultAnimation onAnimationEnd=onCloseResultAnimation />
    </div>
  }
}
