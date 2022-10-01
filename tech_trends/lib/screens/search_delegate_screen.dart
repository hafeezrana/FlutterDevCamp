import 'package:flutter/material.dart';
import 'package:tech_trends/services/services.dart';

import '../constants/color_consts.dart';
import '../constants/text-styls.dart';
import '../model/data.dart';
import 'detail_screen.dart';

class CustomSearchDelegate extends SearchDelegate {
  MyServices apiService = MyServices();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
          textBaseline: TextBaseline.alphabetic,
          fontSize: 18,
        ),
        shadowColor: AppColors.grey,
        backgroundColor: AppColors.backColor,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    [
      InkWell(
        onTap: () {
          query = '';
        },
        child: const Icon(Icons.search, size: 26, color: Colors.black),
      ),
      const SizedBox(width: 10),
    ];
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
        close(context, null);
      },
      child: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<NewsHeadlines>(
        future: apiService.searchData(query),
        builder: (context, snapshot) {
          final trend = snapshot.data;
          // print('$trend---Data-Recieved----');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColors.blue,
              backgroundColor: AppColors.red,
            ));
          }

          if (snapshot.data == null) {
            return const Center(child: Text('No Data Found'));
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trend?.articles?.length ?? 0,
              itemBuilder: (context, index) {
                var article = trend?.articles?[index];
                return MyListBuilder(article?.title ?? '',
                    article?.author ?? '', article?.urlToImage ?? '', () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return DetailScreen(articles: article!);
                    },
                  ));
                });
              },
            );
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search by News Title'));
  }

  Widget MyListBuilder(
      String title, String subTitle, String url, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Expanded(
        child: SizedBox(
            // height: 140,
            child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ListTile(
                title: Text(
                  title,
                  style: StyleText.textStyle1,
                ),
                subtitle: Text(
                  subTitle,
                  style: StyleText.textStyle3,
                ),
                trailing: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      url,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.blue,
                            backgroundColor: AppColors.red,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Center(child: Text(''));
                      },
                    )),
              ),
            ),
          ),
        )),
      ),
    );
  }
}

// class CustomSearchDelegate extends SearchDelegate {
// // Demo list to show querying

// // first overwrite to
// // clear the search text

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = '';
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }

// // second overwrite to pop out of search menu
//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         close(context, null);
//       },
//       icon: const Icon(Icons.arrow_back),
//     );
//   }

// // third overwrite to show query result
//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//           onTap: () {},
//         );
//       },
//     );
//   }

// // last overwrite to show the
// // querying process at the runtime
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuery = [];
//     for (var fruit in searchTerms) {
//       if (fruit.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(fruit);
//       }
//     }
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         var result = matchQuery[index];
//         return ListTile(
//           title: Text(result),
//         );
//       },
//     );
//   }
// }
