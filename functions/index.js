const functions = require('firebase-functions');

exports.generatePaymentLinks = functions.https.onRequest((req, res) => {
  const paymentLinks = {
    returnURL: 'https://nanny-fairy/paymentSuccess',
    cancelURL: 'https://nanny-fairy/paymentFailed'
  };
  
  res.json(paymentLinks);
});