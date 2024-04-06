import 'package:flutter/material.dart';

class Bill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Payment Method'),
        backgroundColor: Color.fromARGB(255, 141, 12, 148),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaymentOptionCard(
              icon: Icons.credit_card,
              title: 'Credit/Debit Card',
              onTap: () {
                // Navigate to credit card payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreditCardPaymentScreen()),
                );
              },
            ),
            SizedBox(height: 20.0),
            PaymentOptionCard(
              icon: Icons.payment,
              title: 'Net Banking',
              onTap: () {
                // Navigate to PayPal payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PayPalPaymentScreen()),
                );
              },
            ),
            SizedBox(height: 20.0),
            PaymentOptionCard(
              icon: Icons.payment,
              title: 'UPI',
              onTap: () {
                // Navigate to Google Pay payment screen
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GooglePayPaymentScreen()),
                );
              },
            ),

            Container(
              //height: 60,
              child:Image.asset('assets/images/payment.jpg'))
          ],
        ),
      ),
      
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PaymentOptionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30.0,
              color: Colors.blue,
            ),
            SizedBox(width: 20.0),
            Text(
              title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Credit/Debit Card Payment'),
      ),
      body: Center(
        child: Text('Credit/Debit Card Payment Screen'),
      ),
    );
  }
}

class PayPalPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PayPal Payment'),
      ),
      body: Center(
        child: Text('PayPal Payment Screen'),
      ),
    );
  }
}

class GooglePayPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Pay Payment'),
      ),
      body: Center(
        child: Text('Google Pay Payment Screen'),
    ),
);}
}