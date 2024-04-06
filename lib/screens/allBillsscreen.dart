import 'package:flutter/material.dart';
import 'package:smartmeter/constants/globalVar.dart';
import 'package:smartmeter/screens/viewbillScreen.dart';

class AllBills extends StatelessWidget {
  const AllBills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
      pendingbill.length>0?
      SafeArea(child: ListView.builder(
        itemBuilder: (context, index) {
          final pen = pendingbill[index];
          final date = pen.billdate.substring(0,17);
          return
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ViewBillscreen(bill: pen,),)),
            child: ListTile(
              title: Text(pen.consumerNo),
              subtitle: Text(
                date,
                style: TextStyle(),
              ),
              trailing: Text(
                pen.billamount.toString(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
              ),
            ),
          );
        },
        itemCount: pendingbill.length,
      )): Center(child: Text("No pending bills"),)
    );
  }
}
