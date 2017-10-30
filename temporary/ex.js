var fs = require('fs'); var access = fs.createWriteStream('temporary/ex.txt'); access.truncate; process.stdout.write = process.stderr.write = access.write.bind(access); process.on('uncaughtException', function(err) { console.error((err && err.stack) ? err.stack : err); });
console.log("javascript");
