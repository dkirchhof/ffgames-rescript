type classList = {
  add: (. string) => unit,
  remove: (. string) => unit,
}

type htmlElement = {
  classList: classList,
  getBoundingClientRect: (.unit) => Shapes.rect,
}

type document = {
  body: htmlElement,
}

@val external document: document = "document"

let querySelectorAll: (htmlElement, string) => array<htmlElement> = %raw(`
  function(element, query) {
    const nodeList = element.querySelectorAll(query);
    
    return [...nodeList];
  }
`)
