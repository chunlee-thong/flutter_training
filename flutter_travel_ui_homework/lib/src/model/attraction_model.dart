class AttractionModel {
  final String name;
  final String location;
  final String imageUrl;

  AttractionModel(this.name, this.location, this.imageUrl);
}

final kAttractionList = [
  AttractionModel(
    "Angkor wat",
    "Siem reap",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Ankor_Wat_temple.jpg/220px-Ankor_Wat_temple.jpg",
  ),
  AttractionModel(
    "Mount Bokor",
    "Kampot",
    "https://media-cdn.tripadvisor.com/media/photo-s/1a/7f/84/d6/caption.jpg",
  ),
  AttractionModel(
    "Koh Rong",
    "Sihanoukville",
    "https://a.cdn-hotels.com/gdcs/production173/d971/d0c7517e-5c23-4e8d-9816-c02d482ed6c0.jpg?impolicy=fcrop&w=800&h=533&q=medium",
  ),
];
