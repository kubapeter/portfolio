const http = require('http')
const server = http.createServer( (request, response) => {

    response.writeHead(200, {'Content-type': 'text/html'})
    if(request.method === 'GET') {
        response.end('GET')
    }
    if(request.method === 'POST') {
        response.end('POST')
    }
    if(request.method === 'PUT') {
        response.end('PUT')
    }
    if(request.method === 'DELETE') {
        response.end('DELETE')
    }

}).listen(3000, () => console.log("http://localhost:3000"))
