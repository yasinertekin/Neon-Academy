// import 'package:auth_case/product/model/post_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../model/user_model.dart';

// /// FirebaseFireStoreServiceInterface
// abstract class FirebaseFireStoreServiceInterface {
//   /// Default constructor
//   FirebaseFireStoreServiceInterface(this.firestore);

//   /// Get subscriptions
//   Future<List<PostModel>> getPosts();

//   /// Firestore instance
//   final FirebaseFirestore firestore;

//   /// Create users
//   Future<void> createUsers(UserModel users);

//   /// Create subscriptions
//   Future<void> updateSubscriptionList(
//     String userId,
//     Subscriptions newSubscription,
//   );

//   /// Delete subscriptions element
//   Future<void> deleteSubscriptionsElement(
//     String userId,
//     Subscriptions newSubscription,
//   );

//   /// Update Subscriptions
//   Future<void> updateSubscriptions(
//     Subscriptions newSubscription,
//     Subscriptions oldSubscription,
//     String userId,
//   );
// }
