import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartmeter/constants/globalVar.dart';
import 'package:smartmeter/constants/size.dart';
import 'package:smartmeter/screens/Notifications.dart';
import 'package:smartmeter/screens/allBillsscreen.dart';
import 'package:smartmeter/screens/deviseControlscreen.dart';
import 'package:smartmeter/screens/notificationsScreen.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartmeter/services/userProfile.dart';
import 'package:smartmeter/services/viewbillHistory.dart';
import 'package:smartmeter/services/viewpendingBill.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(),
        body: Column(
          children: [
            Container(
              height: h! * 0.6,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color.fromARGB(255, 214, 230, 243),
                      Color.fromARGB(255, 65, 133, 200),
                    ],
                  ),
                  border: Border.all(style: BorderStyle.none),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Notifications(),
                            ));
                          },
                          icon: Icon(
                            Icons.notifications,
                            color: const Color.fromARGB(255, 4, 39, 68),
                          ))
                    ],
                  ),
                  h15,
                  CircularPercentIndicator(
                    radius: 60.0,
                    lineWidth: 10.0,
                    percent: 1.0,
                    center: Text(
                      "18 v",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color:
                              Color.fromARGB(255, 9, 35, 56).withOpacity(0.6)),
                    ),
                    progressColor:
                        Color.fromARGB(255, 42, 126, 194).withOpacity(0.15),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Usage",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black45),
                            ),
                            Text("116 unit",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: const Color.fromARGB(255, 9, 45, 74)
                                        .withOpacity(0.5))),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Amount",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black45),
                            ),
                            Text("567",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: const Color.fromARGB(255, 9, 45, 74)
                                        .withOpacity(0.5))),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async{ 
                      await payBill();
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AllBills(),
                    ));
                    },
                    child: Container(
                      height: h! * .2,
                      width: w! * 0.4,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 70, 95, 127),
                          border: Border.all(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        children: [
                          h25,
                          Icon(
                            Icons.payment,
                            size: 28,
                            color: Colors.white,
                          ),
                          h15,
                          Text(
                            "Pay Bill",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ControlDevice(),
                    )),
                    child: Container(
                      height: h! * .2,
                      width: w! * 0.4,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 70, 95, 127),
                          border: Border.all(style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(7)),
                      child: Column(
                        children: [
                          h25,
                          Icon(
                            Icons.graphic_eq,
                            size: 28,
                            color: Colors.white,
                          ),
                          h15,
                          Text(
                            "Control Device",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //pay bill
  payBill() async{
    final pending = await viewpendingBillApi();
    print("bill $pending");
                     if (pending!= null) {
                       pendingbill = pending;

                     }
  }
}
