import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'config/firebase_options.dart';
import 'presentation/screens/home/home_screen.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/user_repository.dart';
import 'data/repositories/product_repository.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/cart_repository.dart';
import 'data/repositories/order_repository.dart';
import 'data/repositories/payment_method_repository.dart';
import 'data/repositories/notification_repository.dart';
import 'data/repositories/banner_repository.dart';
import 'data/repositories/promotion_repository.dart';
import 'data/repositories/review_repository.dart';
import 'data/repositories/support_ticket_repository.dart';
import 'data/repositories/recommendation_repository.dart';
import 'data/repositories/search_history_repository.dart';
import 'data/repositories/address_repository.dart';
import 'logic/blocs/auth/auth_bloc.dart';
import 'logic/blocs/user/user_bloc.dart';
import 'logic/blocs/product/product_bloc.dart';
import 'logic/blocs/category/category_bloc.dart';
import 'logic/blocs/cart/cart_bloc.dart';
import 'logic/blocs/order/order_bloc.dart';
import 'logic/blocs/payment_method/payment_method_bloc.dart';
import 'logic/blocs/notification/notification_bloc.dart';
import 'logic/blocs/banner/banner_bloc.dart';
import 'logic/blocs/promotion/promotion_bloc.dart';
import 'logic/blocs/review/review_bloc.dart';
import 'logic/blocs/support_ticket/support_ticket_bloc.dart';
import 'logic/blocs/recommendation/recommendation_bloc.dart';
import 'logic/blocs/search_history/search_history_bloc.dart';
import 'logic/blocs/address/address_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GrocerEaseApp());
}

class GrocerEaseApp extends StatelessWidget {
  final AuthRepository _authRepository = AuthRepository();
  final UserRepository _userRepository = UserRepository();
  final ProductRepository _productRepository = ProductRepository();
  final CategoryRepository _categoryRepository = CategoryRepository();
  final CartRepository _cartRepository = CartRepository();
  final OrderRepository _orderRepository = OrderRepository();
  final PaymentRepository _paymentMethodRepository = PaymentRepository();
  final NotificationRepository _notificationRepository = NotificationRepository();
  final BannerRepository _bannerRepository = BannerRepository();
  final PromotionRepository _promotionRepository = PromotionRepository();
  final ReviewRepository _reviewRepository = ReviewRepository();
  final SupportTicketRepository _supportTicketRepository = SupportTicketRepository();
  final RecommendationRepository _recommendationRepository = RecommendationRepository();
  final SearchHistoryRepository _searchHistoryRepository = SearchHistoryRepository();
  final AddressRepository _addressRepository = AddressRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(_authRepository),
        ),
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(_userRepository),
        ),
        BlocProvider<ProductBloc>(
          create: (context) => ProductBloc(_productRepository),
        ),
        BlocProvider<CategoryBloc>(
          create: (context) => CategoryBloc(_categoryRepository),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(_cartRepository),
        ),
        BlocProvider<OrderBloc>(
          create: (context) => OrderBloc(_orderRepository),
        ),
        BlocProvider<PaymentMethodBloc>(
          create: (context) => PaymentMethodBloc(_paymentMethodRepository),
        ),
        BlocProvider<NotificationBloc>(
          create: (context) => NotificationBloc(_notificationRepository),
        ),
        BlocProvider<BannerBloc>(
          create: (context) => BannerBloc(_bannerRepository),
        ),
        BlocProvider<PromotionBloc>(
          create: (context) => PromotionBloc(_promotionRepository),
        ),
        BlocProvider<ReviewBloc>(
          create: (context) => ReviewBloc(_reviewRepository),
        ),
        BlocProvider<SupportTicketBloc>(
          create: (context) => SupportTicketBloc(_supportTicketRepository),
        ),
        BlocProvider<RecommendationBloc>(
          create: (context) => RecommendationBloc(_recommendationRepository),
        ),
        BlocProvider<SearchHistoryBloc>(
          create: (context) => SearchHistoryBloc(_searchHistoryRepository),
        ),
        BlocProvider<AddressBloc>(
          create: (context) => AddressBloc(_addressRepository),
        ),
      ],
      child: MaterialApp(
        title: 'GrocerEase',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
