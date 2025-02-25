// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pomodoro_notifier_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$PomodoroNotifierState {
  Pomodoro get initial => throw _privateConstructorUsedError;
  Pomodoro get current => throw _privateConstructorUsedError;
  TimerState get timerState => throw _privateConstructorUsedError;

  /// Create a copy of PomodoroNotifierState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PomodoroNotifierStateCopyWith<PomodoroNotifierState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PomodoroNotifierStateCopyWith<$Res> {
  factory $PomodoroNotifierStateCopyWith(
    PomodoroNotifierState value,
    $Res Function(PomodoroNotifierState) then,
  ) = _$PomodoroNotifierStateCopyWithImpl<$Res, PomodoroNotifierState>;
  @useResult
  $Res call({Pomodoro initial, Pomodoro current, TimerState timerState});

  $PomodoroCopyWith<$Res> get initial;
  $PomodoroCopyWith<$Res> get current;
}

/// @nodoc
class _$PomodoroNotifierStateCopyWithImpl<
  $Res,
  $Val extends PomodoroNotifierState
>
    implements $PomodoroNotifierStateCopyWith<$Res> {
  _$PomodoroNotifierStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PomodoroNotifierState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = null,
    Object? current = null,
    Object? timerState = null,
  }) {
    return _then(
      _value.copyWith(
            initial:
                null == initial
                    ? _value.initial
                    : initial // ignore: cast_nullable_to_non_nullable
                        as Pomodoro,
            current:
                null == current
                    ? _value.current
                    : current // ignore: cast_nullable_to_non_nullable
                        as Pomodoro,
            timerState:
                null == timerState
                    ? _value.timerState
                    : timerState // ignore: cast_nullable_to_non_nullable
                        as TimerState,
          )
          as $Val,
    );
  }

  /// Create a copy of PomodoroNotifierState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PomodoroCopyWith<$Res> get initial {
    return $PomodoroCopyWith<$Res>(_value.initial, (value) {
      return _then(_value.copyWith(initial: value) as $Val);
    });
  }

  /// Create a copy of PomodoroNotifierState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PomodoroCopyWith<$Res> get current {
    return $PomodoroCopyWith<$Res>(_value.current, (value) {
      return _then(_value.copyWith(current: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PomodoroNotifierStateImplCopyWith<$Res>
    implements $PomodoroNotifierStateCopyWith<$Res> {
  factory _$$PomodoroNotifierStateImplCopyWith(
    _$PomodoroNotifierStateImpl value,
    $Res Function(_$PomodoroNotifierStateImpl) then,
  ) = __$$PomodoroNotifierStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Pomodoro initial, Pomodoro current, TimerState timerState});

  @override
  $PomodoroCopyWith<$Res> get initial;
  @override
  $PomodoroCopyWith<$Res> get current;
}

/// @nodoc
class __$$PomodoroNotifierStateImplCopyWithImpl<$Res>
    extends
        _$PomodoroNotifierStateCopyWithImpl<$Res, _$PomodoroNotifierStateImpl>
    implements _$$PomodoroNotifierStateImplCopyWith<$Res> {
  __$$PomodoroNotifierStateImplCopyWithImpl(
    _$PomodoroNotifierStateImpl _value,
    $Res Function(_$PomodoroNotifierStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PomodoroNotifierState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initial = null,
    Object? current = null,
    Object? timerState = null,
  }) {
    return _then(
      _$PomodoroNotifierStateImpl(
        initial:
            null == initial
                ? _value.initial
                : initial // ignore: cast_nullable_to_non_nullable
                    as Pomodoro,
        current:
            null == current
                ? _value.current
                : current // ignore: cast_nullable_to_non_nullable
                    as Pomodoro,
        timerState:
            null == timerState
                ? _value.timerState
                : timerState // ignore: cast_nullable_to_non_nullable
                    as TimerState,
      ),
    );
  }
}

/// @nodoc

class _$PomodoroNotifierStateImpl extends _PomodoroNotifierState {
  _$PomodoroNotifierStateImpl({
    required this.initial,
    required this.current,
    this.timerState = TimerState.stopped,
  }) : super._();

  @override
  final Pomodoro initial;
  @override
  final Pomodoro current;
  @override
  @JsonKey()
  final TimerState timerState;

  @override
  String toString() {
    return 'PomodoroNotifierState(initial: $initial, current: $current, timerState: $timerState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PomodoroNotifierStateImpl &&
            (identical(other.initial, initial) || other.initial == initial) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.timerState, timerState) ||
                other.timerState == timerState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initial, current, timerState);

  /// Create a copy of PomodoroNotifierState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PomodoroNotifierStateImplCopyWith<_$PomodoroNotifierStateImpl>
  get copyWith =>
      __$$PomodoroNotifierStateImplCopyWithImpl<_$PomodoroNotifierStateImpl>(
        this,
        _$identity,
      );
}

abstract class _PomodoroNotifierState extends PomodoroNotifierState {
  factory _PomodoroNotifierState({
    required final Pomodoro initial,
    required final Pomodoro current,
    final TimerState timerState,
  }) = _$PomodoroNotifierStateImpl;
  _PomodoroNotifierState._() : super._();

  @override
  Pomodoro get initial;
  @override
  Pomodoro get current;
  @override
  TimerState get timerState;

  /// Create a copy of PomodoroNotifierState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PomodoroNotifierStateImplCopyWith<_$PomodoroNotifierStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
