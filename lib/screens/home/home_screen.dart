import 'package:flutter/material.dart';
import 'package:pharmap/models/article.dart';
import 'package:pharmap/services/database.dart';
import 'package:pharmap/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  static final String id = '/HomeScreen';
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> articles;
  Database db = Database();
  @override
  void initState() {
    super.initState();
    db.getArticles().then((value) => setState(() => articles = value));
  }

  void _launchUrl(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    if (articles == null)
      return Center(
        child: Text("Loading..."),
      );

    return Scaffold(
      body: SafeArea(
        child: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
          itemCount: articles.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => _launchUrl(articles[index].url),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Container(
                    width: double.infinity,
                    child:
                        Image.network(articles[index].image, fit: BoxFit.fill),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    articles[index].title,
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .copyWith(fontSize: 20.0, color: dangerColor),
                  ),
                  SizedBox(height: 15),
                  Text(
                    articles[index].body,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: darkPrimaryColor),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),
      ),
    );
  }
}
