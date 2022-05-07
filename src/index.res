module App = {
  @react.component
  let make = () => {
    <Hangman />
  }
}

ReactDOM.render(<App />, ReactDOM.querySelector("#app")->Belt.Option.getExn)
