import 'package:http/http.dart' as http;
import 'dart:convert';

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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getData(String country) async {
    Map<String, String> cryptoprices = {};
    for (String crypto in cryptoList) {
      http.Response response = await http.get(
        Uri.parse(
            'https://rest.coinapi.io/v1/exchangerate/$crypto/$country?apikey=C165B197-3DC9-42AA-A757-F97578C29E8E'),
      );
      if (response.statusCode == 200) {
        var lastprice = (jsonDecode(response.body))['rate'];
        cryptoprices[crypto] = lastprice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
      }
    }
    return cryptoprices;
  }
}
