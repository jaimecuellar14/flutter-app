import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internetstores/models/BikeModel.dart';
class DatabaseService {
  
  final CollectionReference bikesCollection = Firestore.instance.collection('bikes');

  Future addBikesToFireStore(int id, String name, String frameSize, String category, 
  String location, String photoUrl, String priceRange, String description) async {
    print("Trying to add to firebase");
    return await bikesCollection.document().setData({
      'id':id,
      'name':name,
      'frameSize':frameSize,
      'category':category,
      'location':location,
      'photoUrl': photoUrl,
      'priceRange':priceRange,
      'description':description
    });
  }

}