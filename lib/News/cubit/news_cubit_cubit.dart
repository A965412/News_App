import 'package:bloc/bloc.dart';
import 'package:news_application/APi/Api_Manager.dart';
import 'package:news_application/Models/EveryResponse.dart';

part 'news_cubit_state.dart';

class NewsCubitCubit extends Cubit<NewsStates> {
  NewsCubitCubit() : super(NewsLoadingState());

  void NegetNews(
    String categoryid,
  ) async {
    try {
      emit(NewsLoadingState());

      var response = await Apimanager.getNewsById(
        categoryid,
      );
      if (response!.status == "error   ") {
        emit(NewsErrorState(errormassage: response.message));
        return;
      } else if (response.status == "ok") {
        emit(NewsSuccessState(articleList: response.articles!));
        return;
      }
    } catch (e) {
      emit(NewsErrorState(
        errormassage: e.toString(),
      ));
    }
  }
}
