import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trip_rating/ratings/src/views/ratings_cubit/ratings_cubit.dart';

void main() {
  late RatingsCubit mockCubit;

  var mockFault = [
    "Unprofessional Driving",
    "Rude driver",
    "Overspeeding",
    "Untidy Driver",
    "Unprofessional Car",
    "Rude Car",
    "Overspeeding Car",
    "Untidy Car",
  ];

  setUp(() {
    mockCubit = RatingsCubit();
  });
  group("Test the star logic with expected message", () {
    blocTest<RatingsCubit, RatingsState>(
      'check if driver is rated successfully',
      build: () => mockCubit,
      act: (b) => b.rateDriver(5),
      expect: () => [isA<RatingsStateLoading>(), isA<RatingsStateComplete>()],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if 5 star is corresponding with message',
      build: () => mockCubit,
      act: (b) => b.rateChange(5),
      expect: () => [
        isA<RatingsStateChange>()
          ..having((state) => state.rate, 'verify that the rating is 5', 5)
          ..having((state) => state.message,
              'verify that the message is Excellent', 'Excellent')
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if 4 star is corresponding with message',
      build: () => mockCubit,
      act: (b) => b.rateChange(4),
      expect: () => [
        isA<RatingsStateChange>()
            .having((state) => state.rate, 'verify that the rating is 4', 4)
            .having((state) => state.message, 'verify that the message is Good',
                'Good')
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if 3 star is corresponding with message',
      build: () => mockCubit,
      act: (b) => b.rateChange(3),
      expect: () => [
        isA<RatingsStateChange>()
            .having((state) => state.rate, 'verify that the rating is 3', 3)
            .having((state) => state.message,
                'verify that the message is Average', 'Average')
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if 2 star is corresponding with message',
      build: () => mockCubit,
      act: (b) => b.rateChange(2),
      expect: () => [
        isA<RatingsStateChange>()
            .having((state) => state.rate, 'verify that the rating is 2', 2)
            .having((state) => state.message, 'verify that the message is Poor',
                'Poor')
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if 1 star is corresponding with message',
      build: () => mockCubit,
      act: (b) => b.rateChange(1),
      expect: () => [
        isA<RatingsStateChange>()
            .having((state) => state.rate, 'verify that the rating is 1', 1)
            .having((state) => state.message,
                'verify that the message is Very Poor', 'Very Poor')
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if 0 star will break the app',
      build: () => mockCubit,
      act: (b) => b.rateChange(0),
      expect: () => [
        isA<RatingsStateChange>()
            .having((state) => state.rate, 'verify that the rating is 0', 0)
            .having(
                (state) => state.message,
                'verify that the message is empty string and won\'t break the app',
                '')
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
  });
  group('Test customer is moved to survey ', () {
    blocTest<RatingsCubit, RatingsState>(
      'check if customer is prompted to survey if the ratings is less than 2',
      build: () => mockCubit,
      act: (b) => b.rateDriver(2),
      expect: () => [isA<RatingsStateLoading>(), isA<RatingsStateSurvey>()],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if customer is able to complete rating after survey',
      build: () => mockCubit,
      act: (b) => b.doneWithReasons(),
      expect: () => [
        isA<RatingsStateLoading>(),
        isA<RatingsStateComplete>().having((state) => state.statisfied,
            'check if the customer satisfied is false', false)
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if customer statisfied is false',
      build: () => mockCubit,
      act: (b) => b.doneWithReasons(),
      expect: () => [
        isA<RatingsStateLoading>(),
        isA<RatingsStateComplete>().having((state) => state.statisfied,
            'check if the customer satisfied is false', false)
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
  });
  group('Test customer is able to complete rating ', () {
    blocTest<RatingsCubit, RatingsState>(
      'check if customer is able to complete if the rating is 5',
      build: () => mockCubit,
      act: (b) => b.rateDriver(5),
      expect: () => [
        isA<RatingsStateLoading>(),
        isA<RatingsStateComplete>().having((state) => state.statisfied,
            'check if the customer satisfied is true', true)
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if customer is able to complete if the rating is 4',
      build: () => mockCubit,
      act: (b) => b.rateDriver(4),
      expect: () => [
        isA<RatingsStateLoading>(),
        isA<RatingsStateComplete>().having((state) => state.statisfied,
            'check if the customer satisfied is true', true)
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if customer is able to complete if the rating is 3',
      build: () => mockCubit,
      act: (b) => b.rateDriver(4),
      expect: () => [
        isA<RatingsStateLoading>(),
        isA<RatingsStateComplete>().having((state) => state.statisfied,
            'check if the customer satisfied is true', true)
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
  });
  group('Test faults behaviour', () {
    blocTest<RatingsCubit, RatingsState>(
      'check if customer is able to add faults and match with the length',
      build: () => mockCubit,
      act: (b) => b.selectFault(mockFault[0]),
      expect: () => [
        isA<RatingsStateSelectFault>(),
      ],
      verify: (v) => expect(v.selected.length, 1),
    );

    blocTest<RatingsCubit, RatingsState>(
      'check if customer selecting the same faults de-selects it',
      build: () => mockCubit,
      act: (b) => b
        ..selectFault(mockFault[0])
        ..selectFault(mockFault[0]),
      expect: () => [
        isA<RatingsStateSelectFault>(),
        isA<RatingsStateSelectFault>(),
      ],
      verify: (v) => expect(v.selected.length, 0),
    );
    blocTest<RatingsCubit, RatingsState>(
      'check if customer able to select more than 5 faults',
      build: () => mockCubit,
      act: (b) => b
        ..selectFault(mockFault[0])
        ..selectFault(mockFault[1])
        ..selectFault(mockFault[2])
        ..selectFault(mockFault[3])
        ..selectFault(mockFault[4])
        ..selectFault(mockFault[5])
        ..selectFault(mockFault[6]),
      expect: () => [
        isA<RatingsStateSelectFault>(),
        isA<RatingsStateSelectFault>(),
        isA<RatingsStateSelectFault>(),
        isA<RatingsStateSelectFault>(),
        isA<RatingsStateSelectFault>(),
        isA<RatingsStateSelectFault>(),
        isA<RatingsStateSelectFault>(),
      ],
      verify: (v) => expect(v.selected.length, 5),
    );
  });
  tearDown(() => mockCubit.close());
}
