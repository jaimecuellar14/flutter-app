class BikeModel {
  int id;
  String framesize;
  String category;
  String location;
  String name;
  String photoUrl;
  String priceRange;
  String description;

  BikeModel._({this.id,this.framesize,this.category,this.location,this.name,this.photoUrl,this.priceRange,this.description});
  BikeModel(int id, String framesize, String category, String location,
   String name, String photoUrl, String priceRange, String description){
     this.id = id;
     this.framesize = framesize;
     this.category = category;
     this.location = location;
     this.name = name;
     this.photoUrl = photoUrl;
     this.priceRange = priceRange;
     this.description = description;
  }
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