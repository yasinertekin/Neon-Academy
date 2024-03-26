import 'package:api_case/product/model/users.dart';
import 'package:equatable/equatable.dart';

final class UsersState extends Equatable {
  const UsersState({
    this.users = const [],
    this.isLoading = false,
    this.error = '',
  });
  final List<Users> users;
  final bool isLoading;
  final String error;

  @override
  List<Object?> get props => [users, isLoading, error];

  // CopyWith method
  UsersState copyWith({
    List<Users>? users,
    bool? isLoading,
    String? error,
  }) {
    return UsersState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
