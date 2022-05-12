let insertAt = (array, item, index) => {
  let before = Belt.Array.slice(array, ~offset=0, ~len=index)
  let after = Belt.Array.sliceToEnd(array, index)

  Belt.Array.concatMany([before, [item], after])
}

let remove = (array: array<'a>, itemToRemove: 'a) => {
  Belt.Array.keep(array, item => item !== itemToRemove)
}
