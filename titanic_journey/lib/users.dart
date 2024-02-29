import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:titanic_journey/team_enum.dart';

@immutable

/// Users class
final class Users extends Equatable {
  /// Constructor
  const Users({
    required this.name,
    required this.surname,
    required this.team,
    required this.age,
    required this.homeTown,
    required this.email,
  });

  /// Named parameters
  final String name;

  final String surname;
  final TeamEnum team;
  final String age;
  final String homeTown;
  final String email;

  /// CopyWith method
  Users copyWith({
    String? name,
    String? surname,
    TeamEnum? team,
    String? age,
    String? homeTown,
    String? email,
  }) {
    return Users(
      name: name ?? this.name,
      surname: surname ?? this.surname,
      team: team ?? this.team,
      age: age ?? this.age,
      homeTown: homeTown ?? this.homeTown,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [name, surname, team, age, homeTown, email];
}

@immutable

/// UsersModelList class
final class UsersModelList {
  const UsersModelList._();

  /// Users list
  static const List<Users> users = [
    Users(
      name: 'John',
      surname: 'Doe',
      team: TeamEnum.flutter,
      age: '25',
      homeTown: 'New York',
      email: 'random12@gmail.com',

      /// Random email
    ),
    Users(
      name: 'Jane',
      surname: 'Doe',
      team: TeamEnum.ios,
      age: '27',
      homeTown: 'Los Angeles',
      email: 'random13@gmail.com',
    ),
    Users(
      name: 'John',
      surname: 'Smith',
      team: TeamEnum.android,
      age: '30',
      homeTown: 'San Francisco',
      email: 'random14@gmail.com',
    ),
    Users(
      name: 'Jane',
      surname: 'Smith',
      team: TeamEnum.design,
      age: '28',
      homeTown: 'Chicago',
      email: 'random15@gmail.com',
    ),
  ];
}
