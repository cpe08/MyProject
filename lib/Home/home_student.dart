import 'package:flutter/material.dart';

class HomeStudent extends StatefulWidget {
  final String username;
  HomeStudent({Key key, @required this.username}) : super(key: key);
  @override
  _HomeStudentState createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สวัสดีนักศึกษา"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (Route<dynamic> route) => false);
            },
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: <Widget>[
              CustomListTitle(
                Icons.data_usage,
                'แก้ไขข้อมูลส่วนตัว',
                    () => {Navigator.pushNamed(context, '/edit_myprofile')},
              ),
              CustomListTitle(
                Icons.data_usage,
                'เข้าร่วมกิจกรรม',
                    () => {Navigator.pushNamed(context, '/scan')},
              ),
              CustomListTitle(
                Icons.data_usage,
                'ผลการเข้าร่วมกิจกรรม',
                    () => {Navigator.pushNamed(context, '/activitted')},
              ),
              CustomListTitle(
                Icons.data_usage,
                'ปฏิทินกิจกรรม',
                    () => {Navigator.pushNamed(context, '/calendar')},
              ),
              CustomListTitle(
                Icons.data_usage,
                'เปลี่ยนรหัสผ่าน',
                    () => {Navigator.pushNamed(context, '/changpassword')},
              ),
            ],)
        ),
      ),
    );
  }
}
class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTitle(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    //todo implemant build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.blue,
          onTap: onTap,
          child: Container(
            height: 66,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}