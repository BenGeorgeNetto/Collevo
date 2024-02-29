part of 'app_update_bloc.dart';

abstract class AppUpdateState extends Equatable {
  const AppUpdateState();

  @override
  List<Object> get props => [];
}

class UpdateInitial extends AppUpdateState {}

class UpdateLoading extends AppUpdateState {}

class UpdateRequired extends AppUpdateState {
  final String currentVersion;
  final String latestVersion;

  const UpdateRequired(
      {required this.currentVersion, required this.latestVersion});

  @override
  List<Object> get props => [currentVersion, latestVersion];
}

class UpdateNotRequired extends AppUpdateState {}

class UpdateFailure extends AppUpdateState {
  final String error;

  const UpdateFailure({required this.error});

  @override
  List<Object> get props => [error];
}
