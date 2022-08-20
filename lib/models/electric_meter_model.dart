import 'base_model.dart';
import 'customer_model.dart';

class ElectricMeterModel extends BaseModel{
  ElectricMeterModel({this.id, this.customer, this.unit});

  int? id;
  CustomerModel? customer;
  int? unit;

  // standard equals
  @override
  bool operator ==(Object other) => identical(this, other) || other is ElectricMeterModel && other.id == id && other.customer == customer && other.unit == unit;

  @override
  int get hashCode => (id == null ? 0 : id.hashCode) + (customer == null ? 0 : customer.hashCode) + (unit == null ? 0 : unit.hashCode);

  @override
  String toString() => 'ElectricMeterModel[id=$id, customer=$customer, unit=$unit ]';

}
