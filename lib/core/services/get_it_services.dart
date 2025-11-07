import 'package:e_commerce/core/repos/order_repo/order_repo.dart';
import 'package:e_commerce/core/repos/order_repo/order_repo_impl.dart';
import 'package:e_commerce/core/repos/products_repo/product_repo.dart';
import 'package:e_commerce/core/repos/products_repo/product_repo_impl.dart';
import 'package:e_commerce/core/services/data_service.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/core/services/firestore_services.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo_impl.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt<FirebaseAuthService>(),
      databaseServices: getIt<DatabaseServices>(),
    ),
  );
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(databaseServices: getIt<DatabaseServices>()),
  );
  getIt.registerSingleton<OrderRepo>(
    OrderRepoImpl(firestoreServices: getIt<DatabaseServices>()),
  );
}
