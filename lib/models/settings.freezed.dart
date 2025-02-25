// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Settings {
  int? get lastFocus => throw _privateConstructorUsedError;
  int? get lastShortBreak => throw _privateConstructorUsedError;
  int? get lastLongBreak => throw _privateConstructorUsedError;
  int? get lastRounds => throw _privateConstructorUsedError;
  double? get volume => throw _privateConstructorUsedError;
  bool? get alwaysOnTop => throw _privateConstructorUsedError;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call({
    int? lastFocus,
    int? lastShortBreak,
    int? lastLongBreak,
    int? lastRounds,
    double? volume,
    bool? alwaysOnTop,
  });
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastFocus = freezed,
    Object? lastShortBreak = freezed,
    Object? lastLongBreak = freezed,
    Object? lastRounds = freezed,
    Object? volume = freezed,
    Object? alwaysOnTop = freezed,
  }) {
    return _then(
      _value.copyWith(
            lastFocus:
                freezed == lastFocus
                    ? _value.lastFocus
                    : lastFocus // ignore: cast_nullable_to_non_nullable
                        as int?,
            lastShortBreak:
                freezed == lastShortBreak
                    ? _value.lastShortBreak
                    : lastShortBreak // ignore: cast_nullable_to_non_nullable
                        as int?,
            lastLongBreak:
                freezed == lastLongBreak
                    ? _value.lastLongBreak
                    : lastLongBreak // ignore: cast_nullable_to_non_nullable
                        as int?,
            lastRounds:
                freezed == lastRounds
                    ? _value.lastRounds
                    : lastRounds // ignore: cast_nullable_to_non_nullable
                        as int?,
            volume:
                freezed == volume
                    ? _value.volume
                    : volume // ignore: cast_nullable_to_non_nullable
                        as double?,
            alwaysOnTop:
                freezed == alwaysOnTop
                    ? _value.alwaysOnTop
                    : alwaysOnTop // ignore: cast_nullable_to_non_nullable
                        as bool?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SettingsImplCopyWith<$Res>
    implements $SettingsCopyWith<$Res> {
  factory _$$SettingsImplCopyWith(
    _$SettingsImpl value,
    $Res Function(_$SettingsImpl) then,
  ) = __$$SettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int? lastFocus,
    int? lastShortBreak,
    int? lastLongBreak,
    int? lastRounds,
    double? volume,
    bool? alwaysOnTop,
  });
}

/// @nodoc
class __$$SettingsImplCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$SettingsImpl>
    implements _$$SettingsImplCopyWith<$Res> {
  __$$SettingsImplCopyWithImpl(
    _$SettingsImpl _value,
    $Res Function(_$SettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastFocus = freezed,
    Object? lastShortBreak = freezed,
    Object? lastLongBreak = freezed,
    Object? lastRounds = freezed,
    Object? volume = freezed,
    Object? alwaysOnTop = freezed,
  }) {
    return _then(
      _$SettingsImpl(
        lastFocus:
            freezed == lastFocus
                ? _value.lastFocus
                : lastFocus // ignore: cast_nullable_to_non_nullable
                    as int?,
        lastShortBreak:
            freezed == lastShortBreak
                ? _value.lastShortBreak
                : lastShortBreak // ignore: cast_nullable_to_non_nullable
                    as int?,
        lastLongBreak:
            freezed == lastLongBreak
                ? _value.lastLongBreak
                : lastLongBreak // ignore: cast_nullable_to_non_nullable
                    as int?,
        lastRounds:
            freezed == lastRounds
                ? _value.lastRounds
                : lastRounds // ignore: cast_nullable_to_non_nullable
                    as int?,
        volume:
            freezed == volume
                ? _value.volume
                : volume // ignore: cast_nullable_to_non_nullable
                    as double?,
        alwaysOnTop:
            freezed == alwaysOnTop
                ? _value.alwaysOnTop
                : alwaysOnTop // ignore: cast_nullable_to_non_nullable
                    as bool?,
      ),
    );
  }
}

/// @nodoc

class _$SettingsImpl implements _Settings {
  _$SettingsImpl({
    this.lastFocus,
    this.lastShortBreak,
    this.lastLongBreak,
    this.lastRounds,
    this.volume,
    this.alwaysOnTop,
  });

  @override
  final int? lastFocus;
  @override
  final int? lastShortBreak;
  @override
  final int? lastLongBreak;
  @override
  final int? lastRounds;
  @override
  final double? volume;
  @override
  final bool? alwaysOnTop;

  @override
  String toString() {
    return 'Settings(lastFocus: $lastFocus, lastShortBreak: $lastShortBreak, lastLongBreak: $lastLongBreak, lastRounds: $lastRounds, volume: $volume, alwaysOnTop: $alwaysOnTop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsImpl &&
            (identical(other.lastFocus, lastFocus) ||
                other.lastFocus == lastFocus) &&
            (identical(other.lastShortBreak, lastShortBreak) ||
                other.lastShortBreak == lastShortBreak) &&
            (identical(other.lastLongBreak, lastLongBreak) ||
                other.lastLongBreak == lastLongBreak) &&
            (identical(other.lastRounds, lastRounds) ||
                other.lastRounds == lastRounds) &&
            (identical(other.volume, volume) || other.volume == volume) &&
            (identical(other.alwaysOnTop, alwaysOnTop) ||
                other.alwaysOnTop == alwaysOnTop));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    lastFocus,
    lastShortBreak,
    lastLongBreak,
    lastRounds,
    volume,
    alwaysOnTop,
  );

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      __$$SettingsImplCopyWithImpl<_$SettingsImpl>(this, _$identity);
}

abstract class _Settings implements Settings {
  factory _Settings({
    final int? lastFocus,
    final int? lastShortBreak,
    final int? lastLongBreak,
    final int? lastRounds,
    final double? volume,
    final bool? alwaysOnTop,
  }) = _$SettingsImpl;

  @override
  int? get lastFocus;
  @override
  int? get lastShortBreak;
  @override
  int? get lastLongBreak;
  @override
  int? get lastRounds;
  @override
  double? get volume;
  @override
  bool? get alwaysOnTop;

  /// Create a copy of Settings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettingsImplCopyWith<_$SettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
