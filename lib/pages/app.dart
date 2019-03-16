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
            margin: EdgeInsets.only(right: 16, top: 8, bottom: 8),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: Assets.image("user1.jpg"), fit: BoxFit.fitHeight)),
            width: 42,
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
    UnderlineInputBorder border =
        UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent));
    Widget widget = Column(
      children: [
        Expanded(
          child: Container(),
          flex: 1,
        ),
        Container(
          height: 619,
          child: Stack(
            children: [
              Positioned.fill(
                top: 32,
                left: 20,
                right: 20,
                bottom: 24,
                child: Column(
                  children: <Widget>[
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: Container(
                        padding: EdgeInsets.only(bottom: 20, top: 32),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(
                                right: 20,
                                left: 20,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.topCenter,
                                    margin: EdgeInsets.only(top: 10),
                                    child: Text(favourite.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 20),
                                      child: Text("From",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  buildAccountSummary(
                                      context, _selectedAccount, true)
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                            Divider(
                              color: Color.fromRGBO(238, 241, 244, 1),
                              height: 41,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                right: 20,
                                left: 20,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      child: Text("To",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  buildAccountSummary(
                                      context, favourite.account, false),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                            Divider(
                              color: Color.fromRGBO(238, 241, 244, 1),
                              height: 41,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                right: 20,
                                left: 20,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      child: Text("Message",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      border: border,
                                      enabledBorder: border,
                                      focusedBorder: border,
                                      hintText: "Hi!",
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                            Divider(
                              color: Color.fromRGBO(238, 241, 244, 1),
                              height: 41,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                right: 20,
                                left: 20,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Opacity(
                                    opacity: 0.5,
                                    child: Container(
                                      child: Text("Amount",
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                  Container(
                                    child: TextFormField(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 30),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        border: border,
                                        enabledBorder: border,
                                        focusedBorder: border,
                                        hintStyle: TextStyle(fontSize: 30),
                                        hintText: "0.00",
                                      ),
                                    ),
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.center,
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24))),
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          height: 59,
                          alignment: Alignment.center,
                          child: Text(
                            "Pay",
                            style: TextStyle(fontSize: 20),
                          ),
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: Assets.image(favourite.image),
                    height: 64,
                    width: 64,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );

    showModalBottomSheetApp(
      context: context,
      builder: (context) => widget,
    );
  }

  buildAccountSummary(
      BuildContext context, Account account, bool displayAmount) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: <Widget>[
          Card(
            color: account.color,
            child: Container(
              padding: EdgeInsets.all(7),
              width: 34,
              child: Image(
                image: Assets.image("mastercard.png"),
                height: 12,
                width: 18,
                fit: BoxFit.scaleDown,
              ),
              height: 26,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "${account.name} *${account.getLastCardNumber()}",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          Container(
            child: Text(
              displayAmount ? "${account.getAmountInString()}" : "",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
