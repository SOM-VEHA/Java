import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/favorites_provider.dart';
import '../providers/products_provider.dart';
import '../widgets/product_card.dart';
import 'category_products_page.dart';

class ProductGridPage extends ConsumerWidget {
  const ProductGridPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsync = ref.watch(productsProvider);
    final favorites = ref.watch(favoritesProvider);

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          // Banner Slider Section
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: PageView(
                children: [
                  _buildBanner('Special Offer', '50% OFF on Electronics', Colors.deepPurple, Icons.bolt),
                  _buildBanner('New Arrival', 'Check out latest Laptops', Colors.blue, Icons.laptop),
                  _buildBanner('Flash Sale', 'Starting from \$9.99', Colors.orange, Icons.timer),
                ],
              ),
            ),
          ),

          // Favorites Section (Conditional)
          if (favorites.isNotEmpty) ...[
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
                child: Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Your Favorites',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 410, // Increased to match the 0.42 aspect ratio (170 / 0.42)
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: 170,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: AliProductCard(product: favorites[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],

          // Categories Section
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildCategoryItem(context, 'Phones', Icons.phone_android),
                  _buildCategoryItem(context, 'Laptops', Icons.laptop),
                  _buildCategoryItem(context, 'Audio', Icons.headphones),
                  _buildCategoryItem(context, 'Watches', Icons.watch),
                  _buildCategoryItem(context, 'Gaming', Icons.videogame_asset),
                ],
              ),
            ),
          ),

          // Product Grid Title
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Text(
                'More to love',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Product Grid
          productsAsync.when(
            data: (products) => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.42, // Optimized for high-density cards
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return AliProductCard(product: products[index]);
                  },
                  childCount: products.length,
                ),
              ),
            ),
            loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            error: (err, stack) => SliverFillRemaining(child: Center(child: Text('Error: $err'))),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _buildBanner(String title, String subtitle, Color color, IconData icon) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [color, color.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
          Icon(icon, size: 60, color: Colors.white.withOpacity(0.5)),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CategoryProductsPage(category: label),
            ),
          );
        },
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(icon, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
