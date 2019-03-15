import 'package:flutter/material.dart';
import 'package:payment_flow_bank/components/account_summary.dart';
import 'package:payment_flow_bank/dummy/accounts.dart';
import 'package:payment_flow_bank/dummy/favourites.dart';
import 'package:payment_flow_bank/entities/account.dart';
import 'package:payment_flow_bank/entities/favourite.dart';
import 'package:payment_flow_bank/utils/assets.dart';
import 'package:payment_flow_bank/utils/custom_clipper.dart';
import 'package:payment_flow_bank/utils/custom_shadow_path.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  int focusIndex = 0;

  ScrollController accountScrollController = ScrollController();
  ScrollController favouriteScrollController = ScrollController();

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
            child: buildAccountSelection(context),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Favourites",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          buildFavourites(context),
          Container(
            height: 30,
          ),
          Expanded(
            flex: 1,
            child: LayoutBuilder(
              builder: buildTabList,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget buildAccountSelection(BuildContext context) {
    double width = 160;
    return ListView.builder(
      controller: accountScrollController,
      itemBuilder: (context, index) {
        if (index == accounts.length) {
          return Container(
            height: 10,
            width: MediaQuery.of(context).size.width - width - 16,
          );
        }
        CardView cardView = CardView(
          expand: index == focusIndex,
          account: Account().fromJson(accounts[index]),
          width: width,
          onClick: () {
            accountScrollController.animateTo(index * (width + 16.0),
                duration: Duration(milliseconds: 200), curve: Curves.linear);
            setState(() {
              focusIndex = index;
            });
          },
        );

        return Stack(
          children: [
            cardView,
          ],
        );
      },
      itemCount: accounts.length + 1,
      scrollDirection: Axis.horizontal,
    );
  }

  buildFavourites(BuildContext context) {
    return Container(
      height: 84,
      child: ListView.builder(
        controller: favouriteScrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0)
            return Container(
              margin: EdgeInsets.only(left: 20, bottom: 4, top: 20),
              child: Image(image: Assets.image("add.png")),
            );
          else if (index == favourites.length + 1)
            return Container(
              width: 20,
            );

          Favourite favourite = Favourite().fromJson(favourites[index - 1]);
          return GestureDetector(
            onTap: () {
              favouriteScrollController.animateTo(index * 84.0,
                  duration: Duration(milliseconds: 200), curve: Curves.linear);
            },
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              margin: EdgeInsets.only(left: 20, bottom: 4, top: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Image(
                image: Assets.image(favourite.image),
                fit: BoxFit.cover,
                width: 64,
                height: 64,
              ),
            ),
          );
        },
        itemCount: favourites.length + 2,
      ),
    );
  }

  Widget buildTabList(BuildContext context, BoxConstraints constraints) {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: buildTabs(context, constraints),
          ),
          Container(
            margin: EdgeInsets.only(),
            width: constraints.maxWidth,
            height: constraints.maxHeight - 56,
            color: Colors.white,
            child: buildPayments(context, constraints),
          ),
        ],
      ),
    );
  }

  int selectedTabIndex = 0;

  Key key1 = GlobalKey();
  Key key2 = GlobalKey();

  List<Widget> buildTabs(BuildContext context, BoxConstraints constraints) {
    Widget tab1 = buildTab(context, constraints, "Payments", 0);
    Widget tab2 = buildTab(context, constraints, "Transactions", 1);

    return //selectedTabIndex == 0 ? [tab1, tab2] :
        [tab2, tab1];
  }

  Widget buildTab(
      BuildContext context, BoxConstraints constraints, String text, int i) {
    Widget widget = Container(
      height: 56,
      color: selectedTabIndex == i ? Colors.white : Colors.transparent,
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTabIndex = i;
          });
        },
        child: Container(
          alignment: Alignment.center,
          width: constraints.maxWidth / 2,
          margin: EdgeInsets.only(left: i * constraints.maxWidth / 2),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
    if (selectedTabIndex == i)
      return IgnorePointer(
        child: ClipShadowPath(
          clipper: TabShapeClipper(index: i),
          shadow: Shadow(color: Colors.black12, blurRadius: 6),
          child: widget,
        ),
      );
    else
      return Opacity(
        child: widget,
        opacity: 0.5,
      );
  }

  buildPayments(BuildContext context, BoxConstraints constraints) {
    return ListView(
      children: <Widget>[
        ListItem(
          image: "wifi.png",
          text: "Internet & Telephony",
          subtitle: "Over 500 operators",
        ),
        ListItem(
          image: "game.png",
          text: "Games",
          subtitle: "Over 250 games",
        ),
        ListItem(
          image: "wallet.png",
          text: "E-Wallet",
          subtitle: "Over 60 wallets",
        ),
        ListItem(
          image: "transport.png",
          text: "Transport",
          subtitle: "Over 150 operators",
        ),
      ],
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem({this.image, this.text, this.subtitle, Key key}) : super(key: key);
  final String text;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          Image(
            image: Assets.image(image),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              padding: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Color.fromRGBO(169, 184, 199, 0.2),
                  width: 1,
                )),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(fontSize: 18),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}
