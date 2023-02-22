import 'env_config_option.dart';

class EnvConfig {
  static const appEnv = String.fromEnvironment(EnvInfo.envKey);

   static final EnvConfigOption _debugConfig = EnvConfigOption(baseUrl: "http:/localhost:8080",baseUploadUrl: "");
   static final EnvConfigOption _preConfig = EnvConfigOption(baseUrl: "http://hamguy.top:12333",baseUploadUrl: "");
   static final EnvConfigOption _releaseConfig = EnvConfigOption(baseUrl: "http://hamguy.top:12333",baseUploadUrl: "");

   static EnvConfigOption get envConfig => _getEnvConfig();

   static initConfig() => _getEnvConfig();
   
   // 根据不同环境返回对应的环境配置
   static EnvConfigOption _getEnvConfig() {
    switch (appEnv) {
      case EnvInfo.debug:
        return _debugConfig;
      case EnvInfo.release:
        return _releaseConfig;
      case EnvInfo.pre:
        return _preConfig;
      default:
        return _debugConfig;
    }
  }
}