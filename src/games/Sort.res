type sortableItem = {
  name: string,
  value: int,
}

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
    display: flex;
    flex-direction: column;
    justify-content: space-between;

    padding: 0 0.5rem;
  `)

  let container = css(`
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
    margin: 0.5rem 0;
    padding: 0.5rem;

    background: ${Shared.Colors.lightGray};
    border-radius: 0.5rem;

    &.selected {
      color: ${Shared.Colors.yellow};
      background-color: ${Shared.Colors.orange};
    }
  `,
  )

  let slot = css(
    `
    height: 0rem;
    
    border-radius: 0.5rem;

    transition: height .2s;

    &.visible {
      height: 2rem;
      margin: 0.5rem 0;

      border: 1px dashed ${Shared.Colors.orange};
    }
  `,
  )

  let separator = css(
    `
    width: 30%;
    height: 1px;
    margin: 0 auto;

    background: ${Shared.Colors.darkGray};
  `,
  )

  let legend = css(`
    text-align: center;
    font-size: 0.8rem;
  `)

  let getItemClassName = (item, selectedItem) => {
    switch (item, selectedItem) {
    | (item, Some(selectedItem')) if item === selectedItem' => cx([itemStyle, "selected"])
    | _ => itemStyle
    }
  }

  let getSlotClassName = selectedItem =>
    cxOption([Some(slot), selectedItem->Belt.Option.map(_ => "visible")])

  @react.component
  let make = () => {
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

    let (selectedItem, setSelectedItem) = React.useState(_ => None)

    let numberOfRounds = 10 // Data.numberOfRounds

    let onNextRoundClick = _ => {
      if round < numberOfRounds {
        setRound(r => r + 1)
      }
    }

    let onItemClick = (item, _e) => {
      setSelectedItem(_ => Some(item))
    }

    let onSlotClick = (index, _e) => {
      switch selectedItem {
      | Some(item) => {
          let itemBefore = Belt.Array.get(sortedList, index - 1)
          let itemAfter = Belt.Array.get(sortedList, index)

          let isInRightOrder = isItemInRightOrder(item, itemBefore, itemAfter)

          if isInRightOrder {
            setOptions(_ => ArrayUtils.remove(options, item))
            setSortedList(_ => ArrayUtils.insertAt(sortedList, item, index))
            setShowResultAnimation(_ => Some(ResultAnimation.Right))
          } else {
            setShowResultAnimation(_ => Some(ResultAnimation.Wrong))
          }
        }
      | None => ()
      }
    }

    let onCloseResultAnimation = () => {
      setShowResultAnimation(_ => None)
      setSelectedItem(_ => None)
    }

    <div className=Shared.Styles.fullscreenContainer>
      <header className=Shared.Styles.header>
        <h1> {React.string(Games.sortieren.name)} </h1>
        <div> {React.string(j`Runde $round / $numberOfRounds`)} </div>
      </header>
      <main className=main>
        <div>
          <div className=legend> {React.string("weniger Bandmitglieder")} </div>
          <div className={getSlotClassName(selectedItem)} onClick={onSlotClick(0)} />
          {sortedList
          ->Belt.Array.mapWithIndex((index, item) => {
            <React.Fragment key={Belt.Int.toString(index)}>
              <div className=itemStyle>
                <span> {React.string(item.name)} </span>
                <span> {item.value->Belt.Int.toString->React.string} </span>
              </div>
              <div className={getSlotClassName(selectedItem)} onClick={onSlotClick(index + 1)} />
            </React.Fragment>
          })
          ->React.array}
          <div className=legend> {React.string("mehr Bandmitglieder")} </div>
        </div>
        <div className=separator />
        <div>
          {options
          ->Belt.Array.mapWithIndex((index, item) =>
            <div
              key={Belt.Int.toString(index)}
              className={getItemClassName(item, selectedItem)}
              onClick={onItemClick(item)}>
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
