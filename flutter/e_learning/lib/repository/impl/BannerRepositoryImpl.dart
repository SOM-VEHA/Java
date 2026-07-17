import 'package:e_learning/model/Banner.dart';
import 'package:e_learning/repository/BannerRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/supabase_client.dart';
class BannerRepositoryImpl implements BannerRepository {
  final SupabaseService service;
  BannerRepositoryImpl(this.service);
  @override
  Future<List<Banner>> findAll() async{
    final data = await service.select("banner");
    return data.map((e) => Banner.fromJson(e)).toList();
  }
}
final bannerRepositoryProvider = Provider<BannerRepository>((ref) {
  final service = ref.read(supabaseServiceProvider);
  return BannerRepositoryImpl(service);
});