
// const express = require('express');
// const app = express();
// const cors = require('cors');
// const PORT = process.env.PORT || 3000;
// const httpsLocalhost = require("https-localhost")()
// // const https = require('https');
// // app.use(cors());
// // const certs = httpsLocalhost.getCerts()
// // https.createServer(certs, app).listen(PORT, ()=> {
// //     console.log(`Server is running on port ${PORT}`);
// // })


// const fs = require('fs');
// const key = fs.readFileSync('./key.pem');
// const cert = fs.readFileSync('./cert.pem');
// var pem = require('pem')
// const https = require('https');


// app.use(express.json());
// app.use(express.urlencoded({ extended: true }));
// app.use(express.static('views'));

// // server.listen(PORT, () => {
// //     console.log(`Server is running on port ${PORT}`);
// // });

// const app2 = require("https-localhost")()
// // app is an express app, do what you usually do with express
// app2.listen(4000)


// // https.createServer({ key: key, cert: cert }, app).listen(PORT, () => {
// //     console.log("server run on port " + PORT);
// // });

// // pem.createCertificate({ days: 1, selfSigned: true }, function (err, keys) {
// //     if (err) {
// //         throw err
// //     }
// //     var app = express()

// //     app.get('/', function (req, res) {
// //         res.send('o hai!')
// //     })

// //     https.createServer({ key: keys.serviceKey, cert: keys.certificate }, app).listen(443)
// // })


const express = require('express');
// const app = require("https-localhost")()
const app  = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('views'));
app.listen(443)
