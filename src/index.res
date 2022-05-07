module App = {
  @react.component
  let make = () => {
    /* <Hangman.Component /> */
    <Pantomime.Component />
  }
}

ReactDOM.render(<App />, ReactDOM.querySelector("#app")->Belt.Option.getExn)
