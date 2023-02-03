import 'dart:convert';
import 'package:apitutorials/Models/ComplexUserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LastExampleGetApi extends StatefulWidget {
  const LastExampleGetApi({Key? key}) : super(key: key);

  @override
  _LastExampleGetApiState createState() => _LastExampleGetApiState();
}

class _LastExampleGetApiState extends State<LastExampleGetApi> {
  
  Future<ComplexUserModel> getProductsApi() async{
    final response = await http.get(Uri.parse("https://webhook.site/7dc29675-6ec2-4009-98c1-83d254f07803"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      return ComplexUserModel.fromJson(data);
    }
    else{
      return ComplexUserModel.fromJson(data);
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Api Course"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ComplexUserModel>(
              future: getProductsApi(),
                builder:(context, snapshot){

                if(snapshot.hasData){
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height : MediaQuery.of(context).size.height*.3,
                              width : MediaQuery.of(context).size.width*1,
                              child: ListView.builder(

                                itemCount: snapshot.data!.data![index].images!.length,
                                itemBuilder: (context, position){
                                  return Container(
                                    height : MediaQuery.of(context).size.height*.25,
                                    width : MediaQuery.of(context).size.width*5,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()),
                                      )
                                    ),
                                  );
                                },
                                  )
                            ),

                          ],
                        );

                      });
                }
                else{
                  return Text("Loading");
                }



                }),
          )
        ],
      ),
    );
  }
}
