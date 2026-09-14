import 'package:cms_project_app/core/storage/secure_storage_helper.dart';
import 'package:cms_project_app/features/lookup/models/lookup_item_model.dart';
import 'package:dio/dio.dart';

class LookupService {
  final Dio _dio=Dio();
  final SecureStorageHelper _storageHelper=SecureStorageHelper();
  static const String _baseUrl='http://estarta-cms.runasp.net/api/lookups';

  Future<List<LookUpItemModel>> getCountries()async{
    try {
      final token=await _storageHelper.getToken();
      final response=await _dio.get(
        '$_baseUrl/countries',
        options: Options(
          headers: {
            'Accept':'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if(response.statusCode==200){
        final List<dynamic>data=response.data;
        return data.map((item)=>LookUpItemModel.fromJson(item)).toList();
      }else{
        throw Exception('Failed to load countries: ${response.statusCode}');
      }
    } on DioException catch (e) {
      final errorMessage=e.response?.data?['message']??e.message??'Unkown network error';
      throw Exception(errorMessage);
    }catch (e){
      throw Exception(e.toString());
    }
  }
}