
import 'package:dio/dio.dart';

import '../models/titleModel.dart';

class TitleService
{
  String url="https://jsonplaceholder.typicode.com/todos";

  Future<List<TitleModel>>getTitle()
  async {
    
    List<TitleModel>titles=[];
    Response response=await Dio().get(url);
    print("hello");
    var data=response.data;
    print(data);
    data.forEach((element){
      TitleModel title=TitleModel.fromJson(element);
      titles.add(title);
    });
    return titles;
  }
}