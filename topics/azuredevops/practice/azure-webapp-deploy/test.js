const assert = require('assert');
const http = require('http');

const options = {
  hostname: 'localhost',
  port: 3000,
  path: '/',
  method: 'GET'
};

const req = http.request(options, (res) => {
  assert.strictEqual(res.statusCode, 200);
  let data = '';

  res.on('data', chunk => {
    data += chunk;
  });

  res.on('end', () => {
    assert.strictEqual(data, 'Hello from Azure DevOps!');
    console.log('Test passed');
    process.exit(0);
  });
});

req.on('error', (e) => {
  console.error(`Problem with request: ${e.message}`);
  process.exit(1);
});

req.end();
