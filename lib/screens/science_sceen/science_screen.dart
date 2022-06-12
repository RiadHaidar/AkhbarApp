
import 'package:akhbarapp/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/news_cubit.dart';
import '../../cubit/states.dart';

class ScienceScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<NewsCubit,NewsStates>(
           
           listener: (context, state) {},
           builder:(context,state){
             var scienceCubit = NewsCubit.get(context).science;
             return articleBuilder(scienceCubit,context);
           }

  );
  }
}