let fs = require('fs')

let total = 0

// I/O Cycle
fs.readFile('./index.js', () => {
    setTimeout(print1, 0)
    setImmediate(print2)
})

let n = 1

function print1() {
    total =  n * 10
    console.log("Total1: ", total)
    n++
}

function print2() {
    total =  n * 10
    console.log("Total2: ", total)
}
