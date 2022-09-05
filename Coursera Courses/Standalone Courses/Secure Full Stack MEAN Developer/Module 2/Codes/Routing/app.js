const http = require('http')
const server = http.createServer( (request, response) => {

    response.writeHead(200, {'Content-type': 'text/html'})
    
    if(request.url === '/get') {
        response.write('You have reached the GET page')
        if(request.method === 'GET') {
            response.end('GET')
        }
    }
    else if(request.url === '/post') {
        response.write('You have reached the POST page')
        if(request.method === 'POST') {
            response.end('POST')
        }
    }
    else if(request.url === '/put') {
        response.write('You have reached the PUT page')
        if(request.method === 'PUT') {
            response.end('PUT')
        }
    }
    else if(request.url === '/delete') {
        response.write('You have reached the DELETE page')
        if(request.method === 'DELETE') {
            response.end('DELETE')
        }
    }
    else {
        response.end('None Found')
    }
    response.end()

}).listen(3000, () => console.log("http://localhost:3000"))
