import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/models/news_article.dart';
import 'package:flutter_application_1/requests.dart';
import 'package:flutter_application_1/screens/about.dart';
import 'package:flutter_application_1/screens/news_display.dart';
import 'package:flutter_application_1/screens/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Future<List<NewsArticle>> newsFuture;
  int offset = 0;

  loadNewsFuture({bool next = true}){
    setState(() {
      offset += next? 15: (offset == 0? 0: -15);
      newsFuture = getNews(limit: 15, offset: offset);
    });
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      newsFuture = getNews(limit: 15, offset: offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.breakingNews),
      ),
      drawer: Drawer(child: ListView(children:[
        ListTile(title: Text(AppLocalizations.of(context)!.home), onTap: ()=>Navigator.of(context).pop()),
        ListTile(title: Text(AppLocalizations.of(context)!.settings), onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(c)=>Settings())),),
        ListTile(title: Text(AppLocalizations.of(context)!.about), onTap:() =>Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutPage()))),
      ])),
      body: Column(
        children: [
          FutureBuilder(
            future: newsFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text('No data available'),
                );
              } else {
                List<NewsArticle> articles = snapshot.data;
                return Expanded(
                  child: ListView.builder(
                    itemCount: articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      NewsArticle article = articles[index];
                      var desc = article.description;
                      if(desc != null && desc.length > 200){
                        desc = desc.substring(0, 200) + '...';
                      }
                      return Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          tileColor: Colors.white,
                          leading: article.image == null
                              ? Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Icon(Icons.image, size: 30.0, color: Colors.grey),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    article.image!,
                                    width: 60.0,
                                    height: 60.0,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context, Object exception,
                                        StackTrace? stackTrace) {
                                      return Container(
                                        width: 60.0,
                                        height: 60.0,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[300],
                                          borderRadius: BorderRadius.circular(8.0),
                                        ),
                                        child: Icon(Icons.image, size: 30.0, color: Colors.grey),
                                      );
                                    },
                                  ),
                                ),
                          title: Text(
                            article.title ?? '',
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600, color:  Colors.black),
                          ),
                          subtitle: Text(
                            desc ?? '',
                            style: TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          trailing: Icon(Icons.arrow_forward),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsDisplay(article: article),));
                          },
                        ),
                      );
                
                    },
                  ),
                );
              }
            },
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            ElevatedButton(child: Text(AppLocalizations.of(context)!.previous), onPressed: (){
              loadNewsFuture(next: false);
            },), ElevatedButton(child: Text(AppLocalizations.of(context)!.next), onPressed: (){
              loadNewsFuture(next: true);
            })
          ])
        ],
      ),
    );
  }
}