/// success : 6000
/// data : {"refresh":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDE0MTc0NCwiaWF0IjoxNjc3MDY5NzQ0LCJqdGkiOiI1YmRhNjkxMWUxMzU0ZjRiODUwYWM3ODhjOWQwYTY4YyIsInVzZXJfaWQiOjMzMn0.SZkLUVXDregqvCVYHksTwaCMuh7piOtDtbmdxwm2K6aUmfF7CZRb1KyFX2AL-wEERl9eRuJSlR0z1jgsaog-hHwG5ixDCeUdG_k7GGOzJtXZrEJV5DnnKwOF_y4jZatQUc6w-E2tPPWswM94fdyWjSU-UNkNLdS0iF7DdZlTydgo9BKVGZINhk_OqnUBhvh-lhkmpKqVIbiQSM2Z3dk62-kcIFXgzZvZaEsvzf4Vow9u2IKfVTigUOPJpQttO8xsNR3DyksJTffW66JP_pvxJlA7qnHnCsPEtp4mJFx8RcZvXt2FP9sWUpFIIi9tPJiyB_RBYTyqvs13XKzzaxIA4pFA0bSDj8PLvzKUbcJq7nPPVmu4ZBewS_3RsKB86iojNA3Av8TowuoTU9BcPv05mAeEjJ6YhOdPwgyw9Vv73sY2v6pQlkElNY6jpq1b_nAYrCbFTXO1UEIi6i5IVCLBEvia1dji2Mq2V-uu_vDw6IAig2zdXzA9X2-8ozmUh4yONx4JJfCboGrwlWOfQFeZO_-Qo3tTN22eSjnOAnbFWxAz_AdXyiUdl2GWapteKOD7uXPOfagC3pX4iPxvZxtxlSbgpISQs9P9CRqKA7099AvD4Nmh-uXgN6mpajb4eWaar4NJUCEE5poasoGI6Zhg28XZ-P6xQGjjH0ctn3f9_04","access":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA4NjA1NzQ0LCJpYXQiOjE2NzcwNjk3NDQsImp0aSI6ImMyMGY0OTQxY2Y1OTQ3YzdhMzIyMTU1YmUzMWU1NmFmIiwidXNlcl9pZCI6MzMyfQ.A1051ObzogD3rxwRgJRxoCoetc0oLO88i4uNnA6UI7fdn17n5zvEelM1RfELhb_cl5i5gYyRABMnqsa0Hkv4SQtrKTo51hVhs0Pv5MdpFSWHDz7zCuAoyyh0Ps55qE0V7RdIzJhQP3w_WEn1csgYzr7tmWDectj8a4R4HAzRCUJc6hqf_k7eKvGrUjpedsRNCBoNpcD_mfi7ZC0Jf-oDwR1wS5TpYh9fytcB0oQZ4JIPzzsYkdglvj6attYi_drjS_Tvm9Oy6LEPVL2ZyQFe86FDxMhP-t21sjXXj49-zemsTHSQ9TBcSlIMLX1o0kkGH1wnPPG7LksM17TXGjy_GyKBMDH3Nd9x1P4zdjFX8JM4KLzLGL_WrRarz-hHOBf29-oZns7unL0xNAvgb9TbIYyt7wz7bwuvCLf8do8kPUlynDLB35JG49pd88TZD4PEY4kbGj3kkhqJ3hDnUlS52ZLi36U2RUMwNXsq2QuqKRWdye23JJOsjvtGspeuehV0Rw1KP2Lplrxs1J6lED3tdGI_NApmZ4-tNSAd97j0QDQjw2tdhfPT7BX8k1vHJ4tnY0tQrzS-_eXio-zW4_WxyAfrhOxfU2HZbcig8VhfVcV23Zjz_QsNiFxHo06H4Z9ZWSsuEzXU1ypBeyEkRbU_pfr8zJtZPKP0z2v9Z0M09fE","user_id":332,"role":"user","username":"Vikntest","email":"vikncodestest@gmail.com","last_login":"2023-02-22 12:42:23.583498+00:00"}
/// user_id : 332
/// role : "user"
/// message : "Login successfully"
/// error : null
/// username : "Vikntest"

class LoginModelClass {
  LoginModelClass({
      num? success, 
      Data? data, 
      num? userId, 
      String? role, 
      String? message, 
      dynamic error, 
      String? username,}){
    _success = success;
    _data = data;
    _userId = userId;
    _role = role;
    _message = message;
    _error = error;
    _username = username;
}

  LoginModelClass.fromJson(dynamic json) {
    _success = json['success'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _userId = json['user_id'];
    _role = json['role'];
    _message = json['message'];
    _error = json['error'];
    _username = json['username'];
  }
  num? _success;
  Data? _data;
  num? _userId;
  String? _role;
  String? _message;
  dynamic _error;
  String? _username;
LoginModelClass copyWith({  num? success,
  Data? data,
  num? userId,
  String? role,
  String? message,
  dynamic error,
  String? username,
}) => LoginModelClass(  success: success ?? _success,
  data: data ?? _data,
  userId: userId ?? _userId,
  role: role ?? _role,
  message: message ?? _message,
  error: error ?? _error,
  username: username ?? _username,
);
  num? get success => _success;
  Data? get data => _data;
  num? get userId => _userId;
  String? get role => _role;
  String? get message => _message;
  dynamic get error => _error;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['user_id'] = _userId;
    map['role'] = _role;
    map['message'] = _message;
    map['error'] = _error;
    map['username'] = _username;
    return map;
  }

}

