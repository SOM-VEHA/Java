import 'package:e_learning/controller/FavoriteController.dart';
import 'package:e_learning/model/Favorite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteControllerProvider =
    AsyncNotifierProvider<FavoriteController, List<Favorite>>(
      FavoriteController.new,
    );
