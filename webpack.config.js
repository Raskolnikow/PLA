module.exports = {
    entry: {
        filename: './src/app.js'
    },
    output: {
        filename: 'wwwroot/bundle.js'
    },
    devtool: '#inline-source-map',
    module: {
        loaders: [
            {
                test: /\.js$/,
                loader: 'babel-loader',
                query: {
                    presets: ['es2015']
                }
            }
        ]
    }
}