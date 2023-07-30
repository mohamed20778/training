import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/titleModel.dart';
import '../../service/title_service.dart';

part 'title_state.dart';

class TitleCubit extends Cubit<TitleState> {
  TitleCubit() : super(TitleInitial())
  {
    getTitle();
  }
  List<TitleModel> titles=[];
  getTitle()
  async {
    try{
      emit(TitleLoading());
      titles = await TitleService().getTitle();
      emit(TitleSuccess());
    }
    catch(e)
    {
      print("error");
    }
    }
}
