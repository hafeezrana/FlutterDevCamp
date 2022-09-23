class Data {
  late String cityName;
  late String cityImage;
  late String cityDes;
  List<Place> places;
  Data({
    required this.cityName,
    required this.cityImage,
    required this.cityDes,
    required this.places,
  });
}

class Place {
  late String placeName;
  late String placeDesc;
  late String placeImage;
  Place({
    required this.placeName,
    required this.placeDesc,
    required this.placeImage,
  });
}

List<Data> datalist = [
  Data(
    cityName: "Neiva",
    cityImage:
        "https://como-viviren.com/wp-content/uploads/2020/07/vivir-en-neiva.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
        placeName: 'zoo',
        placeDesc:
            'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
        placeImage:
            'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg',
      ),
      Place(
        placeName: 'sahara',
        placeDesc:
            'Cartagena es una ciudad ubicada en la costa caribeña de Colombia y uno de los mejores destinos turísticos de Colombia. A finales del siglo XVI, la ciudad construyó un muro para proteger a sus habitantes de ser robados por piratas. La muralla sigue en pie hoy, y se ha convertido en un espectáculo de la ciudad junto con su colorida arquitectura. ',
        placeImage:
            'https://www.1000y1viajes.com/wp-content/uploads/2019/12/Ciudad-amurallada-Cartagena-atracciones-turisticas-colombia.jpg',
      ),
      Place(
        placeName: 'amazon',
        placeDesc:
            'La selva amazónica es un vasto ecosistema que cubre grandes áreas de Colombia, Perú y Brasil. Visitar la selva amazónica es una experiencia única, donde presenciarás comunidades que viven con la naturaleza y muy pocos artículos materiales. Visitar una comunidad amazónica es una experiencia que cambia la vida; puedes ver cómo viven los aldeanos sin agua corriente ni electricidad. En el Amazonas puedes caminar por la selva tropical, visitar la isla de los monos, hacer excursiones en barco y pescar pirañas. Te recomendamos el tour de las tres fronteras por el Amazonas.',
        placeImage:
            'https://www.1000y1viajes.com/wp-content/uploads/2019/12/selva-amazonica-lugares-turisticos-colombia.jpg',
      ),
      Place(
        placeName: 'seashore',
        placeDesc:
            'El Parque Nacional Tayrona está ubicado cerca de la ciudad de Santa Marta, en la costa caribeña. El Parque Nacional Tayrona es un área sagrada para la comunidad indígena local de la Sierra Nevada de Santa Marta. El parque cuenta con algunas de las playas más hermosas del país, respaldadas por la selva tropical y las montañas nevadas de Sierra Nevada. No te pierdas esta excursión al parque Tayrona.',
        placeImage:
            'https://www.1000y1viajes.com/wp-content/uploads/2019/12/Parque-Tayrona-lugares-turisticos-colombia.jpg',
      ),
      Place(
        placeName: 'Palomino',
        placeDesc:
            'Palomino se encuentra cerca del Parque Nacional Tayrona. Sus hermosas playas de arena blanca están respaldadas por las montañas nevadas de la Sierra Nevada de Santa Marta, lo que hace que esta área sea única y una de las principales atracciones turísticas de Colombia. La playa de Palomino tiene dos ríos de agua dulce que bajan desde las montañas hasta el océano. Uno de los atractivos turísticos de esta playa es el «tubing» que consiste en bajar por el río en un neumático flotante, aquí te dejamos la excursión perfecta en la playa de Palomino.',
        placeImage:
            'https://www.1000y1viajes.com/wp-content/uploads/2019/12/Palomino-atracciones-turisticas-en-colombia.jpg',
      ),
      Place(
        placeName: 'Barrichara',
        placeDesc:
            'Barichara es una ciudad colonial única formada por edificios encalados con techos de color naranja, que bordean todas las calles adoquinadas. La ciudad es el paraíso de los fotógrafos, con pequeñas tiendas y restaurantes ubicados dentro de edificios de estilo colonial, una gran plaza y un mirador sobre las montañas. Barichara está lleno de artesanías y restaurantes familiares únicos, como la Pizzeria Siete Tigres.',
        placeImage:
            'https://www.1000y1viajes.com/wp-content/uploads/2019/12/Barichara-destinos-turisticos-colombia.jpg',
      )
    ],
  ),
  Data(
    cityName: "Parque Tayrona",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/Parque-Tayrona-lugares-turisticos-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Medellin",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/Medelli%CC%81n-lugares-turisticos-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Caño Cristales",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/Can%CC%83o-Cristales-lugares-turisticos-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Selva Amazónica",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/selva-amazonica-lugares-turisticos-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Catedral de Sal",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/Catedral-de-Sal-lugares-turisticos-de-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Guatapé",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/Guatape%CC%81-atracciones-turi%CC%81sticas-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Isla San Andrés",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/San-Andre%CC%81s-lugares-turisticos-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Valle de Cocora",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/valle-del-cocora-destinos-turisticos-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
  Data(
    cityName: "Costa Pacifíco",
    cityImage:
        "https://www.1000y1viajes.com/wp-content/uploads/2019/12/bahia-solano-destinos-turisticos-de-colombia.jpg",
    cityDes:
        'Caño Cristales , or "the river of five colors", is located in the Serranía de la Macarena National Park . This unique and wonderfully colorful phenomenon is a picturesque sight located in a remote part of the country. The 62-mile (100-kilometer) stretch of river has beautiful waterfalls and natural pools. We recommend you do this 4-day tour of Caño Cristales and Sierra de la Macarena .',
    places: [
      Place(
          placeName: 'Italy restaurant',
          placeDesc:
              'Start the day near Bebelplatz and visit the most popular street in Berlin, ´Unter den Linden´ , which connects the world-famous Brandenburg Gate with Alexander Platz . Along the way, you will see several baroque and neoclassical palaces, many of which have been created by world-famous architects.',
          placeImage:
              'https://www.1000y1viajes.com/wp-content/uploads/2020/01/centro-de-Berl%C3%ADn.jpg')
    ],
  ),
];
