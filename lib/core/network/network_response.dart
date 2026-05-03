/// 網路層原始回應的封裝（不含業務邏輯）
///
/// [T] 是成功時承載的 DTO 型別。
/// DataSource 負責回傳 [NetworkResponse]；
/// Repository 再將其轉換為 [Result]。
sealed class NetworkResponse<T> {
  const NetworkResponse();
}

/// API 呼叫成功（HTTP 2xx）
final class NetworkSuccess<T> extends NetworkResponse<T> {
  const NetworkSuccess(this.data);
  final T data;
}

/// API 呼叫失敗（網路錯誤、非 2xx、逾時等）
final class NetworkError<T> extends NetworkResponse<T> {
  const NetworkError({required this.message, this.statusCode});
  final String message;
  final int? statusCode;
}
