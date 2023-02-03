import 'dart:convert';

import 'package:apitutorials/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserData extends StatefulWidget {
  const UserData({Key? key}) : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

  List<UserModel> userList = [];

  Future<List<UserModel>> getUserApi() async{
    
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());


    if(response.statusCode == 200){
      for(Map i in data){
        print(i["name"]);
        userList.add(UserModel.fromJson(i));

      }
      return userList;
    }
    else{
      return userList;
    }
    

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Course"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder:(context,AsyncSnapshot<List<UserModel>> snapshot){
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context,index){
                      return Card(
                        child: Column(
                          children: [
                            ReuseableRow(title: "Name", value: snapshot.data![index].name.toString()),
                            ReuseableRow(title: "UserName", value: snapshot.data![index].username.toString()),
                            ReuseableRow(title: "Email", value: snapshot.data![index].email.toString()),
                            ReuseableRow(title: "Email", value: snapshot.data![index].address!.city.toString()),
                          ],
                        ),
                      );

                    },
                  );

                }),
          )
        ],
      ),
    );
  }
}


class ReuseableRow extends StatelessWidget {
  String title, value;
   ReuseableRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
