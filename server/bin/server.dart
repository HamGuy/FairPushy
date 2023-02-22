import 'dart:async';

import 'package:HotUpdateService/server/fair_server_pages.dart';
import 'package:HotUpdateService/server/src/get_server.dart';
import 'package:HotUpdateService/utils/fair_logger.dart';
import 'package:settings_yaml/settings_yaml.dart';
import 'package:simple_mysql_orm/simple_mysql_orm.dart';
import 'config.dart';
import '../lib/utils/requester/fair_requester_constants.dart';

void main() async {
  LoggerInit();

  // Create  settings file.
  SettingsYaml.fromString(content: settingsYaml, filePath: 'settings.yaml')
      .save();

  /// Initialise the db pool
  DbPool.fromSettings(pathToSettings: 'settings.yaml');

  final settings = SettingsYaml.load(pathToSettings:'settings.yaml');
  final baseUlr = settings.asString("base_url");
  final packingHost = settings.asString("packing_platform_host");
  
  FairRequesterConstants.baseUrl = baseUlr;
  FairRequesterConstants.packingPlatformHost = packingHost;

  print("host is "+baseUlr);

  runApp(
    GetServer(
      getPages: AppPages.routes,
      port: 8080,
    ),
  );
  print("FairServer ready...");
}
