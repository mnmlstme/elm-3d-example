// inject bundled Elm app into div#main
const app = require( '../elm/Main' );
app.Elm.Main.init({ node: document.getElementById( 'main' ) });
