module App = {
  @react.component
  let make = () => {
    <Hangman.Component />
  }
}

ReactDOM.render(<App />, ReactDOM.querySelector("#app")->Belt.Option.getExn)
