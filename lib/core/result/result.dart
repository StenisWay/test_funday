/// 業務邏輯層的操作結果封裝
///
/// [T] 是成功時承載的 domain 資料型別。
/// Repository 將 [NetworkResponse] 轉換為 [Result]；
/// ViewModel（Notifier）再對 [Result] 做 switch 判斷以更新 UI 狀態。
sealed class Result<T> {
  const Result();
}

/// 操作成功，攜帶 domain 資料
final class ResultSuccess<T> extends Result<T> {
  const ResultSuccess(this.data);
  final T data;
}

/// 操作失敗，攜帶錯誤訊息
final class ResultFailure<T> extends Result<T> {
  const ResultFailure(this.message);
  final String message;
}

/// 操作進行中
///
/// [progress] 為 0.0～1.0 的進度值；
/// `null` 代表不確定進度（indeterminate）。
final class ResultLoading<T> extends Result<T> {
  const ResultLoading({this.progress});
  final double? progress;
}
