const path = require('path')

module.exports = {
  target: 'node',
  mode: 'none',
  entry: {
    webpack: './src/webpack.ts',
    repl: './src/repl.ts',
    status: './src/status.ts'
  },
  resolve: {
    mainFields: ['module', 'main'],
    extensions: ['.js', '.ts']
  },
  output: {
    path: path.join(__dirname, '../coc-extensions'),
    filename: '[name].js',
    libraryTarget: 'commonjs'
  },
  module: {
    rules: [{
      test: /\.ts$/,
      exclude: /node_modules/,
      use: 'ts-loader'
    }]
  },
  externals: {
    'coc.nvim': 'commonjs coc.nvim'
  }
}
