import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_bloc.dart';
import 'package:tobeto_app/blocs/userInfo_bloc/userInfo_event.dart';
import 'package:tobeto_app/models/graduate.dart';
import 'package:tobeto_app/models/user.dart';

const List<String> list = <String>[
  'Lise',
  'Lisans',
  'Yüksek Lisans',
  'Doktora'
];

class EditEducation extends StatefulWidget {
  final UserModel userModel;
  EditEducation({Key? key, required this.userModel}) : super(key: key);

  @override
  _EditEducationState createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  var dropdownValue = list.first;
  var isWork = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eğitim Hayatım"),
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Eğitim Durumu",
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black38),
                        borderRadius: BorderRadius.circular(14)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: Container(),
                        value: dropdownValue,
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Okul Adı",
                  ),
                ),
                TextField(
                  controller: _schoolController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.all(8),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Bölüm",
                  ),
                ),
                TextField(
                  controller: _sectionController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Başlangıç Yılı",
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${DateTime.now().year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        IconButton(
                            onPressed: () {
                              showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1990),
                                  lastDate: DateTime(2024, 2, 13));
                            },
                            icon: const Icon(Icons.calendar_month)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Mezuniyet Yılı",
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                      borderRadius: BorderRadius.circular(14)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6.0, right: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${DateTime.now().year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        isWork == false
                            ? IconButton(
                                onPressed: () {
                                  showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1990),
                                      lastDate: DateTime(2024, 2, 13));
                                },
                                icon: const Icon(Icons.calendar_month))
                            : Container(),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Checkbox(
                        value: isWork,
                        onChanged: (value) {
                          setState(() {
                            isWork = value!;
                          });
                        },
                      ),
                      Text("Devam Ediyorum")
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    widget.userModel.graduates != null
                        ? context.read<UserInfoBloc>().add(UpdateUserGraduate(
                                userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              graduates: [
                                ...widget.userModel.graduates!,
                                Graduate(
                                    type: dropdownValue,
                                    name: _schoolController.text,
                                    section: _sectionController.text,
                                    isContinue: isWork)
                              ],
                            )))
                        : context.read<UserInfoBloc>().add(UpdateUserGraduate(
                                userModel: UserModel(
                              name: widget.userModel.name,
                              surname: widget.userModel.surname,
                              email: widget.userModel.email,
                              graduates: [
                                Graduate(
                                    type: dropdownValue,
                                    name: _schoolController.text,
                                    section: _sectionController.text,
                                    isContinue: isWork)
                              ],
                            )));
                  },
                  child: const Text("Kaydet"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF011D42),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width * 0.9,
                        MediaQuery.of(context).size.height * 0.06,
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
