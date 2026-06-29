import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/navigation_provider.dart';
import '../../../shop/presentation/pages/product_grid_page.dart';
import '../../../shop/presentation/pages/cart_page.dart';
import '../../../auth/presentation/pages/profile_page.dart';
import '../../../shop/presentation/pages/favorites_page.dart';
import '../../../shop/presentation/providers/cart_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(navigationProvider);
    final cartCount = ref.watch(cartCountProvider);

    final List<Widget> pages = [
      const ProductGridPage(),
      const FavoritesPage(),
      const CartPage(),
      const ProfilePage(),
    ];

    final List<String> titles = [
      'Shop Products',
      'My Favorites',
      'Your Cart',
      'My Profile',
    ];

    return Scaffold(
      appBar: selectedIndex == 0 
        ? AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.orange.shade200),
              ),
              child: const Row(
                children: [
                  SizedBox(width: 12),
                  Icon(Icons.search, size: 20, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Search for products...',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.camera_alt_outlined, color: Colors.black54),
                onPressed: () {},
              ),
              const SizedBox(width: 8),
            ],
          )
        : AppBar(
            title: Text(titles[selectedIndex]),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          ref.read(navigationProvider.notifier).setIndex(index);
        },
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          const NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('$cartCount'),
              isLabelVisible: cartCount > 0,
              child: const Icon(Icons.shopping_cart_outlined),
            ),
            selectedIcon: Badge(
              label: Text('$cartCount'),
              isLabelVisible: cartCount > 0,
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          ),
          const NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
