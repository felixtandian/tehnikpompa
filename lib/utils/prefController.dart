import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PrefController extends GetxController {
  static final box = GetStorage();
  static final String _token = 'token';
  static final String _refresh_token = 'refresh_token';
  static final String _name = 'memberName';
  static final String _email = 'memberEmail';
  static final String _phone = 'memberPhone';
  static final String _code = 'memberCode';
  static final String _isLogin = 'isLogin';
  static final String _storeName = 'storeName';
  static final String _fcm_token = 'fcmToken';
  static final String _isVerified = "flagVerified";
  static final String _verifMsg = "msgVerif";
  static final String _isRejected = "flagRejected";
  RxInt enablemenu = 1.obs;
  RxBool isSwitched = false.obs;
  static final String _isTeknisi = "isteknisi";
  static final String _isSales = "issales";
  static final String _isSuper = "issuper";

  //getter
  String get token => box.read(_token) ?? "empty";
  String get refreshToken => box.read(_refresh_token) ?? "empty";
  String get memberName => box.read(_name) ?? "empty";
  String get memberPhone => box.read(_phone) ?? "empty";
  String get memberCode => box.read(_code) ?? "empty";
  bool get isLogin => box.read(_isLogin) ?? false;
  String get storeName => box.read(_storeName) ?? "empty";
  String get fcmToken => box.read(_fcm_token) ?? "0";
  int get enableLocalAuth => box.read('enableLocalAuth') ?? 1;
  bool get checkBiometric => box.read('checkBiometric') ?? false;
  bool get isSwitchedBiometric => box.read('switchBiometric') ?? false;
  bool get flagVerif => box.read(_isVerified) ?? false;
  String get verifMsg =>
      box.read(_verifMsg) ?? "Akun Anda sedang dalam proses Verifikasi.";
  bool get flagReject => box.read(_isRejected) ?? false;
  bool get flagIsTeknisi => box.read(_isTeknisi) ?? false;
  bool get flagisSales => box.read(_isSales) ?? false;
  bool get flagisSuper => box.read(_isSuper) ?? false;

  //setter
  void setToken(String val) => box.write(_token, val);
  void setRefreshToken(String val) => box.write(_refresh_token, val);
  void setName(String val) => box.write(_name, val);
  void setIsLogin(bool val) => box.write(_isLogin, val);
  void setMemberCode(String val) => box.write(_code, val);
  void setStoreName(String val) => box.write(_storeName, val);
  void setFCMToken(String val) => box.write(_fcm_token, val);
  void setPhoneNumber(String val) => box.write(_phone, val);
  void setEmail(String val) => box.write(_phone, val);
  void setEnableLocalAuth(int val) => box.write('enableLocalAuth', val);
  void setCheckBiometric(bool val) => box.write('checkBiometric', val);
  void setisSwitchedBiometric(bool val) => box.write('switchBiometric', val);
  void setVerif(bool val) => box.write(_isVerified, val);
  void setVerifMsg(String val) => box.write(_verifMsg, val);
  void setReject(bool val) => box.write(_isRejected, val);
  void setTeknisi(bool val) => box.write(_isTeknisi, val);
  void setSales(bool val) => box.write(_isSales, val);
  void setSuper(bool val) => box.write(_isSuper, val);

  void removeUserInfo() {
    box.remove(_token);
    box.remove(_refresh_token);
    box.remove(_isLogin);
    box.remove(_phone);
    box.remove(_email);
    box.remove(_code);
    box.remove(_name);
    box.remove(_storeName);
    box.remove(_phone);
    box.remove(_isVerified);
    box.remove(_verifMsg);
    setTeknisi(false);
    setSuper(false);
    setSales(false);
  }
}
