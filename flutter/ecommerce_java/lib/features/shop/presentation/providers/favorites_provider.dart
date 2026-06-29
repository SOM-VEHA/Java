import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/models/product.dart';
import '../../../../core/providers/storage_provider.dart';

class FavoritesNotifier extends Notifier<List<Product>> {
  static const _favoritesKey = 'shop_favorites';

  @override
  List<Product> build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final favoritesJson = prefs.getString(_favoritesKey);
    
    if (favoritesJson != null) {
      try {
        final List<dynamic> decoded = jsonDecode(favoritesJson);
        return decoded.map((item) => Product.fromJson(item)).toList();
      } catch (_) {
        return [];
      }
    }
    return [];
  }

  Future<void> _saveToPrefs() async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setString(_favoritesKey, jsonEncode(state.map((e) => e.toJson()).toList()));
  }

  void toggleFavorite(Product product) {
    if (state.any((item) => item.id == product.id)) {
      state = state.where((item) => item.id != product.id).toList();
    } else {
      state = [...state, product];
    }
    _saveToPrefs();
  }

  bool isFavorite(String productId) {
    return state.any((item) => item.id == productId);
  }
}

final favoritesProvider = NotifierProvider<FavoritesNotifier, List<Product>>(FavoritesNotifier.new);
