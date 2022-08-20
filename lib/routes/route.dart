import 'package:get/get.dart';
import '../pages/home/home.dart';
import '../pages/system/customer/customer_list.dart';

List<GetPage<dynamic>> getPages() {
  return [
    GetPage(name: '/', page: () => HomePage(), transition: Transition.fade),
    GetPage(name: '/pages/system/customers/customer_list', page: () => CustomerListPage(), transition: Transition.fade),
  ];
}
