const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.prepend("Provide", new webpack.ProvidePlugin({

$: 'jquery/src/jquery',

jQuery: 'jquery/src/jquery',

"datatables.net-bs4":  'datatables.net-bs4/js/dataTables.bootstrap4',

Popper: ['popper.js', 'default']

}))

module.exports = environment
