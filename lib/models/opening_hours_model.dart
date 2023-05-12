// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OpeningHours extends Equatable {
  final String id;
  final String day;
  final double openAt;
  final double closeAt;
  final bool isOpen;
  const OpeningHours({
    required this.id,
    required this.day,
    required this.openAt,
    required this.closeAt,
    required this.isOpen,
  });

  @override
  List<Object> get props {
    return [
      id,
      day,
      openAt,
      closeAt,
      isOpen,
    ];
  }

  OpeningHours copyWith({
    String? id,
    String? day,
    double? openAt,
    double? closeAt,
    bool? isOpen,
  }) {
    return OpeningHours(
      id: id ?? this.id,
      day: day ?? this.day,
      openAt: openAt ?? this.openAt,
      closeAt: closeAt ?? this.closeAt,
      isOpen: isOpen ?? this.isOpen,
    );
  }


  static List<OpeningHours> openingHoursList = const [
    OpeningHours(
      id: '1',
      day: 'Monday',
      openAt: 0,
      closeAt: 24,
      isOpen: false,
    ),
    OpeningHours(
      id: '2',
      day: 'Tuesday',
      openAt: 0,
      closeAt: 24,
      isOpen: true,
    ),
    OpeningHours(
      id: '3',
      day: 'Wednesday',
      openAt: 0,
      closeAt: 24,
      isOpen: true,
    ),
    OpeningHours(
      id: '4',
      day: 'Thursday',
      openAt: 0,
      closeAt: 24,
      isOpen: true,
    ),
    OpeningHours(
      id: '5',
      day: 'Friday',
      openAt: 0,
      closeAt: 24,
      isOpen: true,
    ),
    OpeningHours(
      id: '6',
      day: 'Saturday',
      openAt: 0,
      closeAt: 24,
      isOpen: true,
    ),
    OpeningHours(
      id: '7',
      day: 'Sunday',
      openAt: 0,
      closeAt: 24,
      isOpen: true,
    ),
  ];

  Map<String, dynamic> toDocument() {
    return <String, dynamic>{
      'id': id,
      'day': day,
      'openAt': openAt,
      'closeAt': closeAt,
      'isOpen': isOpen,
    };
  }

  factory OpeningHours.fromSnapshot(Map<String, dynamic> snap) {
    return OpeningHours(
      id: snap['id'] as String,
      day: snap['day'] as String,
      openAt: snap['openAt'] as double,
      closeAt: snap['closeAt'] as double,
      isOpen: snap['isOpen'] as bool,
    );
  }

 
}
