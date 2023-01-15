import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  // ignore: unnecessary_overrides
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
  }

  @override
  // ignore: avoid_renaming_method_parameters
  void onError(BlocBase bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }

  @override
  // ignore: unnecessary_overrides
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
  }

  @override
  // ignore: unnecessary_overrides
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }
}
