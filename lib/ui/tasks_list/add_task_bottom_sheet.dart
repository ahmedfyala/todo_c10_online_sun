import 'package:flutter/material.dart';
import 'package:todo_c10_online_sun/core/utilits/app_colors.dart';
import 'package:todo_c10_online_sun/core/utilits/my_date_utilis.dart';

import '../componant/custom_text_form_field.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController tittleController = TextEditingController();

  TextEditingController discController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "ADD New Task",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              validation: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter valid tittle";
                }
              },
              controller: tittleController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: AppColor.primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: AppColor.primaryColor)),
                labelText: "Tittle",
              ),
            ),
            SizedBox(
              height: 12,
            ),
            CustomTextFormField(
              maxLines: 3,
              minLines: 3,
              validation: (text) {
                if (text == null || text.trim().isEmpty) {
                  return "please enter valid description";
                }
              },
              controller: discController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: AppColor.primaryColor)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(22),
                    borderSide: BorderSide(color: AppColor.primaryColor)),
                labelText: "Description",
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text("Selected date"),
            InkWell(
              onTap: () {
                showTaskdatePicker();
              },
              child: Align(
                  alignment: Alignment.center,
                  child: Text("${MyDataUtilis.formateTaskDate(selectedDate)}")),
            ),
            SizedBox(
              height: 22,
            ),
            ElevatedButton(
                onPressed: () {
                  addTask();
                },
                child: Text("Add Task"))
          ],
        ),
      ),
    );
  }

  void showTaskdatePicker() async {
    var date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (date == null) return;
    selectedDate = date;
    setState(() {});
  }

  void addTask() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
