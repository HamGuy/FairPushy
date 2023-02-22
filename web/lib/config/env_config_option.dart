/**
 *  环境配置
 */
class EnvConfigOption {
  String baseUrl;
  String baseUploadUrl;

  EnvConfigOption({
    required this.baseUrl,
    required this.baseUploadUrl,
  }){
    if(baseUploadUrl.isEmpty){
      baseUploadUrl = baseUrl;
    }
  }
}

class EnvInfo {
  static const String envKey = "ENV";
  static const String debug = "debug";
  static const String pre = "pre";
  static const String release = "release";
}