/// refresh : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTc0MDE0MTc0NCwiaWF0IjoxNjc3MDY5NzQ0LCJqdGkiOiI1YmRhNjkxMWUxMzU0ZjRiODUwYWM3ODhjOWQwYTY4YyIsInVzZXJfaWQiOjMzMn0.SZkLUVXDregqvCVYHksTwaCMuh7piOtDtbmdxwm2K6aUmfF7CZRb1KyFX2AL-wEERl9eRuJSlR0z1jgsaog-hHwG5ixDCeUdG_k7GGOzJtXZrEJV5DnnKwOF_y4jZatQUc6w-E2tPPWswM94fdyWjSU-UNkNLdS0iF7DdZlTydgo9BKVGZINhk_OqnUBhvh-lhkmpKqVIbiQSM2Z3dk62-kcIFXgzZvZaEsvzf4Vow9u2IKfVTigUOPJpQttO8xsNR3DyksJTffW66JP_pvxJlA7qnHnCsPEtp4mJFx8RcZvXt2FP9sWUpFIIi9tPJiyB_RBYTyqvs13XKzzaxIA4pFA0bSDj8PLvzKUbcJq7nPPVmu4ZBewS_3RsKB86iojNA3Av8TowuoTU9BcPv05mAeEjJ6YhOdPwgyw9Vv73sY2v6pQlkElNY6jpq1b_nAYrCbFTXO1UEIi6i5IVCLBEvia1dji2Mq2V-uu_vDw6IAig2zdXzA9X2-8ozmUh4yONx4JJfCboGrwlWOfQFeZO_-Qo3tTN22eSjnOAnbFWxAz_AdXyiUdl2GWapteKOD7uXPOfagC3pX4iPxvZxtxlSbgpISQs9P9CRqKA7099AvD4Nmh-uXgN6mpajb4eWaar4NJUCEE5poasoGI6Zhg28XZ-P6xQGjjH0ctn3f9_04"
/// access : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzA4NjA1NzQ0LCJpYXQiOjE2NzcwNjk3NDQsImp0aSI6ImMyMGY0OTQxY2Y1OTQ3YzdhMzIyMTU1YmUzMWU1NmFmIiwidXNlcl9pZCI6MzMyfQ.A1051ObzogD3rxwRgJRxoCoetc0oLO88i4uNnA6UI7fdn17n5zvEelM1RfELhb_cl5i5gYyRABMnqsa0Hkv4SQtrKTo51hVhs0Pv5MdpFSWHDz7zCuAoyyh0Ps55qE0V7RdIzJhQP3w_WEn1csgYzr7tmWDectj8a4R4HAzRCUJc6hqf_k7eKvGrUjpedsRNCBoNpcD_mfi7ZC0Jf-oDwR1wS5TpYh9fytcB0oQZ4JIPzzsYkdglvj6attYi_drjS_Tvm9Oy6LEPVL2ZyQFe86FDxMhP-t21sjXXj49-zemsTHSQ9TBcSlIMLX1o0kkGH1wnPPG7LksM17TXGjy_GyKBMDH3Nd9x1P4zdjFX8JM4KLzLGL_WrRarz-hHOBf29-oZns7unL0xNAvgb9TbIYyt7wz7bwuvCLf8do8kPUlynDLB35JG49pd88TZD4PEY4kbGj3kkhqJ3hDnUlS52ZLi36U2RUMwNXsq2QuqKRWdye23JJOsjvtGspeuehV0Rw1KP2Lplrxs1J6lED3tdGI_NApmZ4-tNSAd97j0QDQjw2tdhfPT7BX8k1vHJ4tnY0tQrzS-_eXio-zW4_WxyAfrhOxfU2HZbcig8VhfVcV23Zjz_QsNiFxHo06H4Z9ZWSsuEzXU1ypBeyEkRbU_pfr8zJtZPKP0z2v9Z0M09fE"
/// user_id : 332
/// role : "user"
/// username : "Vikntest"
/// email : "vikncodestest@gmail.com"
/// last_login : "2023-02-22 12:42:23.583498+00:00"

class Data {
  Data({
      String? refresh, 
      String? access, 
      num? userId, 
      String? role, 
      String? username, 
      String? email, 
      String? lastLogin,}){
    _refresh = refresh;
    _access = access;
    _userId = userId;
    _role = role;
    _username = username;
    _email = email;
    _lastLogin = lastLogin;
}

  Data.fromJson(dynamic json) {
    _refresh = json['refresh'];
    _access = json['access'];
    _userId = json['user_id'];
    _role = json['role'];
    _username = json['username'];
    _email = json['email'];
    _lastLogin = json['last_login'];
  }
  String? _refresh;
  String? _access;
  num? _userId;
  String? _role;
  String? _username;
  String? _email;
  String? _lastLogin;
Data copyWith({  String? refresh,
  String? access,
  num? userId,
  String? role,
  String? username,
  String? email,
  String? lastLogin,
}) => Data(  refresh: refresh ?? _refresh,
  access: access ?? _access,
  userId: userId ?? _userId,
  role: role ?? _role,
  username: username ?? _username,
  email: email ?? _email,
  lastLogin: lastLogin ?? _lastLogin,
);
  String? get refresh => _refresh;
  String? get access => _access;
  num? get userId => _userId;
  String? get role => _role;
  String? get username => _username;
  String? get email => _email;
  String? get lastLogin => _lastLogin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = _refresh;
    map['access'] = _access;
    map['user_id'] = _userId;
    map['role'] = _role;
    map['username'] = _username;
    map['email'] = _email;
    map['last_login'] = _lastLogin;
    return map;
  }

}