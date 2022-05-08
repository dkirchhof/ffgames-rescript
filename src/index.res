module App = {
  @react.component
  let make = () => {
    /* <Hangman.Component /> */
    /* <Pantomime.Component /> */
    <Appicons.Component />
  }
}

let root = React18.createRoot(ReactDOM.querySelector("#app")->Belt.Option.getExn)
React18.Root.render(root, <App />)
