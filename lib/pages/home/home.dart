import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/home.png", scale: 4),
          //TODO rowlar için widget oluşturulacak.
          SizedBox(height: 100),
          Row(children: <Widget>[
            Expanded(child: Divider()),
            Text("System Configuration"),
            Expanded(child: Divider()),
          ]),
          Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/pages/system/customers/customer_list");
                  },
                  child: Text("Customers (Done)"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/pages/system/consumptions/consumptions_list");
                  },
                  child: Text("Consumptions (Doing)"),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 20),
          Row(children: <Widget>[
            Expanded(child: Divider()),
            Text("Electric Meter (Doing)"),
            Expanded(child: Divider()),
          ]),
          Row(
            children: [
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/pages/electric_meter/reading_new");
                  },
                  child: Text("Read (Doing)"),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/pages/electric_meter/reading_list");
                  },
                  child: Text("List (Doing)"),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
