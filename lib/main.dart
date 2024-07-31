import 'package:flutter/material.dart';
import 'person.dart';

void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: const Center(child: Text("Bài tập")),
           backgroundColor: Colors.yellow,
         ),
         body: const Center(child: MyWidget()),
       ),
      ) ,
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyWidget extends StatefulWidget
{
  const MyWidget({super.key});
  @override
  State<StatefulWidget> createState() {
   return _MyWigetState();
  }
}
//State<MyWidget> Quản lý trạng thái cho MyWidget
class _MyWigetState extends State<MyWidget>
{
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
 // TextEditingController _data = TextEditingController();
  List<Person> person = [];
  void _AddData()
  {
    final textName = _name.text;
    final textAddress = _address.text;
    if(textName.isEmpty && textAddress.isEmpty)
      {
        _name.text="Không bỏ trống";
        _address.text="Không bỏ trống";
      }
        setState(() {
          person.add(Person(textName, textAddress));
          print("$_name");
          _name.clear();
          _address.clear();
        });
  }
  void _Remove()
  {
    if(person.isEmpty)
      {
        _name.text="Danh sách rỗng";
        _address.text="Danh sách rỗng";
      }
    setState(() {
      person.removeAt(0);
      print("Xóa Thành Công");
    });
  }
  @override
  Widget build(BuildContext context) {
   return Column(
     children: <Widget>[
       Container(
         padding: const EdgeInsets.all(30.0),
         child: TextField(
           controller: _name,
           decoration: const InputDecoration(
             border: OutlineInputBorder(),
             hintText: "Name"
           ),
         ),
       ),
       Container(
         padding: const EdgeInsets.all(30.0),
         child: TextField(
           controller: _address,
           decoration: const InputDecoration(
               border: OutlineInputBorder(),
               hintText: "Address"
           ),
         ),
       ),
       // Container(
       //   padding: const EdgeInsets.all(30.0),
       //   child: FloatingActionButton(
       //     onPressed: _AddData,
       //     child: Icon(Icons.add,size: 40),
       //   ),
      Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(30.0),
            child: FloatingActionButton(
              onPressed: _AddData,
              child: Icon(Icons.add,size: 40),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30.0),
            child: FloatingActionButton(
              onPressed: _Remove,
              child: Icon(Icons.delete,size: 40),
            ),
          ),
        ],
      ),
       Expanded(
         //Tạo một danh sách
         child: ListView.builder(
           //itemCount : Xác định tổng đối tượng trong danh sách
           itemCount: person.length,
           //Tạo và trả về widget cho phần tử tại index
           itemBuilder: (context, index) {
             //Hiển thị một hàng trong listview
             return ListTile(
               title: Text(person[index].name),//Hiển thị tiêu đề
               subtitle: Text(person[index].address),//Hiển thị phụ đề
             );
           },
         ),
       )
     ],
   );
  }

}