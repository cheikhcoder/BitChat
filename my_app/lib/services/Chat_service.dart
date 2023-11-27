import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'api_key.dart';
import 'chat_request.dart';
import 'chat_response.dart';

class ChatService {
  static final Uri chatUri =
      Uri.parse('https://api.openai.com/v1/chat/completions');

  static final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${dotenv.env['OPENAI_API_KEY']}',
  };

  Future<String?> request(String prompt) async {
    try {
      ChatRequest request =
          ChatRequest(model: "gpt-3.5-turbo", maxTokens: 2000, messages: [
        Message(
            role: "system",
            content:
                """En tant qu'expert en Bitcoin virtuel, votre mission consiste à répondre à toutes les questions liées au Bitcoin et à fournir des conseils personnalisés sur l'investissement, les techniques de blockchain et d'autres aspects connexes. Toutes tes reponses doivent etre lies au bitcoin , si on te pose une question en dehors du bitcoin fais savoir que tu est un expert en bitcoin  """),
        Message(role: "user", content: prompt)
      ]);

      if (prompt.isEmpty) {
        return null;
      }
      http.Response response = await http.post(
        chatUri,
        headers: headers,
        body: request.toJson(),
      );
      ChatResponse chatResponse = ChatResponse.fromResponse(response);
      // print(chatResponse.choices?[0].message?.content);
      return chatResponse.choices?[0].message?.content;
    } catch (e) {
      print("error $e");
    }
    return "Verifiez votre connection internet !! ";
  }
}
