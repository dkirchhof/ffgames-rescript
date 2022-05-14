open Emotion

module Colors = {
  let darkGray = "#353030"
  let lightGray = "#efefef"
  let yellow = "#EAE5D2"
  let orange = "#E05D29"
  let green = "#b8ebb8";
}

module Styles = {
  let fullscreenContainer = css(`
    position: fixed;
    inset: 0;

    display: grid;
    grid-template-rows: auto 1fr auto;

    color: ${Colors.darkGray};

    font-family: sans-serif;
  `)

  let header = css(`
    margin-bottom: 0.5rem;

    text-align: center;

    > h1 {
      position: relative;
      margin: 0;
      padding: 1rem;

      color: ${Colors.yellow};
      background-color: ${Colors.darkGray};

      font-weight: normal;
      font-size: 1.5rem;
    }

    > div {
      padding: 0.5rem;
      
      color: ${Colors.yellow};
      background-color: ${Colors.orange};

      text-align: center;
    }
  `)

  let footer = css(`
    display: flex;
    flex-direction: column;
    gap: 0.5rem;

    padding: 0.5rem;
  `)

  let button = css(`
    padding: 0.75rem;

    color: ${Colors.orange};
    background: none;
    border: 1px solid ${Colors.orange};
    border-radius: 0.5rem;

    font-size: 0.8rem;
    font-weight: bold;
    text-transform: uppercase;
  `)

  let primaryButton =
    button ++
    " " ++
    css(`
      color: ${Colors.yellow};
      background-color: ${Colors.orange};
    `)
}
