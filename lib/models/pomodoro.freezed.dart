// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Pomodoro _$PomodoroFromJson(Map<String, dynamic> json) {
  return _Pomodoro.fromJson(json);
}

/// @nodoc
mixin _$Pomodoro {
  PomodoroState get pomodoroState => throw _privateConstructorUsedError;

  ///focus time in seconds
  @JsonKey(fromJson: _fromJsonTime)
  int get focus => throw _privateConstructorUsedError;

  ///shortBreak time in seconds
  @JsonKey(fromJson: _fromJsonTime)
  int get shortBreak => throw _privateConstructorUsedError;

  ///longBreak time in seconds
  @JsonKey(fromJson: _fromJsonTime)
  int get longBreak => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonRounds)
  int get rounds => throw _privateConstructorUsedError;

  /// Serializes this Pomodoro to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pomodoro
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PomodoroCopyWith<Pomodoro> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PomodoroCopyWith<$Res> {
  factory $PomodoroCopyWith(Pomodoro value, $Res Function(Pomodoro) then) =
      _$PomodoroCopyWithImpl<$Res, Pomodoro>;
  @useResult
  $Res call({
    PomodoroState pomodoroState,
    @JsonKey(fromJson: _fromJsonTime) int focus,
    @JsonKey(fromJson: _fromJsonTime) int shortBreak,
    @JsonKey(fromJson: _fromJsonTime) int longBreak,
    @JsonKey(fromJson: _fromJsonRounds) int rounds,
  });
}

