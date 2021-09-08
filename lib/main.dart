import 'package:flutter/material.dart';
import 'package:open_dropdown/controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  var _controller = DropdownController();
  var _mylist = [
    {'id': 1, 'name': 'A'},
    {'id': 2, 'name': 'B'},
    {'id': 3, 'name': 'C'},
  ];
  var _catdefval;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Dropdown'),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: Obx(() {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                  items: _mylist.map((e) {
                    return DropdownMenuItem(
                        value: e['id'].toString(),
                        child: Text(e['name'].toString()));
                  }).toList(),
                  value: _controller.isSelected.value
                      ? _controller.selectedValue.value
                      : _catdefval,
                  onChanged: _controller.isSelected.value
                      ? (id) {
                          _controller.selectedValue.value = id.toString();
                        }
                      : null,
                  isExpanded: true,
                  hint: Text('Select Category'),
                ),
                !_controller.isSelected.value
                    ? Container(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: ListView(
                          children: _mylist.map((e) {
                            return InkWell(
                              onTap: () {
                                _controller.isSelected.value = true;
                                _controller.selectedValue.value =
                                    e['id'].toString();
                              },
                              child: Container(
                                child: Text(e['name'].toString()),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                ),
                                margin: EdgeInsets.only(bottom: 5),
                                padding: EdgeInsets.all(10),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : Container(),
              ],
            );
          }),
        ),
      ),
    );
  }
}
