import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:generic_electrical_cost_calculator/repository/customer_repository.dart';
import 'package:get/get.dart';

import '../../../models/customer_model.dart';
import '../../../utils/utils.dart';

class CustomerEditPage extends StatefulWidget {
  final int id;

  const CustomerEditPage(this.id, {Key? key}) : super(key: key);

  @override
  State<CustomerEditPage> createState() => _CustomerEditPageState();
}

class _CustomerEditPageState extends State<CustomerEditPage> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtServiceNumber = TextEditingController();
  TextEditingController txtAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FloatingActionButton(
                        elevation: 3,
                        heroTag: "dealer_lisddt",
                        onPressed: () {
                          Get.toNamed("/pages/system/customers/customer_list");
                        },
                        backgroundColor: const Color(0XFFffbe00),
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Card(
                        color: Colors.white,
                        elevation: 3,
                        margin: const EdgeInsets.only(left: 20),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: ListTile(
                          //leading: Icon(Icons.music_note),
                          title: Text(
                            widget.id == 0 ? "  New Customer" : "  Edit Customer",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Expanded(
                  flex: 40,
                  child: informationForm(),
                ),
                Expanded(
                  flex: 10,
                  child: footerButtonRow(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView informationForm() {
    //print("informationForm......$_selectedPageList");
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          textField(txtName, "Name *"),
          const SizedBox(height: 7.0),
          textField(txtServiceNumber, "Service Number"),
          const SizedBox(height: 7.0),
          textField(txtAddress, "Address *"),
          const SizedBox(height: 7.0),
        ],
      ),
    );
  }

  Row footerButtonRow() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            backMenu();
          },
          child: Text(
            'cancel',
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            save();
          },
          child: Text(
            'save',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget textField(TextEditingController controller, String labelText) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: TextFormField(
        autofocus: false,
        autocorrect: false,
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }

  Widget numFieldWithRange(TextEditingController controller, String labelText, {double? minVal, double? maxVal}) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: TextFormField(
        style: const TextStyle(color: Color(0xff000000), fontSize: 14, fontWeight: FontWeight.normal),
        controller: controller,
        autovalidateMode: AutovalidateMode.always,
        keyboardType: TextInputType.number,
        validator: (input) {
          if (input == null) return null;
          final isDigitsOnly = double.tryParse(input);
          if (isDigitsOnly == null) {
            return '$labelText ${"needs_to_be_numeric_only"} ';
          }

          return null;
        },
        decoration: InputDecoration(
          labelText: labelText,
        ),
      ),
    );
  }



  save() async {
    if (!checkFormElement()) return;
    var api = CustomerRepository();
    CustomerModel entity = CustomerModel(
        name: txtName.text,
        serviceNumber: txtServiceNumber.text,
        address: txtAddress.text
    );

    if (widget.id == 0) {
      api
          .create(entity)
          .then((value) => {Utils.toast("success"), backMenu()})
          .onError((error, stackTrace) =>
      {Utils.toast(error.toString(), isError: true)})
          .whenComplete(() => {});
    } else {
      entity.id = widget.id;
      api
          .update(entity.id!, entity)
          .then((value) => {Utils.toast("success"), backMenu()})
          .onError((error, stackTrace) =>
      {Utils.toast(error.toString(), isError: true)});
    }

    //print(_selectedPageList);
  }


  bool checkFormElement() {
    if (txtName.text == "") {
      Utils.toast("Name is required", isError: true);
      return false;
    }
    if (txtServiceNumber.text == "") {
      Utils.toast("Service Number is required", isError: true);
      return false;
    }
    if (txtAddress.text == "") {
      Utils.toast("Address is required", isError: true);
      return false;
    }
    return true;
  }


  void backMenu() {
    Get.toNamed("/");
  }

}
