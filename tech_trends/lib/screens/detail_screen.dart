import 'package:flutter/material.dart';
import 'package:tech_trends/constants/color_consts.dart';
import 'package:tech_trends/model/data.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/text-styls.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.articles});
  Articles articles;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    var sourced = widget.articles.publishedAt!;
    // final formatedDate = DateFormat('yyyy-MM-dd').format(sourced);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backColor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
            )),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Text(widget.articles.title ?? '', style: StyleText.textStyle1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.articles.description!,
              style: StyleText.textStyle3,
            ),
          ),
          const SizedBox(height: 10),
          Image.network(
            widget.articles.urlToImage ?? '',
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const Center(child: Text(''));
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              sourced,
              style: StyleText.textStyle3,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.articles.content ?? '',
              style: StyleText.textStyle3,
            ),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'source:',
              style: StyleText.textStyle1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              widget.articles.source?.name ?? '',
              style: StyleText.textStyle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: InkWell(
              onTap: () async {
                try {
                  final urlText = Uri.parse(widget.articles.url!);
                  var launching = await canLaunchUrl(urlText);
                  if (launching) {
                    await launchUrl(urlText);
                    print('succesffuly launcing $urlText');
                  } else {
                    print('could not launch $urlText');
                  }
                } on Exception catch (e) {
                  e.toString();
                }
              },
              child: Text(
                widget.articles.url ?? '',
                style: StyleText.textStyle2.copyWith(
                    color: AppColors.blue,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
