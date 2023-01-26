class AttractionModel {
  String name;
  List<String> image;
  String description;
  double price;
  double rating;

  AttractionModel(
      {required this.description,
      required this.image,
      required this.name,
      required this.price,
      required this.rating});

 static List<AttractionModel> attractionPlaces = [
    AttractionModel(
      name: 'Amazon Forest',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      price: 195,
      rating: 4.5,
      image: [
        'assets/images/images (1).jpeg',
        'assets/images/image2.jpg',
        'assets/images/back.jpg',
        'assets/images/back2.jpg',
        'assets/images/back3.jpg',
      ],
    ),
    AttractionModel(
      name: 'Grand Canyon \n Arizona',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      price: 250,
      rating: 5,
      image: [
        'assets/images/back.jpg',
        'assets/images/back2.jpg',
        'assets/images/back3.jpg',
        'assets/images/images (1).jpeg',
        'assets/images/image2.jpg',
      ],
    ),
    AttractionModel(
      name: 'Waduk Wenerojo',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      price: 150,
      rating: 4.0,
      image: [
        'assets/images/back3.jpg',
        'assets/images/images (1).jpeg',
        'assets/images/image2.jpg',
        'assets/images/back.jpg',
        'assets/images/back2.jpg',
      ],
    ),
    AttractionModel(
      name: 'Tulu Dimtu',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
      price: 195,
      rating: 4.5,
      image: [
        'assets/images/back2.jpg',
        'assets/images/images (1).jpeg',
        'assets/images/image2.jpg',
        'assets/images/back.jpg',
        'assets/images/back3.jpg',
      ],
    ),
  ];
}
