import '../models/base_model.dart';

abstract class BaseRepository {
  // int totalCount = 0;
  // int get getTotalCount{
  //   return totalCount;
  // }
  // set setTotalCount(int totalCount){
  //   this.totalCount = totalCount;
  // }

  Future<BaseModel> create(BaseModel model);

  Future<BaseModel> update(int id, BaseModel model);

  Future<void> delete(int id);

  Future<List<BaseModel>> findAll();

  Future<BaseModel> findById(int id);
}