/// @nodoc
class _$PomodoroCopyWithImpl<$Res, $Val extends Pomodoro>
    implements $PomodoroCopyWith<$Res> {
  _$PomodoroCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pomodoro
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pomodoroState = null,
    Object? focus = null,
    Object? shortBreak = null,
    Object? longBreak = null,
    Object? rounds = null,
  }) {
    return _then(
      _value.copyWith(
            pomodoroState:
                null == pomodoroState
                    ? _value.pomodoroState
                    : pomodoroState // ignore: cast_nullable_to_non_nullable
                        as PomodoroState,
            focus:
                null == focus
                    ? _value.focus
                    : focus // ignore: cast_nullable_to_non_nullable
                        as int,
            shortBreak:
                null == shortBreak
                    ? _value.shortBreak
                    : shortBreak // ignore: cast_nullable_to_non_nullable
                        as int,
            longBreak:
                null == longBreak
                    ? _value.longBreak
                    : longBreak // ignore: cast_nullable_to_non_nullable
                        as int,
            rounds:
                null == rounds
                    ? _value.rounds
                    : rounds // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PomodoroImplCopyWith<$Res>
    implements $PomodoroCopyWith<$Res> {
  factory _$$PomodoroImplCopyWith(
    _$PomodoroImpl value,
    $Res Function(_$PomodoroImpl) then,
  ) = __$$PomodoroImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    PomodoroState pomodoroState,
    @JsonKey(fromJson: _fromJsonTime) int focus,
    @JsonKey(fromJson: _fromJsonTime) int shortBreak,
    @JsonKey(fromJson: _fromJsonTime) int longBreak,
    @JsonKey(fromJson: _fromJsonRounds) int rounds,
  });
}

/// @nodoc
class __$$PomodoroImplCopyWithImpl<$Res>
    extends _$PomodoroCopyWithImpl<$Res, _$PomodoroImpl>
    implements _$$PomodoroImplCopyWith<$Res> {
  __$$PomodoroImplCopyWithImpl(
    _$PomodoroImpl _value,
    $Res Function(_$PomodoroImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Pomodoro
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pomodoroState = null,
    Object? focus = null,
    Object? shortBreak = null,
    Object? longBreak = null,
    Object? rounds = null,
  }) {
    return _then(
      _$PomodoroImpl(
        pomodoroState:
            null == pomodoroState
                ? _value.pomodoroState
                : pomodoroState // ignore: cast_nullable_to_non_nullable
                    as PomodoroState,
        focus:
            null == focus
                ? _value.focus
                : focus // ignore: cast_nullable_to_non_nullable
                    as int,
        shortBreak:
            null == shortBreak
                ? _value.shortBreak
                : shortBreak // ignore: cast_nullable_to_non_nullable
                    as int,
        longBreak:
            null == longBreak
                ? _value.longBreak
                : longBreak // ignore: cast_nullable_to_non_nullable
                    as int,
        rounds:
            null == rounds
                ? _value.rounds
                : rounds // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PomodoroImpl extends _Pomodoro {
  _$PomodoroImpl({
    this.pomodoroState = PomodoroState.focus,
    @JsonKey(fromJson: _fromJsonTime) this.focus = 25 * 60,
    @JsonKey(fromJson: _fromJsonTime) this.shortBreak = 5 * 60,
    @JsonKey(fromJson: _fromJsonTime) this.longBreak = 15 * 60,
    @JsonKey(fromJson: _fromJsonRounds) this.rounds = 4,
  }) : super._();

  factory _$PomodoroImpl.fromJson(Map<String, dynamic> json) =>
      _$$PomodoroImplFromJson(json);

  @override
  @JsonKey()
  final PomodoroState pomodoroState;

  ///focus time in seconds
  @override
  @JsonKey(fromJson: _fromJsonTime)
  final int focus;

  ///shortBreak time in seconds
  @override
  @JsonKey(fromJson: _fromJsonTime)
  final int shortBreak;

  ///longBreak time in seconds
  @override
  @JsonKey(fromJson: _fromJsonTime)
  final int longBreak;
  @override
  @JsonKey(fromJson: _fromJsonRounds)
  final int rounds;

  @override
  String toString() {
    return 'Pomodoro(pomodoroState: $pomodoroState, focus: $focus, shortBreak: $shortBreak, longBreak: $longBreak, rounds: $rounds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PomodoroImpl &&
            (identical(other.pomodoroState, pomodoroState) ||
                other.pomodoroState == pomodoroState) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.shortBreak, shortBreak) ||
                other.shortBreak == shortBreak) &&
            (identical(other.longBreak, longBreak) ||
                other.longBreak == longBreak) &&
            (identical(other.rounds, rounds) || other.rounds == rounds));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    pomodoroState,
    focus,
    shortBreak,
    longBreak,
    rounds,
  );

  /// Create a copy of Pomodoro
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PomodoroImplCopyWith<_$PomodoroImpl> get copyWith =>
      __$$PomodoroImplCopyWithImpl<_$PomodoroImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PomodoroImplToJson(this);
  }
}

abstract class _Pomodoro extends Pomodoro {
  factory _Pomodoro({
    final PomodoroState pomodoroState,
    @JsonKey(fromJson: _fromJsonTime) final int focus,
    @JsonKey(fromJson: _fromJsonTime) final int shortBreak,
    @JsonKey(fromJson: _fromJsonTime) final int longBreak,
    @JsonKey(fromJson: _fromJsonRounds) final int rounds,
  }) = _$PomodoroImpl;
  _Pomodoro._() : super._();

  factory _Pomodoro.fromJson(Map<String, dynamic> json) =
      _$PomodoroImpl.fromJson;

  @override
  PomodoroState get pomodoroState;

  ///focus time in seconds
  @override
  @JsonKey(fromJson: _fromJsonTime)
  int get focus;

  ///shortBreak time in seconds
  @override
  @JsonKey(fromJson: _fromJsonTime)
  int get shortBreak;

  ///longBreak time in seconds
  @override
  @JsonKey(fromJson: _fromJsonTime)
  int get longBreak;
  @override
  @JsonKey(fromJson: _fromJsonRounds)
  int get rounds;

  /// Create a copy of Pomodoro
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PomodoroImplCopyWith<_$PomodoroImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
