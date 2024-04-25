import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:derma/ui_Todo/pages/home_page.dart';
import 'package:derma/ui_Todo/widgets/button.dart';
import 'package:intl/intl.dart';

import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  String _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();

  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _customAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add Tasks',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(63, 59, 108, 1),
                  fontFamily: 'poe',
                  height: 1.0,
                ),
              ),
              InputField(
                title: 'Title',
                hint: 'Enter title here',
              ),
              InputField(
                title: 'Note',
                hint: 'Enter note here',
              ),
              InputField(
                title: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                  onPressed: () => _getDateFromUser(),
                  icon: const Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      title: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartTime: true),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: InputField(
                      title: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                        onPressed: () => _getTimeFromUser(isStartTime: false),
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InputField(
                title: 'Remind',
                hint: '$_selectedRemind minutes early',
                widget: Row(
                  children: [
                    DropdownButton(
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      items: remindList
                          .map<DropdownMenuItem<String>>(
                              (int value) => DropdownMenuItem(
                                  value: value.toString(),
                                  child: Text(
                                    '$value',
                                    style: const TextStyle(color: Color(0xFF454571),fontFamily: 'poe'),
                                  )))
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey),
                      iconSize: 32,
                      elevation: 4,
                      underline: Container(
                        height: 0,
                      ),
                      style: TextStyle(
                        color: Color(0xFF454571),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRemind = int.parse(newValue!);
                        });
                      },
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ),
              InputField(
                title: 'Repeat',
                hint: _selectedRepeat,
                widget: Row(
                  children: [
                    DropdownButton(
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      items: repeatList
                          .map<DropdownMenuItem<String>>(
                              (String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Color(0xFF454571)),
                                  )))
                          .toList(),
                      icon: const Icon(Icons.keyboard_arrow_down,
                          color: Colors.grey),
                      iconSize: 32,
                      elevation: 4,
                      underline: Container(
                        height: 0,
                      ),
                      style: TextStyle(
                        fontFamily: 'poe',
                        color: Color(0xFF454571),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedRepeat = newValue!;
                        });
                      },
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // _colorPalette(),
                  MyButton(
                      label: 'Create Task',
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomePage()),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _customAppBar() {
    return AppBar(
      toolbarHeight: 50,


      automaticallyImplyLeading: false,
      actions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 16, 0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(4),
          ),
          width: 32,
          height: 32,
        ),
      ],
    );
  }
  _getDateFromUser() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2024),
        lastDate: DateTime(2050));
  }
  _getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(const Duration(minutes: 15))),
    );

    String formattedTime = pickedTime!.format(context);

    if (isStartTime) {
      setState(() => _startTime = formattedTime);
    } else if (!isStartTime) {
      setState(() => _endTime = formattedTime);
    } else {
      print('Something went wrong !');
    }
  }
}
