import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:generic_electrical_cost_calculator/repository/base_repository.dart';
import 'package:generic_electrical_cost_calculator/repository/customer_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loadmore/loadmore.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../models/customer_model.dart';
import '../../../utils/utils.dart';
import 'customer_edit.dart';

class CustomerListPage extends StatefulWidget {
  const CustomerListPage({Key? key}) : super(key: key);

  @override
  State<CustomerListPage> createState() => _CustomerListPageState();
}

class _CustomerListPageState extends State<CustomerListPage> {
  TextEditingController findController = TextEditingController();
  List<CustomerModel> _pageList = [];
  int _pageNum = 0;
  final int _pageSize = 20;

  load({bool refresh = false}) async {
    if (refresh) {
      _pageNum = 0;
      _pageList = [];
    }
    await Future.delayed(const Duration(seconds: 0, milliseconds: 1000));
    var lst = await getAllData();
    _pageList.addAll(lst);
    setState(() {
      _pageList;
    });
    _pageNum++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(3, 3, 3, 3)),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: FloatingActionButton(
                  elevation: 3,
                  heroTag: "customer-hero",
                  onPressed: () {
                    Get.toNamed("/");
                    //TODO new customer
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
                      "Customer List",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: buildSearchTextField(),
          ),
          const SizedBox(height: 0),
          Expanded(
            child: buildRefreshIndicator(),
          ),
        ],
      ),
    );
  }

  TextField buildSearchTextField() {
    return TextField(
      controller: findController,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              Icons.find_in_page,
            ),
            onPressed: () => load(refresh: true),
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: const EdgeInsets.only(left: 30, bottom: 10, top: 15, right: 30),
          hintText: "search"),
    );
  }

  Future<bool> _loadMore() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 1000));
    await load();
    return true;
  }

  Future<void> _refresh() async {
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    await load(refresh: true);
  }

  Widget buildRefreshIndicator() {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: LoadMore(
        textBuilder: (status) {
          String text;
          switch (status) {
            case LoadMoreStatus.fail:
              text = "";
              break;
            case LoadMoreStatus.idle:
              text = "";
              break;
            case LoadMoreStatus.loading:
              text = "";
              break;
            case LoadMoreStatus.nomore:
              text = "";
              break;
            default:
              text = "";
          }
          return text;
        },
        isFinish: _pageList.length >= CustomerRepository.totalCount,
        onLoadMore: _loadMore,
        child: buildListView(),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: _pageList.length,
      physics: const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              ExpansionTileCard(
                expandedColor: Colors.transparent,
                baseColor: Colors.transparent,
                elevation: 0,
                key: ValueKey(_pageList[index].id),
                animateTrailing: true,
                trailing: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Color(0XFFffbe00),
                ),
                initialElevation: 0,
                title: Text(
                  "${_pageList[index].id ?? " "}  ${_pageList[index].name ?? " "}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                children: <Widget>[
                  const Divider(
                    thickness: 1.0,
                    height: 1.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        """
${"Name"}:  ${_pageList[index].name} 

${"ServiceNumber"}:  ${_pageList[index].serviceNumber}

${"Address"}:  ${_pageList[index].address}
""",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonHeight: 100.0,
                    buttonMinWidth: 100.0,
                    children: <Widget>[
                      TextButton(
                        //style: flatButtonStyle,
                        onPressed: () {
                          //burrası
                          Alert(
                            context: context,
                            type: AlertType.warning,
                            title: "delete",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "yes",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  //TODO delete customer
                                  // Navigator.pop(context);
                                  // deleteCustomer(_pageList[index].id);
                                },
                                color: Colors.red,
                              ),
                              DialogButton(
                                child: Text(
                                  "no",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.green,
                              )
                            ],
                          ).show();
                          //
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            elevation: 2,
                            shadowColor: Colors.black,
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Colors.red, width: 1)),
                            child: Icon(
                              Icons.delete_forever_outlined,
                              color: Colors.red,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CustomerEditPage(_pageList[index].id!),
                            ),
                          ).then(onGoBack);
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          child: Card(
                            elevation: 2,
                            shadowColor: Colors.black,
                            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0XFFffbe00), width: 1)),
                            child: Icon(
                              Icons.list,
                              color: Color(0XFFffbe00),
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 2),
              const Divider(
                thickness: 1,
                color: Color(0XFFffbe00),
                endIndent: 20,
                indent: 20,
              ),
              const SizedBox(height: 2),
            ],
          ),
        );
      },
    );
  }

  Future<List<CustomerModel>> getAllData() async {
    var api = CustomerRepository();
    List<CustomerModel> result = [];
    try {
      if (findController.text == "") {
        result = (await api.findAll()) as List<CustomerModel>;
        // print("result");
        // print(result);
        // print("result");
      } else {
        //TODO : searchbox
        //result = await api.getAllCustomersByName(name: findController.text, page: _pageNum, size: _pageSize);
      }
    } catch (e) {
      Utils.toast("request_failed", isError: true);
    } finally {}
    return result;
  }

  onGoBack(dynamic value) {
    // print("SAYFA YENİLENDİ");
    load(refresh: true);
    setState(() {});
  }
}
