part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

abstract class UserLoadingState extends ProfileState {
  const UserLoadingState();

  @override
  List<Object> get props => [];
}
