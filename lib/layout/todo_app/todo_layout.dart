import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:untitled1/modules/done_tasks/done_tasks_screen.dart';
import 'package:untitled1/modules/new_tasks/new_tasks_screen.dart';
import 'package:untitled1/shared/components/components.dart';
import 'package:untitled1/shared/components/constants.dart';
import 'package:untitled1/shared/cubit/cubit.dart';
import 'package:untitled1/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timingController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (BuildContext context) => AppCubit()..createDatabase(),
    //   child: BlocConsumer<AppCubit, AppStates>(
    //     listener: (BuildContext context, AppStates state) {
    //       if(state is AppInsertDatabaseState){
    //         Navigator.pop(context);
    //       }
    //     },
    //     builder: (BuildContext context, AppStates state) {
    //       AppCubit cubit = AppCubit.get(context);
    //       return Scaffold(
    //         key: scaffoldKey,
    //         appBar: AppBar(
    //           title: Text(
    //             cubit.titles[cubit.currentIndex],
    //           ),
    //         ),
    //         body: ConditionalBuilder(
    //           condition: state is! AppGetDatabaseLoadingState,
    //           builder: (context) => cubit.screens[cubit.currentIndex],
    //           fallback: (context) => Center(child: CircularProgressIndicator()),
    //         ),
    //         floatingActionButton: FloatingActionButton(
    //           onPressed: () {
    //             if (cubit.isBottomShetShown) {
    //               if (formKey.currentState.validate()) {
    //                 cubit.insertDatabase(
    //                   title: titleController.text,
    //                   date: dateController.text,
    //                   time: timingController.text,
    //                 );
    //               }
    //             } else {
    //               scaffoldKey.currentState
    //                   .showBottomSheet(
    //                     (context) => Container(
    //                       color: Colors.grey[100],
    //                       padding: EdgeInsets.all(20.0),
    //                       child: Form(
    //                         key: formKey,
    //                         child: Column(
    //                           mainAxisSize: MainAxisSize.min,
    //                           children: [
    //                             defaultFormFeild(
    //                                 label: 'Text Title',
    //                                 controller: titleController,
    //                                 prefix: Icons.title,
    //                                 type: TextInputType.text,
    //                                 validate: (String value) {
    //                                   if (value.isEmpty) {
    //                                     return 'Text must not be empty ';
    //                                   }
    //                                   return null;
    //                                 }),
    //                             SizedBox(
    //                               height: 15,
    //                             ),
    //                             defaultFormFeild(
    //                                 label: 'Task time',
    //                                 controller: timingController,
    //                                 prefix: Icons.watch_later_outlined,
    //                                 type: TextInputType.datetime,
    //                                 onTap: () {
    //                                   showTimePicker(
    //                                     context: context,
    //                                     initialTime: TimeOfDay.now(),
    //                                   ).then((value) {
    //                                     timingController.text =
    //                                         value.format(context).toString();
    //                                     print(value.format(context));
    //                                   });
    //                                 },
    //                                 validate: (String value) {
    //                                   if (value.isEmpty) {
    //                                     return 'time must not be empty ';
    //                                   }
    //                                   return null;
    //                                 }),
    //                             SizedBox(
    //                               height: 15,
    //                             ),
    //                             defaultFormFeild(
    //                                 label: 'Task date',
    //                                 controller: dateController,
    //                                 prefix: Icons.date_range_outlined,
    //                                 type: TextInputType.datetime,
    //                                 onTap: () {
    //                                   showDatePicker(
    //                                     context: context,
    //                                     initialDate: DateTime.now(),
    //                                     firstDate: DateTime.now(),
    //                                     lastDate: DateTime.parse('2021-12-12'),
    //                                   ).then((value) {
    //                                     dateController.text =
    //                                         DateFormat.yMMMd().format(value);
    //                                     print(DateFormat.yMMMd().format(value));
    //                                   });
    //                                 },
    //                                 validate: (String value) {
    //                                   if (value.isEmpty) {
    //                                     return 'date must not be empty ';
    //                                   }
    //                                   return null;
    //                                 }),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                   .closed
    //                   .then((value) {
    //                 cubit.changeBottomSheetState(
    //                     isShow: false, icon: Icons.edit);
    //               });
    //               cubit.changeBottomSheetState(
    //                 icon: Icons.add,
    //                 isShow: true,
    //               );
    //             }
    //           },
    //           child: Icon(
    //            cubit.fabIcon,
    //           ),
    //         ),
    //         bottomNavigationBar: BottomNavigationBar(
    //           type: BottomNavigationBarType.fixed,
    //           currentIndex: cubit.currentIndex,
    //           onTap: (index) {
    //             cubit.changeIndex(index);
    //           },
    //           items: [
    //             BottomNavigationBarItem(
    //               icon: Icon(
    //                 Icons.menu_outlined,
    //               ),
    //               label: 'Tasks',
    //             ),
    //             BottomNavigationBarItem(
    //               icon: Icon(
    //                 Icons.check_circle,
    //               ),
    //               label: 'Done',
    //             ),
    //             BottomNavigationBarItem(
    //               icon: Icon(
    //                 Icons.archive_outlined,
    //               ),
    //               label: 'Archived',
    //             ),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
