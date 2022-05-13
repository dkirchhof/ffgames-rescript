type result =
  | Right
  | Wrong

module Component = {
  open Emotion

  let fadeOut = keyframes(`
    0% {
      transform: scale(0);
      opacity: 0;
    }
    30% {
      transform: scale(1);
      opacity: 1;
    }
    70% {
      transform: scale(1);
      opacity: 1;
    }
    100% {
      transform: scale(2);
      opacity: 0;
    }
  `)

  let result = css(
    `
    position: fixed;
    inset: 0;

    display: flex;
    align-items: center;
    justify-content: center;

    animation: ${fadeOut} 1s ease-in forwards;

    ::before {
      content: "✘";

      color: ${Shared.Colors.orange};

      font-size: 30rem;
      font-size: 130vw;
    }
  `,
  )

  let wrong = css(
    `
    &::before {
      content: "✘";

      color: ${Shared.Colors.orange};
  `,
  )

  let right = css(
    `
    &::before {
      content: "✔";

      color: ${Shared.Colors.green};
  `,
  )

  @react.component
  let make = (~value, ~onAnimationEnd) => {
    switch value {
    | Some(value') => {
        let className = cx([
          result,
          switch value' {
          | Right => right
          | Wrong => wrong
          },
        ])

        <div className onAnimationEnd={_ => onAnimationEnd()} />
      }
    | None => React.null
    }
  }
}
