@val external process: 'a = "process"

let homeUrl = if process["env"]["NODE_ENV"] === "production" {
  "/ffgames/#"
} else {
  "/#"
}

let baseUrl = if process["env"]["NODE_ENV"] === "production" {
  "/ffgames"
} else {
  ""
}
