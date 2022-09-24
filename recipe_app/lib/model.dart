class Recipe {
  late String recipeName;
  late String recipeImage;
  late String recipeReview;
  late String recipeDetail;
  late String deliveryDuration;
  late List<Ingredients> ingredient;
  late List<Direction> direction;
  Recipe({
    required this.recipeName,
    required this.recipeImage,
    required this.recipeReview,
    required this.recipeDetail,
    required this.deliveryDuration,
    required this.ingredient,
    required this.direction,
  });
}

class Ingredients {
  late String ingredients;
  Ingredients({
    required this.ingredients,
  });
}

class Direction {
  late String directions;
  Direction({
    required this.directions,
  });
}

List<Recipe> recipe_list = [
  Recipe(
    recipeName: 'Karachi Biryani',
    recipeImage: 'https://pbs.twimg.com/media/DZpNSLCW4AA1o_g.jpg',
    deliveryDuration: '50 minutes',
    recipeReview: '1493 Reviews',
    recipeDetail:
        'Karachi is the most populated city in Pakistan. There are lots of variations in cultures and traditions among the locals. That is why Karachi cuisine is one the famous and biggest cuisine of Pakistan. And people of Karachi like more spicy food. That is masala Karachi biryani is one of the spiciest dishes of Karachi. This dish is made in pure traditional masalas that is why it tastes like hot chillies',
    ingredient: [
      Ingredients(ingredients: '1.  6-7 onions'),
      Ingredients(ingredients: '2.  1/2 kg tomatoes'),
      Ingredients(
          ingredients: '3. Half bunch of mint leaves and half of coriander'),
      Ingredients(ingredients: '4.  1 tbs vinegar'),
      Ingredients(ingredients: '5. 1 tbs ginger garlic paste'),
    ],
    direction: [
      Direction(
          directions: '1. Half bunch of mint leaves and half of coriander'),
      Direction(
          directions:
              '2. 1 bay leaf, 6-7 cloves, 4-5badian phool (star anise)'),
    ],
  ),
  Recipe(
    recipeName: 'Lahori Pizza',
    recipeImage:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-33JHx0TqaG6Sp1S60idcxRC3_pwc_syHpUdloCSAioscVGign2wHL7pDFeoctNcFq60&usqp=CAU',
    recipeDetail:
        'ake a dough kneading plate and add all-purpose flour to it. Next, add salt and baking powder in it and sieve the flour once. Then, make a well in the centre and add 1 teaspoon of oil to it. On the other hand, take a little warm water and mix the yeast in it along with 1 teaspoon of sugar. Mix well and keep aside for 10-15 minutes.',
    recipeReview: '102 Reviews',
    deliveryDuration: '40 minutes',
    ingredient: [
      Ingredients(ingredients: '1. 2 cup all purpose flour'),
      Ingredients(ingredients: '2. 100 ml tomato ketchup'),
      Ingredients(ingredients: '3. 100 gm processed cheese'),
      Ingredients(ingredients: '4. 4 mushroom'),
      Ingredients(ingredients: '5. 1/2 cup mozzarella'),
      Ingredients(ingredients: '6. 1 tablespoon dry yeast'),
      Ingredients(ingredients: '7. water as required'),
    ],
    direction: [
      Direction(
          directions:
              '1. Golu started from his house towards North. After covering a distance of 8 km.'),
      Direction(
          directions:
              '2. A man walks 2 km towards North. Then he turns to East and walks 10 km.')
    ],
  ),
];
