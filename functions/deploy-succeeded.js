const request = require('request');

const pageEndpoints = [
  "docs/concepts/extend-kubernetes/extend-cluster/"
]

const logHeaders = (header) => {
  console.log(header);
}

exports.handler = function(event, context, callback) {
  pageEndpoints.forEach((endpoint) => {
    const url = `https://kubernetes.io/${endpoint}`;
    request(url, { json: false }, (err, res, body) => {
      res.headers.forEach(logHeaders);
    });
  });

  callback(null, {
    statusCode: 200,
    body: "The requested pages are being properly indexed"
  })
}
