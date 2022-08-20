
import 'package:generic_electrical_cost_calculator/models/customer_model.dart';
import 'package:generic_electrical_cost_calculator/repository/base_repository.dart';

import '../models/base_model.dart';
import '../models/consumption_model.dart';

class CustomerRepository extends BaseRepository{
  static int totalCount = 0;
  @override
  Future<BaseModel> create(BaseModel model) async{
    return CustomerModel(id: 1, name: "HA123", serviceNumber: "SN123", address: "Istanbul");
  }

  @override
  Future<void> delete(int id) async{
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<BaseModel>> findAll() async{
    totalCount = 0;
      var lst = <CustomerModel>[];
      lst.add(CustomerModel(id: 1, name: "HA123", serviceNumber: "SN123", address: "Istanbul"));
      lst.add(CustomerModel(id: 2, name: "HA456", serviceNumber: "HA456", address: "Istanbul"));
      lst.add(CustomerModel(id: 3, name: "HA789", serviceNumber: "HA789", address: "Istanbul"));

      totalCount = lst.length;

      return lst;
  }

  @override
  Future<BaseModel> findById(int id) async{
    return CustomerModel(id: 1, name: "HA123", serviceNumber: "SN123", address: "Istanbul");
  }

  @override
  Future<BaseModel> update(int id, BaseModel model)  async {
    return CustomerModel(id: 1, name: "HA123", serviceNumber: "SN123", address: "Istanbul");
  }


}