import 'package:akhbarapp/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/news_cubit.dart';
import '../../cubit/states.dart';

class SearchScreen extends StatelessWidget {
TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
     return BlocConsumer<NewsCubit,NewsStates>(
           
           listener: (context, state) {},
           builder:(context,state){
             var searchResult = NewsCubit.get(context);
             return Scaffold(
               appBar: AppBar(title: Text('Search Screen'),),
               body:
               
               
                Padding(
                 padding: const EdgeInsets.all(8.0),
                 child:  Container(
                   child: listSearchBuilder(searchResult.search, context)),
                     
               ),
             );
           }, );

  }
}

