const { environment } = require("@rails/webpacker");
const webpack = require("webpack");

// Adds `var jQuery = require('jquery') to legacy jQuery plugins
environment.plugins.append(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    jquery: "jquery"
  })
);

// Adds window.$ = require('jquery')
environment.loaders.append("jquery", {
  test: require.resolve("jquery"),
  use: [
    {
      loader: "expose-loader",
      options: "$"
    }
  ]
});

module.exports = environment;
