part of 'ratings_cubit.dart';

abstract class RatingsState {}

class RatingsStateInit extends RatingsState {}

class RatingsStateLoading extends RatingsState {}

class RatingsStateSuccess extends RatingsState {}

class RatingsStateFail extends RatingsState {}

class RatingsStateComplete extends RatingsState {
  final bool statisfied;
  RatingsStateComplete(this.statisfied);
}

class RatingsStateSurvey extends RatingsState {}

class RatingsStateSelectFault extends RatingsState {}

class RatingsStateChange extends RatingsState {
  final int rate;
  final String message;
  RatingsStateChange({required this.rate, required this.message});
}
