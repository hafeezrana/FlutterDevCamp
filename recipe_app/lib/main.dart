import 'package:flutter/material.dart';
import 'package:recipe_app/model.dart';

import 'detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        primaryColor: const Color(0xff2F5A71),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final textStyle1 = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white);
  final textStyle2 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  final textStyle3 = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff2F5A71),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.filter_list_sharp),
          actions: const [
            Icon(Icons.notifications_on_outlined),
            SizedBox(width: 5)
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(height: 10),
              Text('Hi Rana', style: textStyle2.copyWith(color: Colors.grey)),
              const SizedBox(height: 10),
              Text('What do you want to cook today?', style: textStyle1),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.search,
                        size: 27,
                      ),
                      const SizedBox(width: 5),
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Search food',
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text('Most Popular Recipes',
                  style: textStyle2.copyWith(color: Colors.white)),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 2.8,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recipe_list.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return DetailScreen(
                                  recipe: recipe_list[index],
                                );
                              }));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amber[400],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.network(
                                      recipe_list[index].recipeImage,
                                      width: 150,
                                      height: 150,
                                    ),
                                    Text(
                                      recipe_list[index].recipeName,
                                      style: textStyle2,
                                    ),
                                    // const Divider(
                                    //   height: 2,
                                    //   color: Colors.black,
                                    //   endIndent: 10,
                                    //   indent: 10,
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Icon(
                                          Icons.timer_outlined,
                                        ),
                                        Text(
                                          recipe_list[index].deliveryDuration,
                                          style: textStyle3,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Icon(
                                          Icons.star_border,
                                        ),
                                        Text(
                                          recipe_list[index].recipeReview,
                                          style: textStyle3,
                                        ),
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                        );
                      })),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const SizedBox(
                          child: Icon(
                        Icons.tune_rounded,
                        size: 35,
                        color: Color.fromARGB(255, 191, 186, 186),
                      )),
                      MyContainer('Entries'),
                      MyContainer('Apps'),
                      MyContainer('Meets'),
                      MyContainer('Popularity'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff2F5A71),
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget MyContainer(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 30,
          width: MediaQuery.of(context).size.width / 4.5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 11, 35, 50),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
              child:
                  Text(text, style: textStyle3.copyWith(color: Colors.white)))),
    );
  }
}
