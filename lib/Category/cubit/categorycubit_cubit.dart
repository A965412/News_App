import 'package:bloc/bloc.dart';

import 'package:news_application/APi/Api_Manager.dart';
import 'package:news_application/Models/SourceResponse.dart';

part 'categorycubit_state.dart';

class CategorycubitCubit extends Cubit<SourceStates> {
  CategorycubitCubit() : super(SourceLoadingState());

  void getSources(String categoryid) async {
    try {
      emit(SourceLoadingState());

      var response = await Apimanager.getresources(categoryid);
      if (response!.status == "error   ") {
        emit(SourceErrorState(errorMessage: response.message));
        return;
      } else if (response.status == "ok") {
        emit(SourceSuccessState(sourcesList: response.sources!));
        return;
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
