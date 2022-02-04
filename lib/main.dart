import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:origo_iceland_project_app/helpers/communication_handler.dart';
import 'package:origo_iceland_project_app/screens/bmi_page.dart';
import 'package:origo_iceland_project_app/screens/home_page.dart';
import 'package:origo_iceland_project_app/screens/question_page.dart';
import 'services/preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceService.init();
  CommunicationHandler.init();
  _setPrefferedOrientation();
  runApp(const ProjectApp());
}

void _setPrefferedOrientation() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class ProjectApp extends StatelessWidget {
  const ProjectApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      title: 'Origo Iceland',
      home: const Home(),
      theme: ThemeData(primaryColor: Colors.blueAccent, primaryColorLight: Colors.white),
      debugShowCheckedModeBanner: false,
    );
  }
}
