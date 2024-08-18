const functions = require('firebase-functions');

exports.generatePaymentLinks = functions.https.onRequest((req, res) => {
  const paymentLinks = {
    returnURL: 'https://com.example.nanny_fairy/paymentSuccess',
    cancelURL: 'https://com.example.nanny_fairy/paymentFailed'
  };
  
  res.json(paymentLinks);
});