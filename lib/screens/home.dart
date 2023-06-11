
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Models/ProductsModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

Future<ProuductsModel> getProductsApi () async{


    final response = await http.get(Uri.parse('https://panel.supplyline.network/api/product/search-suggestions'));
var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200)
      {
        return ProuductsModel.fromJson(data);
      }
    else{
      return ProuductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Api"),
        actions: [
          IconButton(

            icon: Icon(Icons.search),
            onPressed: (){

            },

          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child:FutureBuilder<ProuductsModel>(
                future: getProductsApi(),
                builder: (context,snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.data!.products!.results!.length,
                itemBuilder: (context,index){
                  return Column(

                    children: [

                      ListTile(
                         title: Text("Brand\n"'Name: ${snapshot.data!.data!.products!.results![index].brand!.name.toString()}\n'
                             'Header-Image: ${snapshot.data!.data!.products!.results![index].brand!.headerImage.toString()}\n'
                             'Name: ${snapshot.data!.data!.products!.results![index].brand!.slug.toString()}\n'
                         ),

                      ),

                      ListTile(
                        title: Text('${snapshot.data!.data!.products!.results![index].charge!.bookingPrice.toString()}\n'
                            'Price: ${snapshot.data!.data!.products!.results![index].charge!.currentCharge.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.discountCharge.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.sellingPrice.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.profit.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.isEvent.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.eventId.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.highlight.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.groupping.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.grouppingId.toString()}\n '
                            '${snapshot.data!.data!.products!.results![index].charge!.campaignSection.toString()}\n'
                            '${snapshot.data!.data!.products!.results![index].charge!.campaignSectionId.toString()}\n '
                            '${snapshot.data!.data!.products!.results![index].charge!.message.toString()}'


                        ),
                        // subtitle: Text(snapshot.data!.data!.products!.results![index].charge!.currentCharge.toString()),

                      ),



                     Container(
                       height:MediaQuery.of(context).size.height * .3,
                       width:MediaQuery.of(context).size.width * 1,
                       child: ListView.builder(
                          // scrollDirection: Axis.horizontal,
                           itemCount: snapshot.data!.data!.products!.results![index].images!.length,
                           itemBuilder: (context,position){
                                return Container(
                                  height:MediaQuery.of(context).size.height * .25,
                                  width:MediaQuery.of(context).size.width * .5,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(

                                          image: NetworkImage(snapshot.data!.data!.products!.results![index].images![position].image.toString())
                                          // image: NetworkImage(snapshot.data!.data!.products!.results![index].images![position].url.toString())
                                        )
                                      ),
                                );
                       }),
                     ),
                      ListTile(
                        title: Text("Product-Name: '${snapshot.data!.data!.products!.results![index].productName.toString()}\n,"
                            "slug: '${snapshot.data!.data!.products!.results![index].slug.toString()}\n"
                            "model: '${snapshot.data!.data!.products!.results![index].model.toString()}\n"
                            "commission - type: '${snapshot.data!.data!.products!.results![index].commissionType.toString()}\n"
                            "amount: '${snapshot.data!.data!.products!.results![index].amount.toString()}\n"
                            "tag: '${snapshot.data!.data!.products!.results![index].tag.toString()}\n"
                            "description: '${snapshot.data!.data!.products!.results![index].description.toString()}\n"
                            "note: '${snapshot.data!.data!.products!.results![index].note.toString()}\n"
                            "embadded_video_link: '${snapshot.data!.data!.products!.results![index].embaddedVideoLink.toString()}\n"
                            "maximum_order: '${snapshot.data!.data!.products!.results![index].maximumOrder.toString()}\n"
                            "stock: '${snapshot.data!.data!.products!.results![index].stock.toString()}\n"
                            "is_back_order: '${snapshot.data!.data!.products!.results![index].isBackOrder.toString()}\n"
                            "specification: '${snapshot.data!.data!.products!.results![index].specification.toString()}\n"
                            "warranty: '${snapshot.data!.data!.products!.results![index].warranty.toString()}\n"
                            "pre_order: '${snapshot.data!.data!.products!.results![index].preOrder.toString()}\n"
                            "product_review: '${snapshot.data!.data!.products!.results![index].productReview.toString()}\n"
                            "is_seller: '${snapshot.data!.data!.products!.results![index].isSeller.toString()}\n"
                            "is_phone: '${snapshot.data!.data!.products!.results![index].isPhone.toString()}\n"
                            "will_show_emi: '${snapshot.data!.data!.products!.results![index].willShowEmi.toString()}\n"
                            "badge: '${snapshot.data!.data!.products!.results![index].badge.toString()}\n"
                            "is_active: '${snapshot.data!.data!.products!.results![index].isActive.toString()}\n"
                            "sack_equivalent: '${snapshot.data!.data!.products!.results![index].sackEquivalent.toString()}\n"
                            "language: '${snapshot.data!.data!.products!.results![index].language.toString()}\n"
                            "seller: '${snapshot.data!.data!.products!.results![index].seller.toString()}\n"
                            "combo: '${snapshot.data!.data!.products!.results![index].combo.toString()}\n"
                            "created_at: '${snapshot.data!.data!.products!.results![index].createdAt.toString()}\n"
                            "update_at: '${snapshot.data!.data!.products!.results![index].updatedAt.toString()}\n"



                        ),
                      ),

                    ],
                  );
                });
          }
          else{
            return Text("loading...");
          }

                },
              ) )
        ],
      ),
    );
  }
    }