import 'package:api_case/product/model/users.dart';
import 'package:equatable/equatable.dart';

final class SaveUserState extends Equatable {
  const SaveUserState({
    required this.users,
    required this.isLoading,
    this.error,
  });
  final List<Users> users;
  final bool isLoading;
  final String? error;

  SaveUserState copyWith({
    List<Users>? users,
    bool? isLoading,
    String? error,
  }) {
    return SaveUserState(
      users: users ?? this.users,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [users, isLoading, error];
}
