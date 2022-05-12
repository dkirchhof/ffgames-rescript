module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.hash {
      | ""  => <Home.Component /> 
      | "/appicons-zeichnen" => <Appicons.Component /> 
      | "/bandlogo-hangman" => <Hangman.Component />
      | "/porno-pantomime" => <Pantomime.Component />
      /* | "/sortieren" => <Sort.Component /> */
      | "/sortieren" => <SortDnD.Component />
      | "/wer-kommt" => <YesNo.Component />
      | _  => <div>{React.string("404")}</div> 
    } 
  }
}

let root = React18.createRoot(ReactDOM.querySelector("#app")->Belt.Option.getExn)
React18.Root.render(root, <App />)
