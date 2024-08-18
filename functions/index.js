const functions = require('firebase-functions');

exports.generatePaymentLinks = functions.https.onRequest((req, res) => {
  const returnURL = "com.example.nanny_fairy";
  const cancelURL = "com.example.nanny_fairy";

  res.json({ returnURL, cancelURL });
});