const http = require('http')
const data = JSON.stringify({
    title: 'MEAN Stack'
})

const options = {
    hostname: 'localhost', 
    portnumber: 3000, 
    path: '/', 
    method: 'GET', //PUT, DELETE, POST
    headers: {
        'Content-type': 'application/JSON', 
        'Content-Length': data.length
    }
}

const request = http.request(options, response => {
    response.on('data', chunk => {
        process.stdout.write(chunk)
    })
})

response.on('error', error => {
    console.error(error)
})

request.end()
