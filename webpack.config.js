const path = require('path');
const webpack = require('webpack');
const { merge } = require('webpack-merge');
const HtmlWebpackPlugin = require('html-webpack-plugin');

const prod = 'production';
const dev = 'development';

// determine build env
const TARGET_ENV = process.env.npm_lifecycle_event === 'build' ? prod : dev;
const isDev = TARGET_ENV == dev;
const isProd = TARGET_ENV == prod;

// entry and output path/filename variables
const entryPath = path.join(__dirname, 'src/static/index.js');
const outputPath = path.join(__dirname, 'dist');
const outputFilename = isProd ? '[name]-[hash].js' : '[name].js'

commonConfig = {
  output: {
    path: outputPath,
    filename: `static/js/${outputFilename}`
  },

  resolve: {
    extensions: ['.js', '.elm'],
    modules: ['node_modules']
  },

  module: {
    rules: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: {
        loader: 'elm-webpack-loader',
        options: {
          optimize: false,
          verbose: true,
          debug: false
        }
      }
    }]
  },

  plugins: [
    new HtmlWebpackPlugin({
      template: 'src/static/index.html',
      inject: 'body',
      filename: 'index.html'
    })
  ]
}

if (isDev) {
  module.exports = merge(commonConfig, {
    entry : [
      'webpack-dev-server/client?http://localhost:3000',
      entryPath
    ],
    devServer: {
      // serve index.html in place of 404 responses
      historyApiFallback: true,
      contentBase: './src',
      hot: true,
      port: 3000
    }
  })
}

if (isProd) {
  module.exports = merge(commonConfig, {
    entry : entryPath
  })
}
