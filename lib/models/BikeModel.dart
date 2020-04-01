class BikeModel {
  final int id;
  final String framesize;
  final String category;
  final String location;
  final String name;
  final String photoUrl;
  final String priceRange;
  final String description;

  BikeModel._({this.id,this.framesize,this.category,this.location,this.name,this.photoUrl,this.priceRange,this.description});

  factory BikeModel.fromJson(Map<String,dynamic> json){
    return new BikeModel._(
      id: json['id'],
      framesize: json['frameSize'],
      category: json['category'],
      location: json['location'],
      name: json['name'],
      photoUrl: json['photoUrl'],
      priceRange: json['priceRange'],    
      description: json['description'], 
    );
  }
}