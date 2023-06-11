import 'package:flutter/material.dart';

import 'UsersModel.dart';
import 'apiservice.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  FetchProduct productList = FetchProduct();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('ProductList'),
            actions: [
              IconButton( icon: Icon(Icons.search),
                onPressed: (){
                 //showSearch(context: context, delegate: Searck());
                },
              )
            ],
          ),
      body: Container(
        child: FutureBuilder<List<UsersModel>>(
          future: productList.getProductList(),
          builder: (context, snapshot) {
            var data = snapshot.data;
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            return ListView.builder(
              itemCount: data?.length,
                itemBuilder: (context,index){
              return Card(
child: ListTile(
  title: Row(children: [
    Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          '${data?[index].data!.products!.results![index].id}',
          style: TextStyle(color: Colors.white),),),


    ),
    SizedBox(width: 10,),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      Text('${data![index].data!.products!.results![index].brand!.name}'),
      Text('${data![index].data!.products!.results![index].brand!.slug}'),
    ],)


  ],),
),
              );
            });
          }
        ),
      ),
    ));
  }
}
