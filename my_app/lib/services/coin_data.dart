import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR',
  'FCFA',
];

const List<String> cryptoList = ['bitcoin', 'ethereum', 'litecoin'];

class CoinData {
  Future<Map<String, String?>> getCoinData(String selectedCurrency) async {
    Map<String, String?> cryptoPrices = {};
    for (String crypto in cryptoList) {
      Uri requestURL = Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=$crypto&vs_currencies=$selectedCurrency',
      );

      http.Response response = await http.get(requestURL);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        String? price = decodedData[crypto]?[selectedCurrency]?.toString();
        cryptoPrices[crypto] = price;
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
