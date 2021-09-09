import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

void main() async {
  List list = await initServices();
  runApp(MainPage(list: list));
}

Future<List> initServices() async {
  Controller controller = new Controller();
  return controller.editElements();
}

class MainPage extends StatelessWidget {

  MainPage({required this.list});

  final List list;

  Widget page(String day, int index) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.05,
          ),
          Text(day, style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white
          ),),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Container(
            width: Get.width * 0.8,
           height: Get.height * 0.5,
           decoration: BoxDecoration(
             color: Colors.white,
             borderRadius: BorderRadius.all(Radius.circular(12.0))
           ),
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Text(
                  list[index],
                style: TextStyle(
                  fontSize: 14.0
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF6565B0),
        ),
      ),

      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Color(0xFF4A4A8A),
          appBar: AppBar(
            title: Text("This week in SYK"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text("MON")),
                Tab(icon: Text("TUE")),
                Tab(icon: Text("WED")),
                Tab(icon: Text("THU")),
                Tab(icon: Text("FRI")),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              page("Monday", 0),
              page("Tuesday", 1),
              page("Wednesday", 2),
              page("Thursday", 3),
              page("Friday", 4),
            ],
          ),
        ),
      ),
    );
  }
}
