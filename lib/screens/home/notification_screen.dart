import 'package:flutter/material.dart';
import 'package:pharmap/utils/constants.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      itemCount: 12,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            height: 50.0,
            width: 50.0,
            child: Image.network(pharmacyimg),
          ),
          title:
              Text('Tips', style: TextStyle(color: kTextColor, fontSize: 25)),
          subtitle: Text('thanks for downloading our app',
              style: TextStyle(color: kTextLightColor, fontSize: 20)),
          onTap: () {},
          enabled: true,
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    ));
  }
}
