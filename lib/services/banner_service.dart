import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:marketapp/data/models/banner_model.dart';

class BannerService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createBanner(BannerModel banner) async {
    await _firestore.collection('banners').doc(banner.id).set(banner.toMap());
  }

  Future<BannerModel?> getBanner(String bannerId) async {
    DocumentSnapshot doc = await _firestore.collection('banners').doc(bannerId).get();
    if (doc.exists) {
      return BannerModel.fromDocument(doc);
    }
    return null;
  }

  Future<void> updateBanner(BannerModel banner) async {
    await _firestore.collection('banners').doc(banner.id).update(banner.toMap());
  }

  Future<void> deleteBanner(String bannerId) async {
    await _firestore.collection('banners').doc(bannerId).delete();
  }

  Future<List<BannerModel>> getAllBanners() async {
    QuerySnapshot querySnapshot = await _firestore.collection('banners').get();
    return querySnapshot.docs.map((doc) => BannerModel.fromDocument(doc)).toList();
  }
}
