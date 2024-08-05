import 'package:e_commerce/feature/account/presantation/view/account_page.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/search_page.dart';
import 'package:e_commerce/feature/cart/presantation/view/cart_page.dart';
import 'package:e_commerce/feature/bottom_nav/view/bottom_nav_page.dart';
import 'package:e_commerce/feature/cart/presantation/view/subView/cart_page_accepted.dart';
import 'package:e_commerce/feature/explore/presantation/view/explore_page.dart';
import 'package:e_commerce/feature/explore/presantation/view/subview/explore_category_detail_page.dart';
import 'package:e_commerce/feature/explore/presantation/view/subview/explore_search.dart';
import 'package:e_commerce/feature/favourite/presantation/view/favourite_page.dart';
import 'package:e_commerce/feature/home/data/models/meal/meal_model.dart';
import 'package:e_commerce/feature/home/presentation/view/home_page.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/all_product_page.dart';
import 'package:e_commerce/feature/home/presentation/view/sub_view/product_detail_page.dart';
import 'package:e_commerce/feature/landing/presantation/view/landing_page.dart';
import 'package:e_commerce/feature/onboarding/presantation/view/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  final router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/',
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        pageBuilder: (context, state, child) {
          return CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return PageTransition<Widget>(
                      child: child, type: PageTransitionType.fade)
                  .child;
            },
            child: BottomNavPage(
              child: child,
            ),
          );
        },
        routes: [
          GoRoute(
            name: 'home_page',
            path: '/home_page',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return PageTransition<Widget>(
                    child: child,
                    type: PageTransitionType.fade,
                  ).child;
                },
                child: const HomePage(),
              );
            },
          ),
          GoRoute(
              path: '/cart_page',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return PageTransition<Widget>(
                      child: child,
                      type: PageTransitionType.fade,
                    ).child;
                  },
                  child: const CartPage(),
                );
              }),
          GoRoute(
              path: '/explore_page',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return PageTransition<Widget>(
                      child: child,
                      type: PageTransitionType.fade,
                    ).child;
                  },
                  child: const ExplorePage(),
                );
              }),
          GoRoute(
              path: '/account_page',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return PageTransition<Widget>(
                      child: child,
                      type: PageTransitionType.fade,
                    ).child;
                  },
                  child: const AccountPage(),
                );
              }),
          GoRoute(
              path: '/favourite_page',
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return PageTransition<Widget>(
                      child: child,
                      type: PageTransitionType.fade,
                    ).child;
                  },
                  child: const FavouritePage(),
                );
              }),
        ],
      ),
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const LandingPage();
        },
      ),
      GoRoute(
        path: '/onboarding_page',
        builder: (context, state) {
          return const OnboardingPage();
        },
      ),
      GoRoute(
        path: '/home_page',
        builder: (context, state) {
          return const BottomNavPage(
            child: const LandingPage(),
          );
        },
      ),
      GoRoute(
        path: '/landing_page',
        builder: (context, state) {
          return const LandingPage();
        },
      ),
      GoRoute(
        path: '/product_detail_page',
        builder: (context, state) {
          final extraState = state.extra as Map<String, dynamic>;
          final selectedProduct = extraState['selectedProduct'] as MealModel;
          return ProductDetailPage(selectedProduct: selectedProduct);
        },
      ),
      GoRoute(
        path: '/all_product_page',
        builder: (context, state) {
          return const AllProductPage();
        },
      ),
      GoRoute(
        path: '/search_page',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: SearchPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.fastEaseInToSlowEaseOut;

              var tween = Tween(begin: begin, end: end);
              var curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );
              var offsetAnimation = tween.animate(curvedAnimation);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: '/cart_page_accepted',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: CartPageAccepted(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.fastEaseInToSlowEaseOut;

              var tween = Tween(begin: begin, end: end);
              var curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );
              var offsetAnimation = tween.animate(curvedAnimation);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: '/explore_meal_search_page',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: ExploreMealSearchPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.fastEaseInToSlowEaseOut;

              var tween = Tween(begin: begin, end: end);
              var curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );
              var offsetAnimation = tween.animate(curvedAnimation);

              return SlideTransition(position: offsetAnimation, child: child);
            },
          );
        },
      ),
      GoRoute(
        path: '/explore_category_detail_page',
        builder: (context, state) {
          final selectedFilters = state.extra as List<String>?;
          return ExploreCategoryDetailPage(
              selectedFilters: selectedFilters ?? []);
        },
      ),
    ],
  );
}
