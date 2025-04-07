import 'package:app/src/domain/entities/v_user_detail.dart';
import 'package:app/src/domain/repositories/v_user_detail_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: VUserDetailRepository)
class VUserDetailRepositoryImpl implements VUserDetailRepository {
  const VUserDetailRepositoryImpl(this._client);

  final SupabaseClient _client;
  static const viewName = 'v_user_details';

  @override
  Future<VUserDetail> findByUserId(String userId) async {
    final res = await _client.from(viewName).select().eq('user_id', userId).single();
    return VUserDetail.fromJson(res);
  }

  @override
  Future<VUserDetail> findByScreenName(String screenName) async {
    final res = await _client.from(viewName).select().eq('screen_name', screenName).single();
    return VUserDetail.fromJson(res);
  }
}
