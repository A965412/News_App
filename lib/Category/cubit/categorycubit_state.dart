part of 'categorycubit_cubit.dart';

abstract class SourceStates {}

class SourceIntialState extends SourceStates {}

class SourceLoadingState extends SourceStates {}

class SourceErrorState extends SourceStates {
  String? errorMessage;

  SourceErrorState({required this.errorMessage});
}

class SourceSuccessState extends SourceStates {
  List<Source> sourcesList;

  SourceSuccessState({required this.sourcesList});
}
