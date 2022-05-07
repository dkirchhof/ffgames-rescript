@react.component
let make = () => {
  let (round, _setRound) = React.useState(_ => 1)

  let currentName = Data.shuffledNames[round]

  <div> {React.string(currentName)} </div>
}
