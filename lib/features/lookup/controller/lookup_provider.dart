import 'package:cms_project_app/features/lookup/models/lookup_item_model.dart';
import 'package:cms_project_app/features/lookup/services/lookup_service.dart';
import 'package:flutter/material.dart';

class LookupProvider  extends ChangeNotifier{
  final LookupService _lookupService=LookupService();

  List<LookUpItemModel>_countries=[];
  List<LookUpItemModel> get countries=>_countries;

  LookUpItemModel?_selectedCountry;
  LookUpItemModel?get selectedCountry=>_selectedCountry;

  bool _isloading=false;
  bool get isLoading=>_isloading;

  String? _errorMessage;
  String? get errorMessage=>_errorMessage;

  void selecteCountry(LookUpItemModel? country){
    _selectedCountry=country;
    notifyListeners();
  }

  Future<void>fetchCountries()async{
    if(countries.isNotEmpty)return;

    _isloading=true;
    _errorMessage=null;
    notifyListeners();


    try {
      _countries=await _lookupService.getCountries();

    } catch (e) {
      _errorMessage=e.toString().replaceAll("Exception:", "");

    }finally{
      _isloading=false;
      notifyListeners();
    }
  }

}