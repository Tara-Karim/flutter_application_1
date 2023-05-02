import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/news_article.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsDisplay extends StatelessWidget {
  final NewsArticle article;

  const NewsDisplay({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat.yMd().add_Hm();
    final formattedDate = dateFormatter.format(article.publishedAt!);

    return Scaffold(
      appBar: AppBar(
        title: Text(article.source ?? ''),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (article.image != null)
              Image.network(
                article.image!,
                height: 250.0,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return SizedBox.shrink();
                },
              ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.title ?? '',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                formattedDate,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                article.description ?? '',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(article.url!))) {
                    await launchUrl(Uri.parse(article.url!));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sorry'),));
                  }
                },
                child: Text('Read Full Article'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
