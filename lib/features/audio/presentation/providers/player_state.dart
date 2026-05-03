import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_state.freezed.dart';

enum PlayerStatus { idle, playing, paused, completed, error }

@freezed
abstract class PlayerState with _$PlayerState {
  const PlayerState._(); // 允許自訂 getter

  const factory PlayerState({
    @Default(PlayerStatus.idle) PlayerStatus status,
    @Default('') String filePath,
    @Default('') String fileName,
    String? errorMessage,
  }) = _PlayerState;

  bool get isPlaying => status == PlayerStatus.playing;
  bool get isPaused => status == PlayerStatus.paused;
  bool get isIdle =>
      status == PlayerStatus.idle || status == PlayerStatus.completed;
}
