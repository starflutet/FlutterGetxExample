/// resultCode : "0"
/// resultMsg : "성공"
/// data : [{"memberNo":1,"id":null,"password":null,"token":"5b4a83e5471945c9","createdAt":"0001-01-01T00:00:00"}]

class MemberModel {
  MemberModel({
      String? resultCode, 
      String? resultMsg, 
      List<Data>? data,}){
    _resultCode = resultCode;
    _resultMsg = resultMsg;
    _data = data;
}

  MemberModel.fromJson(dynamic json) {
    _resultCode = json['resultCode'];
    _resultMsg = json['resultMsg'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _resultCode;
  String? _resultMsg;
  List<Data>? _data;
MemberModel copyWith({  String? resultCode,
  String? resultMsg,
  List<Data>? data,
}) => MemberModel(  resultCode: resultCode ?? _resultCode,
  resultMsg: resultMsg ?? _resultMsg,
  data: data ?? _data,
);
  String? get resultCode => _resultCode;
  String? get resultMsg => _resultMsg;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resultCode'] = _resultCode;
    map['resultMsg'] = _resultMsg;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// memberNo : 1
/// id : null
/// password : null
/// token : "5b4a83e5471945c9"
/// createdAt : "0001-01-01T00:00:00"

class Data {
  Data({
      num? memberNo, 
      dynamic id, 
      dynamic password, 
      String? token, 
      String? createdAt,}){
    _memberNo = memberNo;
    _id = id;
    _password = password;
    _token = token;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _memberNo = json['memberNo'];
    _id = json['id'];
    _password = json['password'];
    _token = json['token'];
    _createdAt = json['createdAt'];
  }
  num? _memberNo;
  dynamic _id;
  dynamic _password;
  String? _token;
  String? _createdAt;
Data copyWith({  num? memberNo,
  dynamic id,
  dynamic password,
  String? token,
  String? createdAt,
}) => Data(  memberNo: memberNo ?? _memberNo,
  id: id ?? _id,
  password: password ?? _password,
  token: token ?? _token,
  createdAt: createdAt ?? _createdAt,
);
  num? get memberNo => _memberNo;
  dynamic get id => _id;
  dynamic get password => _password;
  String? get token => _token;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['memberNo'] = _memberNo;
    map['id'] = _id;
    map['password'] = _password;
    map['token'] = _token;
    map['createdAt'] = _createdAt;
    return map;
  }

}