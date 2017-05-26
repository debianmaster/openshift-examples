
'use strict';

// You use the `ResourceVersion` when making the initial query.  So keep track
// of that upon successful reads and when you need to recreate the watcher from
// the last known point, pass in the `ResourceVersion` in the query.
// Copied from https://gist.github.com/cheapRoc/979f3436244d8c22b21ccc5a925a9ca5

const fs = require('fs')
const https = require('https')
process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";
const K8S_HOST = process.env['K8S_HOST'] || '10.100.0.1'
const K8S_PORT = process.env['K8S_PORT'] || '8443'
const K8S_SECRET = process.env['K8S_SECRET'] ||
  fs.readFileSync('/var/run/secrets/kubernetes.io/serviceaccount/token', 'utf-8')

var req = https.request({
  host: K8S_HOST,
  strictSSL: false,
  port: K8S_PORT,
  method: 'GET',
  path: '/api/v1/namespaces?watch=true',
  headers: {
    Authorization: 'Bearer ' + K8S_SECRET
  }
}, (res) => {
  console.log('Watching namespace events...')

  res.setEncoding('utf8')

  res.on('data', (chunk) => {
    const rawEvents = chunk.split('\n')
    rawEvents.forEach(function (rawEvent) {
      if (rawEvent.length > 0) {
        console.log(rawEvent);
        //const event = JSON.parse(rawEvent)
        //console.log('    %s was %s', event.object.metadata.name, event.type.charAt(0) + event.type.substring(1).toLowerCase())
      }
    })
  })

  res.on('end', () => {
    console.log('  Event stream closed...')
  })
})

req.on('error', (err) => {
  console.log(err);
  console.log('Problem with request: %s', err.message)
});

req.end()


