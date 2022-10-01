import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_trends/constants/color_consts.dart';
import 'package:tech_trends/services/services.dart';

import '../constants/text-styls.dart';
import '../model/data.dart';
import 'detail_screen.dart';
import 'search_delegate_screen.dart';

enum Country { ae, us, ar, ca, se }

List<String> myList = [
  'sports',
  'entertainment',
  'business',
  'science',
  'technology'
];

enum Category { business, entertainment, science, sports, technology }

// ro, ru, il
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

final services = MyServices();

class _HomeState extends State<Home> {
  String countryName = '';
  String category = '';

  @override
  void initState() {
    countryName = Country.ae.name;

    super.initState();
  }

  bool pressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backColor,
      body: SafeArea(
        child: FutureBuilder<NewsHeadlines>(
          future: services.filterData(
              filterByCountry: countryName, category: category),
          builder: (context, snapshot) {
            final news = snapshot.data;

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
              return CustomScrollView(
                scrollDirection: Axis.vertical,
                physics: const ScrollPhysics(),
                slivers: [
                  SliverLayoutBuilder(
                    builder: (context, constraints) {
                      var scrolled = constraints.scrollOffset > 220 &&
                          constraints.scrollOffset < 20000;

                      return SliverAppBar(
                        backgroundColor: AppColors.backColor,
                        pinned: true,
                        expandedHeight: 570.0,
                        floating: false,
                        snap: false,
                        actions: [
                          scrolled
                              ? InkWell(
                                  onTap: () {
                                    showSearch(
                                        context: context,
                                        delegate: CustomSearchDelegate());
                                    pressed = !pressed;
                                    setState(() {});
                                  },
                                  child: const Icon(
                                    Icons.search,
                                    size: 26,
                                    color: AppColors.black,
                                  ),
                                )
                              : const SizedBox(),
                          const SizedBox(width: 10),
                        ],
                        flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.none,
                          stretchModes: const [StretchMode.blurBackground],
                          background: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Top Head Lines',
                                        style: StyleText.textTop,
                                      ),
                                      PopupMenuButton(
                                        iconSize: 30,
                                        icon: Text(countryName,
                                            style: StyleText.textStyle2),
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem(
                                              value: Country.ae,
                                              child: Text(Country.ae.name),
                                            ),
                                            PopupMenuItem(
                                              value: Country.us,
                                              child: Text(Country.us.name),
                                            ),
                                            PopupMenuItem(
                                              value: Country.ar,
                                              child: Text(Country.ar.name),
                                            ),
                                            PopupMenuItem(
                                              value: Country.ca,
                                              child: Text(Country.ca.name),
                                            ),
                                          ];
                                        },
                                        onSelected: (value) async {
                                          setState(() {});
                                          countryName = value.name;
                                          await services.filterData(
                                              category: countryName);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                  child: Text(
                                    'Breaking News',
                                    style: StyleText.textStyle2,
                                  ),
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                      color: AppColors.backColor),
                                  height: 180,
                                  width: double.infinity,
                                  child: CarouselSlider.builder(
                                    itemCount: news?.articles?.length,
                                    itemBuilder: (context, index, realIndex) {
                                      final article = news?.articles?[index];

                                      return SizedBox(
                                        height: 170,
                                        width: double.infinity,
                                        child: Card(
                                          elevation: 10,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.network(
                                              article?.urlToImage ?? '',
                                              fit: BoxFit.cover,
                                              loadingBuilder:
                                                  (BuildContext context,
                                                      Widget child,
                                                      ImageChunkEvent?
                                                          loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColors.blue,
                                                    backgroundColor:
                                                        AppColors.red,
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                );
                                              },
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return const Center(
                                                    child: Text(''));
                                              },
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    options: CarouselOptions(
                                      viewportFraction: 1,
                                      autoPlayCurve: Curves.easeInOut,
                                      autoPlayAnimationDuration:
                                          const Duration(seconds: 1),
                                      autoPlay: true,
                                      enlargeCenterPage: true,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                  child: Text(
                                    'Category:',
                                    style: StyleText.textStyle2,
                                  ),
                                ),
                                Container(
                                  color: AppColors.backColor,
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categoryImages.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.7,
                                          height: 200,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return DetailScreen(
                                                        articles: news!
                                                            .articles![index]);
                                                  },
                                                ),
                                              );
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              elevation: 10,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: Image.network(
                                                  categoryImages[index],
                                                  fit: BoxFit.fill,
                                                  errorBuilder: (BuildContext
                                                          context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                    return const Center(
                                                        child: Text(''));
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: myList.map((e) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {});
                                          category = e;
                                        },
                                        child: SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.5,
                                            child: Center(
                                              child: Text(
                                                e,
                                                style: StyleText.textStyle2,
                                              ),
                                            )),
                                      );
                                    }).toList(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: news?.articles?.length ?? 0,
                      (context, index) {
                        final article = news?.articles?[index];
                        return MyListBuilder(
                          article?.title ?? '',
                          article?.author ?? '',
                          article?.urlToImage ?? '',
                          () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailScreen(articles: article!);
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  List<String> categoryImages = [
    'https://upload.wikimedia.org/wikipedia/commons/9/92/Youth-soccer-indiana.jpg',
    'https://cdn-dkkhb.nitrocdn.com/rWsUTHGwuxKZXMHpEyNfyvsotzIbADmB/assets/static/optimized/rev-ce024c4/wp-content/uploads/2018/08/music-as-a-good-source-for-entertainment-420x280_c.jpg',
    'https://assets.entrepreneur.com/content/3x2/2000/20191127190639-shutterstock-431848417-crop.jpeg?auto=webp&quality=95&crop=16:9&width=675',
    'https://www.pewresearch.org/science/wp-content/uploads/sites/16/2020/09/PS_20.09.24_InternationalScience_featured.jpg?resize=690,388',
    'http://www.artizone.in/wp-content/uploads/2021/02/Technology-trends-for-the-future-of-work-in-2020-1024x640-1024x585.jpg',
  ];

  Widget MyListBuilder(
      String title, String subTitle, String url, void Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Expanded(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          title,
                          style: StyleText.textStyle1,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          subTitle,
                          style: StyleText.textStyle3,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 110,
                    width: MediaQuery.of(context).size.width / 3.3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        url,
                        fit: BoxFit.fill,
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
                          return const Center(child: Text('😢'));
                        },
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

// Category.values.map((e) {
//                             return Container(
//                                 margin: const EdgeInsets.symmetric(vertical: 8),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(color: Colors.black),
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.amber,
//                                 ),
//                                 height: 30,
//                                 width: MediaQuery.of(context).size.width / 5,
//                                 child: Tab(text: e.name));
//                           }).toList(),
