import 'package:e_learning/controller/BannerController.dart';
import 'package:e_learning/model/Banner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bannerProvider = AsyncNotifierProvider<BannerController, List<Banner>>(BannerController.new);
