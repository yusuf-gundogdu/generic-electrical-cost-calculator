import 'package:sqlite3/sqlite3.dart';

import 'base_model.dart';

class CustomerModel extends BaseModel{
  CustomerModel({this.id, this.name, this.serviceNumber, this.address});

  int? id;
  String? name;
  String? serviceNumber;
  String? address;

  // standard equals
  @override
  bool operator ==(Object other) => identical(this, other) || other is CustomerModel && other.id == id && other.name == name && other.serviceNumber == serviceNumber && other.address == address;

  @override
  int get hashCode => (id == null ? 0 : id.hashCode) + (name == null ? 0 : name.hashCode) + (serviceNumber == null ? 0 : serviceNumber.hashCode) + (address == null ? 0 : address.hashCode);

  @override
  String toString() => 'CustomerModel[id=$id, name=$name, serviceNumber=$serviceNumber, address=$address]';

  // Repository katmanına taşındı
  // static List<CustomerModel> findAll(){
  //   //final ResultSet resultSet =  db.select('SELECT * FROM customer');
  //
  //   return <CustomerModel>[];
  // }
  //
  // static List<CustomerModel> fromSQL(dynamic value) {
  //   if (value == ResultSet) {
  //     List<CustomerModel> list = <CustomerModel>[];
  //     for (final Row row in value) {
  //       list.add(CustomerModel(id: row['id'], name: row['name']));
  //     }
  //     return list;
  //   }
  //
  //   return <CustomerModel>[];
  // }
}
