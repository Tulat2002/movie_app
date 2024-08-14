import 'package:injectable/injectable.dart';
import 'package:movie_app/domain/entities/token_data.dart';
import 'package:movie_app/domain/repositories/token_repository.dart';

import '../local/token_storage.dart';

@Singleton(as: TokenRepository)
class TokenRepositoryImpl implements TokenRepository {
  const TokenRepositoryImpl(this._storage);

  final TokenStorage _storage;

  // @override
  // TokenData getToken() {
  //   const accessToken =
  //       'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1ZmM3N2E3MGFiYTMyOWQ4MWJmOGU3Zjg3NmM2YjliMSIsIm5iZiI6MTcyMzYxOTg3Mi4yNzk5MjcsInN1YiI6IjY2YmM1OTQzMzYyMjMyYjZjMjgyNWI0MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.4Jr9-AmAoIrO9rl97b8h09WnDeIGbA1ifWQ6YPRIgI0';
  //   const refreshToken = '';
  //   return const TokenData(
  //       accessToken: accessToken, refreshToken: refreshToken);
  // }

@override
Future<TokenData?> getToken() async {
  return await _storage.getToken();
}

@override
Future<String> getBearerToken() async {
  final token = await _storage.getToken();
  return 'Bearer ${token!.accessToken}';
}
}
