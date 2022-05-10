type classList = {
  add: (. string) => unit,
  remove: (. string) => unit,
}

type htmlElement = {
  classList: classList,
  getBoundingClientRect: (.unit) => Shapes.rect,
}

let querySelectorAll: (htmlElement, string) => array<htmlElement> = %raw(`
  function(element, query) {
    const nodeList = element.querySelectorAll(query);
    
    return [...nodeList];
  }
`)
