var webpack = require("webpack");

const paths = {
  js: __dirname + "/app/assets/javascripts",
  jsx: __dirname + "/app/jsx",
}

module.exports = {
  entry: paths.jsx + "/app",
  output: {
    path: paths.js,
    filename: "react-app.js",
  },
  resolve: {
    extensions: ["", ".js", ".jsx"]
  },
  module: {
    loaders: [{
      test: /\.jsx$/,
      exclude: /node_modules/,
      loader: 'babel-loader',
      query: {
        presets: ['react', 'es2015']
      }
    }]
  },
  plugins: [
     new webpack.ProvidePlugin({
        React: "react",
        PropTypes: "prop-types",
        update: "react-addons-update",
        mui: "material-ui",
        t: "counterpart",
        config: __dirname + "/config/react_app",
     })
  ],
}
