import 'package:flutter/material.dart';
import 'package:travel_app/screens/places_detail_screen.dart';

import '../model/data.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({required this.city, Key? key}) : super(key: key);

  final Data city;

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text(widget.city.cityName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.city.cityImage),
            const Text('Popular places',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.city.places.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return PlacesDetailScreen(
                                place: widget.city.places[index],
                              );
                            }));
                          },
                          child: CircleAvatar(
                            radius: 28,
                            backgroundImage: NetworkImage(
                              widget.city.places[index].placeImage,
                            ),
                          ),
                        ),
                        Text(widget.city.places[index].placeName,
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const Text('Information',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.city.cityDes,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )),
            ),
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
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
