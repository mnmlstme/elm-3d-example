import React from 'react'
import ReactDOM from 'react-dom'
//import { Elm } from './src/Main.elm'
//import html from './README.md'
//import html from './src/Workbook.kr'
import {
  platform,
  model,
  doc,
  html,
  mount } from '../workbooks/ReactWorkbook.kr'

console.log("Platform: ", platform)
console.log("Model: ", model)
console.log("HTML:\n", html)

let docs = document.getElementById('docs')

docs.innerHTML = html

let node = document.getElementById('main')

mount(node, model)


//var app = Elm.Main.init({
//  node: document.getElementById( 'elm-mountpoint' )
//})

// app.ports.input.send(html)
