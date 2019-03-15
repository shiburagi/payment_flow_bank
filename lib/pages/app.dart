import 'package:flutter/material.dart';
import 'package:payment_flow_bank/components/account_summary.dart';
import 'package:payment_flow_bank/dummy/accounts.dart';
import 'package:payment_flow_bank/dummy/favourites.dart';
import 'package:payment_flow_bank/entities/account.dart';
import 'package:payment_flow_bank/entities/favourite.dart';
import 'package:payment_flow_bank/utils/assets.dart';

class AppPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppPageState();
  }
}

class _AppPageState extends State<AppPage> {
  int focusIndex = 0;

  ScrollController controller = ScrollController();

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
            height: 240,
            child: buildAccountSelection(context),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              "Favourites",
              style: TextStyle(fontSize: 20),
            ),
          ),
          buildFavourites(context),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget buildAccountSelection(BuildContext context) {
    double width = 160;
    return ListView.builder(
      controller: controller,
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
            controller.animateTo(index * (width + 16.0),
                duration: Duration(milliseconds: 200), curve: Curves.linear);
            setState(() {
              focusIndex = index;
            });
          },
        );

        return Stack(
          children: [cardView],
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
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          if (index == 0)
            return Container(
              margin: EdgeInsets.only(left: 20, bottom: 4, top: 20),
              child: Image(image: Assets.image("add.png")),
            );
          else if (index == favourites.length + 1)
            return Container(width: 20,);

          Favourite favourite = Favourite().fromJson(favourites[index - 1]);
          return Card(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.only(left: 20, bottom: 4, top: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Image(
              image: Assets.image(favourite.image),
              fit: BoxFit.cover,
              width: 64,
              height: 64,
            ),
          );
        },
        itemCount: favourites.length + 2,
      ),
    );
  }
}
