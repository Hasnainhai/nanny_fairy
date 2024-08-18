const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.generatePaymentLinks = functions.https.onRequest((req, res) => {
  const returnUrl = 'https://nanny-fairy/paymentSuccess';
  const cancelUrl = 'https://nanny-fairy/paymentCancel';

  res.json({ returnUrl, cancelUrl });
});
