import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_solutions_task/domain/entities/login/user.dart';
import 'package:ultimate_solutions_task/domain/usecases/get_user_use_case.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetUserUseCase _getUserUseCase;

  SplashBloc(
    this._getUserUseCase,
  ) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) {
      if(event is GetUserInfoEvent) {
        _onGetUserInfoEvent(event, emit);
      }
    });
  }

  void _onGetUserInfoEvent(GetUserInfoEvent event, Emitter<SplashState> emit) {
    final User user = _getUserUseCase();
    emit(GetUserInfoState(user: user));
  }
}
