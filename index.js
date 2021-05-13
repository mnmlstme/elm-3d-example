
//import { Elm } from './src/Main.elm'
//import html from './README.md'
//import html from './src/Workbook.kr'
import {
  asset,
  front,
  html,
  dependences,
  code,
  jsx,
  elm,
  bundle,
  languages } from './workbooks/ReactWorkbook.kr'

const model = front.model

console.log("original Asset: ", asset)
console.log("Metadata: ", front)
console.log("Model: ", model)
console.log("Languages: ", languages)
console.log("Code chunks: ", code)
console.log("Dependences: ", dependences)
console.log("JSX result: ", jsx)
console.log("HTML:\n", html)
console.log("Bundle:\n", bundle)

const Main = bundle.Main

let mountpoint = document.getElementById('app-mountpoint')

ReactDOM.render(
    React.createElement(Main, {
        model
    }),
    mountpoint
)

//var app = Elm.Main.init({
//  node: document.getElementById( 'elm-mountpoint' )
//})

// app.ports.input.send(html)
