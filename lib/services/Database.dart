import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:internetstores/models/BikeModel.dart';

/**
 * Service to connect to firebase
 * And execute CRUD operations
 * (updated not added because its not in the scope of the problem)
 */
class DatabaseService {
  
  final databaseReference = Firestore.instance;

  void addBikesToFireStore(BikeModel bike) async{
    databaseReference.collection("bikes")
      .document(bike.id.toString())
      .setData({
        'name':bike.name,
        'description':bike.description,
        'priceRange':bike.priceRange,
        'frameSize':bike.framesize,
        'location':bike.location,
        'category':bike.category,
        'photoUrl':bike.photoUrl
      });
  }

  List<BikeModel> _bikesFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return BikeModel(
        int.tryParse(doc.documentID),
        doc.data['frameSize'],
        doc.data['category'],
        doc.data['location'],
        doc.data['name'],
        doc.data['photoUrl'],
        doc.data['priceRage'],
        doc.data['description']
      );
    }).toList();
  }

  Stream<List<BikeModel>> get bikes {
    return databaseReference.collection("bikes")
              .snapshots()
              .map(_bikesFromSnapshot);
  }

  getBikes() async {
    QuerySnapshot querySnapshot = await databaseReference.collection("bikes")
                                    .getDocuments();
    return querySnapshot.documents;
  }
  void deleteBike(id){
    try{
      databaseReference.collection("bikes")
        .document(id.toString())
        .delete();
    }catch(e){
      print(e.toString());
    }
  }
  
}