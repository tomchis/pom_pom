// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pomodoro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PomodoroImpl _$$PomodoroImplFromJson(Map<String, dynamic> json) =>
    _$PomodoroImpl(
      pomodoroState:
          $enumDecodeNullable(_$PomodoroStateEnumMap, json['pomodoroState']) ??
          PomodoroState.focus,
      focus:
          json['focus'] == null
              ? 25 * 60
              : _fromJsonTime((json['focus'] as num).toInt()),
      shortBreak:
          json['shortBreak'] == null
              ? 5 * 60
              : _fromJsonTime((json['shortBreak'] as num).toInt()),
      longBreak:
          json['longBreak'] == null
              ? 15 * 60
              : _fromJsonTime((json['longBreak'] as num).toInt()),
      rounds:
          json['rounds'] == null
              ? 4
              : _fromJsonRounds((json['rounds'] as num).toInt()),
    );

Map<String, dynamic> _$$PomodoroImplToJson(_$PomodoroImpl instance) =>
    <String, dynamic>{
      'pomodoroState': _$PomodoroStateEnumMap[instance.pomodoroState]!,
      'focus': instance.focus,
      'shortBreak': instance.shortBreak,
      'longBreak': instance.longBreak,
      'rounds': instance.rounds,
    };

const _$PomodoroStateEnumMap = {
  PomodoroState.focus: 'focus',
  PomodoroState.shortBreak: 'shortBreak',
  PomodoroState.longBreak: 'longBreak',
};
