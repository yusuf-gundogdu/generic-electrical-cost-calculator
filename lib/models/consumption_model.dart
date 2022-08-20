import 'base_model.dart';

class ConsumptionModel extends BaseModel{
  ConsumptionModel({this.id, this.name, this.rate});

  int? id;
  String? name;
  int? rate;

  // standard equals
  @override
  bool operator ==(Object other) => identical(this, other) || other is ConsumptionModel && other.id == id && other.name == name && other.rate == rate;

  @override
  int get hashCode => (id == null ? 0 : id.hashCode) + (name == null ? 0 : name.hashCode) + (rate == null ? 0 : rate.hashCode);

  @override
  String toString() => 'ConsumptionModel[id=$id, name=$name, rate=$rate ]';


// repository katmanına taşındı
  // static int delete(int id) {
  //   return 1;
  // }
  // static ConsumptionModel save(ConsumptionModel model) {
  //   return ConsumptionModel(id: 1, name: "1-100", rate: 5);
  // }
  //
  // static ConsumptionModel findById(int id) {
  //   return ConsumptionModel(id: 1, name: "1-100", rate: 5);
  // }
  //
  // //TODO : database katmanı yazılacak..
  // static List<ConsumptionModel> findAll() {
  //   var lst = <ConsumptionModel>[];
  //   lst.add(ConsumptionModel(id: 1, name: "1-100", rate: 5));
  //   lst.add(ConsumptionModel(id: 2, name: "101-500", rate: 8));
  //   lst.add(ConsumptionModel(id: 3, name: ">500", rate: 10));
  //   return lst;
  // }
}

