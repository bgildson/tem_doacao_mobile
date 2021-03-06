import 'package:built_collection/built_collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../core/parses.dart';
import 'category.dart';
import 'donation_image.dart';
import 'donation_status.dart';
import 'models.dart';
import 'user.dart';

@immutable
class Donation with EquatableMixin {
  final String id;
  final String description;
  final String longDescription;
  final Category category;
  final User donor;
  final DonationStatus status;
  final BuiltList<DonationImage> images;
  final DateTime startedAt;
  final DateTime finalizedAt;
  final DateTime canceledAt;
  final DateTime updatedAt;

  Donation({
    @required this.id,
    @required this.description,
    @required this.longDescription,
    @required this.category,
    @required this.donor,
    @required this.status,
    @required this.images,
    @required this.startedAt,
    @required this.finalizedAt,
    @required this.canceledAt,
    @required this.updatedAt,
  });

  factory Donation.fromJson(Map data) =>
    Donation(
      id: data['id'] as String,
      description: data['description'] as String,
      longDescription: data['long_description'] as String,
      category: Category.fromJson(data['category']),
      donor: User.fromJson(data['donor']),
      status: parseDonationStatusStringToDonationStatus(data['status']),
      images: (data['images'] as List)
        .map((image) => DonationImage.fromJson(image))
        .toBuiltList(),
      startedAt: data['started_at'] == null
        ? null
        : DateTime.parse(data['started_at'] as String),
      finalizedAt: data['finalized_at'] == null
        ? null
        : DateTime.parse(data['finalized_at'] as String),
      canceledAt: data['canceled_at'] == null
        ? null
        : DateTime.parse(data['canceled_at'] as String),
      updatedAt: data['updated_at'] == null
        ? null
        : DateTime.parse(data['updated_at'] as String),
    );

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'description': description,
      'long_description': longDescription,
      'category': category == null
        ? null
        : category.toJson(),
      'donor': donor == null
        ? null
        : donor.toJson(),
      'status': parseDonationStatusToDonationStatusString(status),
      'images': images
        .map((image) => image.toJson())
        .toList(),
      'started_at': startedAt == null
        ? null
        : startedAt.toIso8601String(),
      'finalized_at': finalizedAt == null
        ? null
        : finalizedAt.toIso8601String(),
      'canceled_at': canceledAt == null
        ? null
        : canceledAt.toIso8601String(),
      'updated_at': updatedAt == null
        ? null
        : updatedAt.toIso8601String(),
    };

  Donation copyWith({
    String id,
    String description,
    String longDescription,
    Category category,
    User donor,
    DonationStatus status,
    BuiltList<DonationImage> images,
    DateTime startedAt,
    DateTime finalizedAt,
    DateTime canceledAt,
    DateTime updatedAt,
  }) =>
    Donation(
      id: id ?? this.id,
      description: description ?? this.description,
      longDescription: longDescription ?? this.longDescription,
      category: category ?? this.category,
      donor: donor ?? this.donor,
      status: status ?? this.status,
      images: images ?? this.images,
      startedAt: startedAt ?? this.startedAt,
      finalizedAt: finalizedAt ?? this.finalizedAt,
      canceledAt: canceledAt ?? this.canceledAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );

  @override
  List<Object> get props => [
    id,
    description,
    longDescription,
    category,
    donor,
    status,
    images,
    startedAt,
    finalizedAt,
    canceledAt,
    updatedAt,
  ];

  @override
  String toString() =>
    '$runtimeType { '
    '"id": "$id", '
    '"description": "$description", '
    '"longDescription": "$longDescription", '
    '"category": $category, '
    '"donor": $donor, '
    '"status": $status, '
    '"images": $images, '
    '"startedAt": "$startedAt", '
    '"finalizedAt": "$finalizedAt", '
    '"canceledAt": "$canceledAt", '
    '"updatedAt": "$updatedAt", '
    '}';
}
