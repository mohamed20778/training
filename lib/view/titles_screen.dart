import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/view/cubit/title_cubit.dart';

class TitleScreen extends StatefulWidget {
  const TitleScreen({super.key});

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:BlocProvider(create:(context)=>TitleCubit(),
      child: BlocConsumer<TitleCubit, TitleState>(
          builder: (context,state)
          {
            return state is TitleLoading?
            const Center(
              child: CircularProgressIndicator(),
            ): state is TitleSuccess?
            ListView.builder(
              itemCount: context.watch<TitleCubit>().titles.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(context.watch<TitleCubit>().titles[index].title ?? "--"),
                );
              },
            ):const Center(
              child: Text('error')
            );

          },
          listener: (context,state)
          {
            if(state is TitleLoading)
            {
              print('loading');
            }
          }),
      )
    );
  }
}

