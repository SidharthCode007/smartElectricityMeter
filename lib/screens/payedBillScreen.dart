import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:smartmeter/constants/size.dart';

class PayedBillscreen extends StatelessWidget {
  const PayedBillscreen({super.key});

  @override
  Widget build(BuildContext context) {
    h =MediaQuery.of(context).size.height;
    w =MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(//height: h!*0.5,width: w!*0.9,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 194, 139, 197),
                      border: Border.all(style: BorderStyle.none),
                      borderRadius: BorderRadius.circular(7)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        h15,
                        Row(
                          children: [
                            w15,
                            Container(
                              child: Image.asset('assets/images/kseb.png'),
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                               color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(5)
                    ),
                            ),w10,
                            Expanded(child: Text("KSEB",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700,color: Color.fromARGB(255, 9, 20, 69)),))
                          ],
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Bill Details",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                              h10,
                              Padding(
                                padding: const EdgeInsets.only(left:  10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        billlDetailsText(header: 'Consumer no.',details: "123456",),
                                        h5,
                                        billlDetailsText(header: 'Consumer name', details: 'syam'),
                                        h5,
                                        billlDetailsText(header: 'Bill date', details: '12/3/24'),
                                        h5,
                                        billlDetailsText(header: 'Due date', details: '12/4/24'),
                                        h5,
                                        billlDetailsText(header: 'Disconnect date', details: '23/4/24'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      h15,
                      Center(
                        child: Container(
                          height: h!*0.15,
                          width: w!*0.75,
                          decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              Icon(Icons.currency_rupee),Text("1788.0")
                            ],),
                            h10,
                            Divider(),
                            h10,
                            Text("Due date: 2024-3-27")
                          ],
                        ),
                        ),
                      ),
                      h15
                      ],
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0,10,20,20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromARGB(255, 216, 200, 150),
                      ),
                      child: Column(
                        children: [
                          ListTile(
              title: Text(
                "Payement Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 18, color: Colors.blue),
                      SizedBox(width: 5),
                      Text(
                        'Payed on: 01-15-2024',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 18, color: Colors.blue),
                      SizedBox(width: 5),
                      Text(
                        'Amount: 678',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PayedBillscreen(),
                ));
                // Add onTap functionality if needed
              },
            ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class billlDetailsText extends StatelessWidget {
  final String header;
  final String details;
  const billlDetailsText({
    super.key, required this.header, required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: w!*0.4,
        child: Text(header),),
        Text(":"),
        Container(width: w!*0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(details),
          ],
        ),),
     ],
    );
  }
}
