import 'package:dio/dio.dart';
import '../network/network_response.dart';
import '../network/audio_api_client.dart';
import '../../features/audio/data/dtos/audio_response_dto.dart';

/// 語音導覽遠端資料來源
///
/// 職責：
/// - 透過 [AudioApiClient]（Retrofit）呼叫 API
/// - 將原始 HTTP 結果包裝為 [NetworkResponse] 回傳給 Repository
/// - **不**負責 DTO → domain model 轉換，也不含任何 URL 常數
class AudioRemoteDataSource {
  const AudioRemoteDataSource(this._apiClient);

  final AudioApiClient _apiClient;

  static const String _lang = 'zh-tw';

  /// 取得語音導覽列表（第 [page] 頁）
  ///
  /// 回傳 [NetworkResponse<AudioResponseDto>]；
  /// 成功為 [NetworkSuccess]，失敗為 [NetworkError]。
  Future<NetworkResponse<AudioResponseDto>> fetchAudios({int page = 1}) async {
    try {
      final dto = await _apiClient.getAudios(_lang, page: page);
      return NetworkSuccess(dto);
    } on DioException catch (e) {
      return NetworkError<AudioResponseDto>(
        message: e.message ?? '網路錯誤',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      return NetworkError<AudioResponseDto>(message: e.toString());
    }
  }
}
