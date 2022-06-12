
import 'package:akhbarapp/components/components.dart';
import 'package:akhbarapp/cubit/news_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/states.dart';
 
class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
         
         return BlocConsumer<NewsCubit,NewsStates>(
           
           listener: (context, state) {},
           builder:(context,state){
             var businessCubit = NewsCubit.get(context).business;
             return articleBuilder(businessCubit,context);
           }


         
);}}