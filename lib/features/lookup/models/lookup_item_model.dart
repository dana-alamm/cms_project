class LookUpItemModel{
  final int id;
  final String value;
  final String label;

  LookUpItemModel({
    required this.id,
    required this.value,
    required this.label,
  });
  factory LookUpItemModel.fromJson(Map<String,dynamic>json){
return LookUpItemModel(
  id: json['id'] as int? ??0, 
  value: json['value'] as String? ?? '', 
  label: json['label'] as String? ?? '',
  );
  }
  Map<String,dynamic> toJson(){
    return{
      'id':id,
      'value':value,
      'label':label
    };
  }
  @override
  String toString()=>label;
}