// import 'package:flutter_dotenv/flutter_dotenv.dart';
// class ApiKey {
//   static const String openAIApiKey =
//       "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";
// }
// Create a new file named dotenv.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Dotenv {
  static String openAIApiKey = dotenv.env['OPENAI_API_KEY'] ?? "";
}
