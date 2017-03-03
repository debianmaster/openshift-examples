var Minio = require('minio');
var Fs = require('fs');

console.log("using following auth",process.env.accessKey,process.env.secretKey);

var s3Client = new Minio.Client({
  endPoint: 'minio-ocp',
  port: 9000,
  secure: false,
  accessKey: process.env.accessKey,
  secretKey: process.env.secretKey
})

// Put a file in bucket my-bucketname.
var file = 'my-testfile.txt'
s3Client.fPutObject('my-bucketname', 'my-objectname', file, 'application/octet-stream', function(e) {
  if (e) {
    return console.log(e)
  }
  console.log("Success")
});
