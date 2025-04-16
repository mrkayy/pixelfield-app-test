import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/launch_bloc/state.dart';

class LaunchBloc extends Bloc<LaunchEvent, LaunchState> {
  LaunchBloc() : super(NewUserOnboarding()) {
    on<AppLaunched>((event, emit) => emit(NewUserOnboarding()));
    on<SignoutFromApp>((event, emit) => emit(UserSignedOut()));
    on<NavigateToCollectionPage>((event, emit) => emit(NewUserOnboarding()));
  }
}
