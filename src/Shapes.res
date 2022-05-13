type point = {
  x: int,
  y: int,
}

type rect = {
  x: int,
  y: int,
  width: int,
  height: int,
}

let insideRect = (point: point, rect: rect) => {
  point.x >= rect.x &&
  point.x < rect.x + rect.width &&
  point.y >= rect.y &&
  point.y < rect.y + rect.height
}

let isAboveCenter = (point: point, rect: rect) => {
  point.y < rect.y + rect.height / 2
}
