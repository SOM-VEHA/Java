import 'package:e_learning/controller/FavoriteController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/Favorite.dart';

final favoriteControllerProvider =
    AsyncNotifierProvider<FavoriteController, List<Favorite>>(
      FavoriteController.new,
    );
