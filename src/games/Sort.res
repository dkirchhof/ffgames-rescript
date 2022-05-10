type sortableItem = {
  name: string,
  value: int,
}

module Component = {
  open Emotion

  let main = css(`
    display: flex;
    flex-direction: column;

    gap: 5rem;
  `)

  let container = css(`
    display: flex;
    flex-direction: column;
    
    gap: 0.5rem;
  `)

  let itemStyle = css(`
    display: flex;
    justify-content: space-between;
    align-items: center;

    height: 2rem;
    padding: 0.5rem;

    border: 1px solid;

    &.selected {
      border-color: red;
    }
  `)

  let slot = css(`
    height: 3rem;
    
    border: 1px dashed;
    opacity: 0.1;

    transition: opacity .2s;

    &.visible {
      opacity: 1;
    }
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
    let (options, setOptions) = React.useState(_ => [
      {name: "zehn", value: 10},
      {name: "null", value: 0},
      {name: "acht", value: 8},
    ])

    let (sortedList, setSortedList) = React.useState(_ => [{name: "sechs", value: 6}])

    let (selectedItem, setSelectedItem) = React.useState(_ => None)

    /* let value = 25 */
    /* let items = [20, 30] */

    /* switch slotIndex { */
    /* | Some(index) => { */
    /* let itemBefore = Belt.Array.get(items, index - 1) */
    /* let itemAfter = Belt.Array.get(items, index) */

    /* let correct = switch (itemBefore, itemAfter) { */
    /* // first */
    /* | (None, Some(after)) => value < after */

    /* // between */
    /* | (Some(before), Some(after)) => value > before && value < after */

    /* // last */
    /* | (Some(before), None) => value > before */

    /* // error */
    /* | (None, None) => false */
    /* } */

    /* Js.log(correct) */
    /* } */
    /* | None => () */
    /* } */

    let onItemClick = (item, _e) => {
      setSelectedItem(_ => Some(item))
    }

    let onSlotClick = (index, _e) => {
      Js.log(index)
    }

    <main className=main>
      <div className=container>
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
      </div>
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
  }
}
