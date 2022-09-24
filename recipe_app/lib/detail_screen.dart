import 'package:flutter/material.dart';

import 'model.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({required this.recipe});

  Recipe recipe;

  final textStyle2 = const TextStyle(
          decoration: TextDecoration.none,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.blue)
      .copyWith();
  final textStyle3 = const TextStyle(
    decoration: TextDecoration.none,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.orange[400],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25))),
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.white,
                            )),
                        Text(
                          recipe.recipeName,
                          style: textStyle2.copyWith(color: Colors.white),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.timer_outlined,
                                color: Colors.white),
                            Text(
                              recipe.deliveryDuration,
                              style: textStyle3.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star_border,
                              color: Colors.white,
                            ),
                            Text(
                              recipe.recipeReview,
                              style: textStyle3.copyWith(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.network(
                    recipe.recipeImage,
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    'Ingredients',
                    style: textStyle2,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 260,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: recipe.ingredient.length,
                        itemBuilder: (_, index) {
                          return SizedBox(
                            height: 30,
                            child: Text(
                              recipe.ingredient[index].ingredients,
                              style: textStyle3,
                            ),
                          );
                        }),
                  ),
                  Text(
                    'Direction',
                    style: textStyle2,
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: recipe.direction.length,
                        itemBuilder: (_, index) {
                          return Text(
                            recipe.direction[index].directions,
                            style: textStyle3,
                          );
                        }),
                  ),
                  Text(
                    'Detail',
                    style: textStyle2,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    recipe.recipeDetail,
                    style: textStyle3,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
