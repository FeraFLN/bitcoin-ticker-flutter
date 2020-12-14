import 'package:bitcoin_ticker/service/coin_rate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'dart:io'show Platform;
class PriceScreen extends StatefulWidget {

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectCurrency = "USD";
  final String btc = "BTC";
  final String eth = "ETH";
  final String ltc = "LTC";
  String btcCoinRate = "?";
  String ethCoinRate = "?";
  String ltcCoinRate = "?";
  @override
  initState(){
    super.initState();
    updateCoinRate();
  }
  void updateCoinRate() async{
    var btcData = await CoinModel().getCoinRate(btc, selectCurrency);
    var ethData = await CoinModel().getCoinRate(eth, selectCurrency);
    var ltcData = await CoinModel().getCoinRate(ltc, selectCurrency);
    setState(() {
      btcCoinRate = btcData['rate'].toStringAsFixed(2);
      ethCoinRate = ethData['rate'].toStringAsFixed(2);
      ltcCoinRate = ltcData['rate'].toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      bottomNavigationBar: BottomAppBar(

        child: Container(
          height: 150.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 30.0),
          color: Colors.lightBlue,
          child:getPiker(),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          coinRateCard(btc,btcCoinRate),
          coinRateCard(eth,ethCoinRate),
          coinRateCard(ltc,ltcCoinRate),
        ],
      ),
    );
  }

  Widget coinRateCard(String coin,String coinRate){
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $coin = $coinRate $selectCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
  CupertinoPicker iOSPicker(){
    List<Widget> texts = [];
    for(String currency in currenciesList){
      texts.add(Text(currency, style: TextStyle(color: Colors.white),));
    }
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex){
        print(selectedIndex);
      },
      children:texts,
    );
  }

  Widget getPiker(){
    if(Platform.isIOS){
      return iOSPicker();
    }
    return androidPicker();

  }

  DropdownButton<String> androidPicker(){
    List<DropdownMenuItem<String>> texts = [];
    for(String currency in currenciesList){
      texts.add(DropdownMenuItem(
        child: Text(currency),
        value:currency,
      ));
    }
    return DropdownButton<String>(
      value: selectCurrency,
      items: texts,
      onChanged: (value){
          setState(() {
            selectCurrency = value;
            updateCoinRate();
          });
      },
    );
  }


}
