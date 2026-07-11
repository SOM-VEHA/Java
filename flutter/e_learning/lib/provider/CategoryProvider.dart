import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/CategoryController.dart';
import '../model/Category.dart';

final categoryProvider = AsyncNotifierProvider<CategoryController, List<Category>>(CategoryController.new);