import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled1/layout/news_app/news_cubit/cubit.dart';
import 'package:untitled1/layout/news_app/news_cubit/states.dart';
import 'package:untitled1/shared/components/components.dart';

class SearchScreen  extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state)
      {
       var list = NewsCubit.get(context).search;
       return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormFeild(
                  controller: searchController ,
                  type:TextInputType.text ,
                  onChange: (value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate:(String value)
                  {
                    if(value.isEmpty){
                      return'search must not be empty';
                    }
                    return null;
                  },
                  label:'Search' ,
                  prefix:Icons.search ,
                ),
              ),
              Expanded(child: articleBuilder(list, context, isSearch:true,)),
            ],
          ),
        );
      },

    );
  }
}
