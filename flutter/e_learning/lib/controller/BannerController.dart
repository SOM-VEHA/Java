import 'dart:async';

import 'package:e_learning/model/Banner.dart';
import 'package:e_learning/repository/BannerRepository.dart';
import 'package:e_learning/repository/impl/BannerRepositoryImpl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BannerController extends AsyncNotifier<List<Banner>> {
  BannerRepository get repository => ref.read(bannerRepositoryProvider);
  @override
  Future<List<Banner>> build()async {
    return repository.findAll();
  }

  Future<void> reload() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => repository.findAll());
  }
}
