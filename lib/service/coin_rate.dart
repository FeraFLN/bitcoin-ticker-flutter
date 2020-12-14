
import 'package:bitcoin_ticker/networking.dart';

const coinaoiURL = "https://rest.coinapi.io/v1/exchangerate";
const appkey ="150F1D78-7291-4A04-918B-9AEE6F82FAFB";

class CoinModel{

  Future<dynamic> getCoinRate(String from, String to) async{
    String url = '$coinaoiURL/$from/$to?apikey=$appkey';
    return await Networking(url).getData();
  }



}