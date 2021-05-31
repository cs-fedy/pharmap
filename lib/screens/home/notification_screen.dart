import 'package:flutter/material.dart';
import 'package:pharmap/models/notification.dart';
import 'package:pharmap/services/database.dart';
import 'package:pharmap/utils/constants.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notif> notifications;
  Database db = Database();
  @override
  void initState() {
    super.initState();
    db
        .getNotifications()
        .then((value) => setState(() => notifications = value));
  }

  @override
  Widget build(BuildContext context) {
    print("notifications == $notifications");
    if (notifications == null || notifications.length == 0)
      return Scaffold(
        body: Center(
          child: Text(
            "No notification right now",
            style:
                Theme.of(context).textTheme.button.copyWith(color: dangerColor),
          ),
        ),
      );

    return Scaffold(
        body: ListView.separated(
      physics: ClampingScrollPhysics(),
      padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            height: 50.0,
            width: 50.0,
            child: Image.network(pharmacyimg),
          ),
          title: Text(
            notifications[index].title,
            style: Theme.of(context).textTheme.headline2,
          ),
          subtitle: Text(notifications[index].body,
              style: Theme.of(context).textTheme.bodyText1),
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
