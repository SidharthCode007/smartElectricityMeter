import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:smartmeter/constants/size.dart';
import 'package:smartmeter/models/billHistory.dart';
import 'package:smartmeter/screens/paymentScreen.dart';


class ViewBillscreen extends StatelessWidget {
  final BillHistoryModel bill;
  const ViewBillscreen({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    final h =MediaQuery.of(context).size.height;
    final w =MediaQuery.of(context).size.width;
    final date = bill.billdate.substring(4,17);
    final duedate = bill.dueDate.substring(4,17);
    final disdate = bill.discDate.substring(4,17);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
         // crossAxisAlignment: CrossAxisAlignment.center,
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
                                        billlDetailsText(header: 'Consumer no.',details: bill.consumerNo,),
                                        h5,
                                        billlDetailsText(header: 'Reading', details: bill.currentreading),
                                        h5,
                                        billlDetailsText(header: 'Bill date', details: date),
                                        h5,
                                        billlDetailsText(header: 'Due date', details: duedate),
                                        h5,
                                        billlDetailsText(header: 'Disconnect date', details: disdate),
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
                              Icon(Icons.currency_rupee),Text(bill.billamount.toString())
                            ],),
                            h10,
                            Divider(),
                            h10,
                            Text("Due date: $date")
                          ],
                        ),
                        ),
                      ),
                      h15
                      ],
                    ),),
                  ),
                  //h10,
                  //Text(data)
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromARGB(255, 216, 200, 150),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                        title: Text("2346567698"),
                        subtitle: Text("01-02-2024",style: TextStyle(),),
                        trailing: Text("678",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Divider(color: Colors.black87,),
                      ),
                      ListTile(
                        title: Text("2346567698"),
                        subtitle: Text("01-02-2024",style: TextStyle(),),
                        trailing: Text("678",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),),
                      ),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
        
            InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Bill(),
                    )),
              child: Container(
                width: w,
                height: 50,
                color: Color.fromARGB(255, 5, 52, 92),
                child: Center(child: Text("Proceed To Pay",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: Colors.white),)),
              ),
            )
        
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
        Container(width: w!*0.30,
        child: Text(header),),
        Text(":"),
        Container(width: w!*0.35,
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
