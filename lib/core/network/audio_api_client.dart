import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/audio/data/dtos/audio_response_dto.dart';

part 'audio_api_client.g.dart';

/// Taipei 旅遊開放資料平台 Retrofit Client
///
/// Swagger：https://www.travel.taipei/open-api/swagger/ui/index
// base URL 結尾必須加 /，否則 Uri.resolve 遇到相對路徑時
// 會把 /open-api 整段替換掉（RFC 3986 absolute-path reference）
@RestApi(baseUrl: 'https://www.travel.taipei/open-api/')
abstract class AudioApiClient {
  factory AudioApiClient(Dio dio, {String? baseUrl}) = _AudioApiClient;

  /// 語音導覽列表
  ///
  /// [lang]  語系代碼，例如 `zh-tw`
  /// [page]  頁碼（從 1 開始）
  // 路徑不加開頭 /，讓 Uri.resolve 做相對路徑拼接
  @GET('{lang}/Media/Audio')
  Future<AudioResponseDto> getAudios(
    @Path('lang') String lang, {
    @Query('page') required int page,
  });
}
