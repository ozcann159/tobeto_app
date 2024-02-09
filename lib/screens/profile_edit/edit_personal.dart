import 'package:flutter/material.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class EditPersonal extends StatefulWidget {
  const EditPersonal({Key? key}) : super(key: key);

  @override
  _EditPersonalState createState() => _EditPersonalState();
}

class _EditPersonalState extends State<EditPersonal> {
  var dropdownValue = list.first;
  var dropdownValueSecond = list.first;
  var imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hakkımda"),
        scrolledUnderElevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: ListView(
          children: [
            Column(
              children: [
                CircleAvatar(
                  maxRadius: 32,
                  child: imagePath != null
                      ? Image.asset(
                          imagePath,
                          width: 150,
                          height: 75,
                        )
                      : Icon(Icons.person),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ad",
                  ),
                ),
                TextField(
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
                    "Soyad",
                  ),
                ),
                TextField(
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
                    "Telefon Numarası",
                  ),
                ),
                TextField(
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
                    "Doğum Tarihiniz",
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
                          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        IconButton(
                            onPressed: () {},
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
                    "E-Posta",
                  ),
                ),
                TextField(
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
                    "Adres",
                  ),
                ),
                TextField(
                  maxLines: 4,
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
                    "Hakkımda",
                  ),
                ),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: const EdgeInsets.all(8)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Kaydet"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF011D42),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width * 0.9,
                      MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
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
