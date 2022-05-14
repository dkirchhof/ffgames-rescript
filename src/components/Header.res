module Component = {
  @react.component
  let make = (~name, ~round, ~numberOfRounds) => {
    <header className=Shared.Styles.header>
      <h1>
        {React.string(name)}
        <BackButton.Component />
      </h1>
      <div> {React.string(`Runde ${Belt.Int.toString(round)} / ${Belt.Int.toString(numberOfRounds)}`)} </div>
    </header>
  }
}
