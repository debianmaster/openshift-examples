var Minio = require('minio')
var Fs = require('fs')

var s3Client = new Minio.Client({
  endPoint: 'minio-ocp',
  port: 9000,
  secure: false,
  accessKey: 'DPO3DZYQZH56IAYX1GHX',
  secretKey: '4d+mrYsg8qdJPFBFpBbtly9oL7IQZsKsyx14Nvc8'
})

// Put a file in bucket my-bucketname.
var file = 'my-testfile.txt'
s3Client.fPutObject('my-bucketname', 'my-objectname', file, 'application/octet-stream', function(e) {
  if (e) {
    return console.log(e)
  }
  console.log("Success")
});
