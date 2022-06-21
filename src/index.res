module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()

    switch url.hash {
      | ""  => <Home.Component /> 
      | "/appicons-zeichnen" => <Appicons.Component /> 
      | "/bandlogo-hangman" => <Hangman.Component />
      | "/maskottchen" => <Mascot.Component />
      | "/porno-pantomime" => <Pantomime.Component />
      | "/sortieren" => <SortDnD.Component />
      | "/ja-oder-nein" => <YesNo.Component />
      | _  => <div>{React.string("404")}</div> 
    } 
  }
}

let root = React18.createRoot(ReactDOM.querySelector("#app")->Belt.Option.getExn)
React18.Root.render(root, <App />)
