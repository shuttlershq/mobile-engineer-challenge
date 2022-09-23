import 'package:flutter_bloc/flutter_bloc.dart';

part 'ratings_state.dart';

class RatingsCubit extends Cubit<RatingsState> {
  RatingsCubit() : super(RatingsStateInit());

  List<String> selected = [];

  void rateChange(int rate) {
    emit(RatingsStateChange(rate: rate, message: _getRatingsMessage(rate)));
  }

  void done(int rate) async {
    if (rate == 0) {
      return;
    }
    emit(RatingsStateLoading());

    if (rate > 2) {
      await Future.delayed(const Duration(microseconds: 500000));
      emit(RatingsStateComplete(true));
    } else {
      emit(RatingsStateSurvey());
    }
  }

  void doneWithReasons() {
    emit(RatingsStateComplete(false));
  }

  void selectFault(String fault) {
    var a = selected
        .where((element) => element.toLowerCase() == fault.toLowerCase());

    if (a.isEmpty) {
      if (selected.length == 5) {
        selected.removeAt(0);
      }

      selected.add(fault);
    } else {
      selected.removeWhere(
          (element) => element.toLowerCase() == fault.toLowerCase());
    }

    emit(RatingsStateSelectFault());
  }

  String _getRatingsMessage(int rate) {
    switch (rate) {
      case 1:
        return "Very poor";
      case 2:
        return "Poor";
      case 3:
        return "Average";
      case 4:
        return "Good";
      case 5:
        return "Excellent";
      default:
        return "";
    }
  }
}
