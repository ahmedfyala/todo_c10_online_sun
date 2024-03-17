import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_c10_online_sun/core/firestore_helper.dart';
import 'package:todo_c10_online_sun/core/providers/auth_provider.dart';
import 'package:todo_c10_online_sun/core/utilits/app_colors.dart';
import 'package:todo_c10_online_sun/core/utilits/dialog_utils.dart';
import 'package:todo_c10_online_sun/model/task.dart';

class TaskItem extends StatelessWidget {
  Task task;
  TaskItem({super.key,required this.task});

  @override
  Widget build(BuildContext context) {
    AuthUserProvider provider = Provider.of<AuthUserProvider>(context);
    return  Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.2,
          motion: BehindMotion(),
          children: [
           SlidableAction(
              spacing: 20,
               onPressed: (context)async{
                //DialogUtils.showLoadingDialog(context: context);
                await FirestoreHelper.DeleteTask(taskid: task.id!, userId: provider.authUser!.uid);
                //DialogUtils.hideDialog(context: context);
               },
              icon: Icons.delete,
              label: "Delete",
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24)
              ),
           )
          ]
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          //color: Colors.white,
          // height: 110,
          // width: 200,
          child: Row(

            children: [

              Container(
                margin: EdgeInsets.all(15),
                // padding: EdgeInsets.all(20),
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.primaryColor

                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(task.title??""),
                  SizedBox(
                    height: 12,
                  ),
                  Text(task.description??""),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: () {

                },
                child: Container(
                   width: 50,
                   height: 40,
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(15),

                    ),

                    child: Icon(Icons.check,size: 25,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
