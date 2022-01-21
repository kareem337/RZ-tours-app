
import 'package:flutter/material.dart';
import 'package:rz_tours/widgets/Admin_card.dart';
import 'package:rz_tours/widgets/chartOne.dart';
import 'package:rz_tours/widgets/chartTwo.dart';
import 'package:rz_tours/widgets/datatable.dart';
import 'package:rz_tours/widgets/admin_Drawer.dart';

class HomeMobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter admin panel',style: TextStyle(color: Colors.black),),
      ),
      drawer:  MobileDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: SafeArea(child: Container(
                  child : Center(
                      child: Column(
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            spacing:  20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                          ),
                          SizedBox(height: 20),
                            Card(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height:300, child: SimpleLineChart()),
                            )),
                           SizedBox(height: 20),
                             Card(child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Container(height:300, child: GroupedBarChart()),
                             )),
                             Card(child: Padding(
                               padding: const EdgeInsets.all(8.0),
                              //  child: Container(height:300, child: SingleChildScrollView(
                              //       scrollDirection: Axis.vertical,
                              //       child: SingleChildScrollView(
                              //         scrollDirection: Axis.horizontal,
                              //         child: MyDatatable()))),
                             )),
                        ],
                      ),
                    )
              )),
            ),
          ],
        ),
      ),
    );
  }
}
