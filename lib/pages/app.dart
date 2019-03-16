import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payment_flow_bank/components/bottom_sheet.dart';
import 'package:payment_flow_bank/entities/account.dart';
import 'package:payment_flow_bank/entities/favourite.dart';
import 'package:payment_flow_bank/utils/assets.dart';
import 'package:payment_flow_bank/views/account_summary.dart';
import 'package:payment_flow_bank/views/favourite_list.dart';
import 'package:payment_flow_bank/views/transaction.dart';
import 'package:payment_flow_bank/views/transition_bottom_sheet.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  Account _selectedAccount;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Image(image: Assets.image("menu.png")),
        actions: <Widget>[
          Image(
            image: Assets.image("bell.png"),
          ),
          Container(
            margin: EdgeInsets.only(right: 16, top: 10, bottom: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: Assets.image("user1.jpg"), fit: BoxFit.cover)),
            width: 36,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 24),
            height: 240,
            child: AccountSummaryView(
              onSelect: (account) => _selectedAccount = account,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Favourites",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
              scaffoldBackgroundColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              dialogBackgroundColor: Colors.transparent,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                  background: Colors.transparent, surface: Colors.transparent),
            ),
            child: Builder(
              builder: (context) => FavouriteListView(
                    onSelect: (account) => showFavouriteInfo(context, account),
                  ),
            ),
          ),
          Container(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: TransactionsView(),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  void showFavouriteInfo(BuildContext context, Favourite favourite) {


    showModalBottomSheetApp(
      context: context,
      builder: (context) => TransitionBottomSheetView(account: _selectedAccount, favourite: favourite),
    );
  }

}
