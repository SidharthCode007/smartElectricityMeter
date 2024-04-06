import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smartmeter/constants/size.dart';
import 'package:smartmeter/services/addComplaint.dart';

class ComplaintsScreen extends StatelessWidget {
  ComplaintsScreen({super.key});

  final complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: 
      ListView(
        children: [
          Container(
           // height: h!*0.2,
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(6)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5,5,5,3),
                          child: TextFormField(
                            controller: complaintController,
                            decoration: InputDecoration(border: InputBorder.none),
                            maxLines: 4,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0,0,7,6),
                              child: InkWell(
                                onTap: () {
                                  sendComplaintApi(complaintController.text);
                                },
                                child: CircleAvatar(
                                  child: Center(child: Icon(Icons.send),),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                h15,
                for(int i=0; i<7; i++)
                  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(child: Icon(Icons.person,size: 18,)),w10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('@username',style: TextStyle(color: Colors.black54,fontSize: 10),),
                              Text("gfcghbjn hgvjbh jjhhikhu jhihi ghiiuiue duhuiejd aiusxjiasjdkd daudwhuiwsjiofjwf iuhsc"),
                              h5,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(Icons.message,color: Colors.black38,size: 18,),w5
                                ],
                              )
                              ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )
      ),
    );
  }
}