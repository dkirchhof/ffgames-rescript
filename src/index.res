module App = {
  @react.component
  let make = () => {
    /* <Hangman.Component /> */
    /* <Pantomime.Component /> */
    <Appicons.Component />
  }
}

ReactDOM.render(<App />, ReactDOM.querySelector("#app")->Belt.Option.getExn)
