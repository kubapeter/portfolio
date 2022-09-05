const http = require('http')
const server = http.createServer( (request, response) => {

    response.writeHead(200, {'Content-type': 'text/html'})
    response.write('<h1>Welcome to Node.js!</h1>')
    response.end()

    // or one can do the following to avoid not to end the response:
    //
    //response.writeHead(200, {'Content-type': 'text/html'})
    //response.end('<h1>Welcome to Node.js!</h1>')
    //
    // there is no response.write() at all

})

server.listen(3000, () => console.log("http://localhost:3000"))

// one can also use this compact format:
//
// http.createServer( (request, response) => {
//     response.writeHead(200, {'Content-type': 'text/html'})
//     response.end('<h1>Welcome to Node.js!</h1>')
// }).listen(3000, () => console.log("http://localhost:3000"))
//
// there is no distinct server.listen() line
// there is no const server declaration (problem for multiple servers)
