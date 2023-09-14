import 'package:flutter_clean_architecture/app.dart';
import 'package:flutter_clean_architecture/bootstrap.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env.staging');
  await bootstrap(() => const App());
}
