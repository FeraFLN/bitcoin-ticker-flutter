

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoinCard {
  String _coinFrom;
  String _coinTo;
  String _rate;


  CoinCard(this._coinFrom, this._coinTo);


  Widget coinRateCard(String _rate) {
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
            '1 $_coinFrom = $_rate $_coinTo',
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
}