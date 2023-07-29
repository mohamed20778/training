import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/titleModel.dart';
import 'package:untitled/service/title_service.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  List<TitleModel> titles=[];
  bool isLoading=true;
  Future<void>getTitle()
  async {
    titles=await TitleService().getTitle();
    isLoading=false;
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTitle();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
        itemCount: titles.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(titles[index].title ?? "--"),
          );
        },
      ),
    );
  }
}
