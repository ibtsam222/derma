import 'package:derma/ui_Todo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../services/task.controller.dart';
import '../services/task.dart';
import '../services/theme.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  final Task? task;
  const AddTaskPage({Key? key, this.task}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  String? deviceName;

  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 2)))
      .toString();
  String _endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(const Duration(minutes: 10)))
      .toString();

  int _selectedRemind = 0;
  List<int> remindList = [0, 5, 10, 15, 20, 25, 30];

  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];

  int _selectedColor = 0;

  @override
  void initState() {
    super.initState();

    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _noteController.text = widget.task!.note;
      _selectedDate = DateFormat.yMd().parse(widget.task!.date!);
      _startTime = widget.task!.startTime!;
      _endTime = widget.task!.endTime!;
      _selectedRemind = widget.task!.remind!;
      _selectedRepeat = widget.task!.repeat!;
      _selectedColor = widget.task!.color!;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        toolbarHeight: 35,
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

      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _titleBar(),
              _inputField(),
            ],
          ),
        ),
      ),
    );
  }


  _titleBar() {
    return Text(widget.task == null ? "Add Task" : "Update Task",
        style: headingStyle);
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 4)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 8)),
    );

    if (pickerDate != null) {
      setState(() {
        _selectedDate = pickerDate;
      });
    } else {
      Get.snackbar(
        "Error Occured!",
        "Date is not selected",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickTime = await _showTimePicker();

    if (pickTime != null) {
      // ignore: use_build_context_synchronously
      String formatedTime = pickTime.format(context);

      setState(() {
        if (isStartTime) {
          _startTime = formatedTime;
        } else {
          _endTime = formatedTime;
        }
      });
    } else {
      Get.snackbar(
        "Error Occured!",
        "Time is not selected",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }

  _inputField() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(
        children: [
          MyInputField(
            title: "Title",
            hint: "Enter your title",
            controller: _titleController,
          ),
          MyInputField(
            title: "Note",
            hint: "Enter your note",
            controller: _noteController,
          ),
          MyInputField(
            title: "Date",
            hint: DateFormat.yMd().format(_selectedDate),
            widget: IconButton(
              onPressed: () => {
                _getDateFromUser(),
              },
              icon: const Icon(
                Icons.calendar_month_outlined,
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: MyInputField(
                  title: "Start Time",
                  hint: _startTime,
                  widget: IconButton(
                    onPressed: () => {
                      _getTimeFromUser(isStartTime: true),
                    },
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
                child: MyInputField(
                  title: "End Time",
                  hint: _endTime,
                  widget: IconButton(
                    onPressed: () => {
                      _getTimeFromUser(isStartTime: false),
                    },
                    icon: const Icon(
                      Icons.access_time_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          MyInputField(
            title: "Remind",
            hint: "$_selectedRemind minutes early",
            widget: DropdownButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              iconSize: 32,
              elevation: 4,
              padding: const EdgeInsets.only(right: 5),
              style: subTitleStyle,
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRemind = int.parse(newValue!);
                });
              },
              items: remindList.map<DropdownMenuItem<String>>((int value) {
                return DropdownMenuItem<String>(
                  value: value.toString(),
                  child: Text(
                    "$value minutes early",
                    style: subTitleStyle,
                  ),
                );
              }).toList(),
            ),
          ),
          MyInputField(
            title: "Repeat",
            hint: _selectedRepeat,
            widget: DropdownButton(
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              iconSize: 32,
              elevation: 4,
              padding: const EdgeInsets.only(right: 5),
              style: subTitleStyle,
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRepeat = newValue!;
                });
              },
              items: repeatList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: subTitleStyle,
                  ),
                );
              }).toList(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _colorPallet(),
              MyButton(
                label: widget.task == null ? "Create Task" : "Update Task",
                onTap: () => _validateData(),
              ),
            ],
          )
        ],
      ),
    );
  }

  _validateData() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      // Add to database
      _addTaskToDb();
      Get.back();
    } else if (_titleController.text.isEmpty || _noteController.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All field is required!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.grey,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
          size: 35,
        ),
        colorText: Colors.red,
      );
    }
  }

  _colorPallet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Color",
          style: titleStyle,
        ),
        Wrap(
          children: List<Widget>.generate(4, (int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, top: 8),
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: index == 0
                      ? blackColor
                      : index == 1
                      ? primaryColor2
                      : index == 2
                      ? primaryColor
                      : darkHeaderColor,
                  child: Icon(
                    _selectedColor == index ? Icons.done : null,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }

  void _addTaskToDb() async {
    Task task = Task(
      id: widget.task?.id,
      title: _titleController.text,
      note: _noteController.text,
      date: DateFormat.yMd().format(_selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
      color: _selectedColor,
      isCompleted: widget.task?.isCompleted ?? 0,
      createdAt:
      widget.task?.createdAt ?? DateFormat.yMd().format(DateTime.now()),
      updatedAt: DateFormat.yMd().format(DateTime.now()),
    );

    if (widget.task == null) {
      await _taskController.addTask(task: task);
    } else {
      await _taskController.updateTaskInfo(task);
    }
    Get.back();
  }
}
