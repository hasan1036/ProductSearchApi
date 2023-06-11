import 'package:flutter/material.dart';

import 'UsersModel.dart';
import 'apiservice.dart';

class Searck  extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
  return [
    IconButton( icon: Icon(Icons.close),
    onPressed: (){
query="";
    },
    )
  ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return  IconButton( icon: Icon(Icons.arrow_back_ios),
      onPressed: (){
Navigator.pop(context);
      },
    );
  }

  FetchProduct productList = FetchProduct();
  @override
  Widget buildResults(BuildContext context) {
   return  Container(
     child: FutureBuilder<List<UsersModel>>(
         future: productList.getProductList(query: query),
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
   );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   return Center(
     child: Text("SEarch PRoduct"),
   );
  }

}
