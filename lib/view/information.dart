import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/title_cubit.dart';

class Information extends StatefulWidget {
  final int Index;
   const Information({super.key,required this.Index});


  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {

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
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('ID: ${context.watch<TitleCubit>().titles[widget.Index].id}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text('Completed: ${context.watch<TitleCubit>().titles[widget.Index].completed}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                  ],
                )
                ,):const Center(
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

