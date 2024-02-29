import 'package:bloc/bloc.dart';
import 'package:collevo/services/updation/version_check_service.dart';
import 'package:equatable/equatable.dart';

part 'app_update_event.dart';
part 'app_update_state.dart';

class AppUpdateBloc extends Bloc<AppUpdateEvent, AppUpdateState> {
  final VersionCheckService versionCheckService;

  AppUpdateBloc({required this.versionCheckService}) : super(UpdateInitial()) {
    on<CheckForUpdate>((event, emit) async {
      emit(UpdateLoading());
      try {
        final result = await versionCheckService.isUpdateRequired();
        if (result.updateRequired) {
          emit(UpdateRequired(
              currentVersion: result.currentVersion,
              latestVersion: result.latestVersion));
        } else {
          emit(UpdateNotRequired());
        }
      } catch (e) {
        emit(UpdateFailure(error: e.toString()));
      }
    });
  }
}
