import 'package:flutter/material.dart';
import 'package:travel_app/screens/places_screen.dart';

import '../model/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel App'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
                'https://img.freepik.com/vector-gratis/ilustracion-palabra-colombia_1284-61355.jpg?w=1800&t=st=1663453705~exp=1663454305~hmac=90c799ca0f350357c0ad80e1ae0f805340d375277e930ee9f055f47c738ab926'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  rowsButton(
                    'Places',
                  ),
                  rowsButton(
                    'Attractions',
                  ),
                  rowsButton(
                    'Hotels',
                  ),
                ],
              ),
            ),
            const Text('Meet best places in Colombia!',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 20),
            GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: datalist.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    clipBehavior: Clip.antiAlias,
                    color: Colors.orange,
                    elevation: 8,
                    child: Stack(
                      children: [
                        Ink.image(
                          image: NetworkImage(datalist[index].cityImage),
                          fit: BoxFit.fill,
                          child: InkWell(onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return PlacesScreen(
                                city: datalist[index],
                              );
                            }));
                          }),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(datalist[index].cityName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Container rowsButton(String name) {
    return Container(
      height: 36,
      width: 110,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
