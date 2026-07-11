import 'package:e_learning/model/Banner.dart';

abstract class BannerRepository{
  Future<List<Banner>> findAll();
}