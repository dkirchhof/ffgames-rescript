module Component = {
  open Emotion
  
  let className = css(`
    position: absolute;
    left: 0;
    top: 0;
    width: 3rem;
    height: 60px;

    display: flex;
    align-items: center;
    justify-content: center;

    color: ${Shared.Colors.yellow};

    > svg {
      display: block;
      width: 1.3rem;
      height: 1.3rem;
    }
  `)

  @react.component
  let make = () => {
    <a href="/" className>
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <path
          d=" M 16.5 2 L 7.5 12 L 16.5 22"
          fill="none"
          strokeWidth="2"
          stroke="currentColor"
          strokeLinejoin="round"
          strokeLinecap="round"
        />
      </svg>
    </a>
  }
}
