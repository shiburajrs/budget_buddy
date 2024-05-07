import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:budget_buddy/utils/textConstants.dart';
import 'package:flutter/material.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';


import '../../utils/textStyleUtils.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {


    Widget categoryList(){
      return ListView.builder(
        shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,index) {
        return Container(margin: EdgeInsets.only(bottom: 25),
          height: 50,
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,children: [
              Container(height: 15,width: 15,color: ColorUtils.getCategoryColor(index),) ,

              SizedBox(width: 10,),

              Text(TextConstants.category,style: TextUtils.getPoppinsMedium(fontSize: 12,color: Colors.black),)
            ],),

          SizedBox(height: 10,),

          SizedBox(height: 8,
            child: LinearProgressIndicator(borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.black.withOpacity(0.2),value: 0.8,
              valueColor:AlwaysStoppedAnimation<Color>(ColorUtils.getCategoryColor(index)),),
          )
        ],),);
      });
    }

    return  Scaffold(appBar: AppBar(backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(TextConstants.accounts, style: TextUtils.getPoppinsBold(fontSize: 20.0, color: Colors.black),),),
    backgroundColor: Colors.white,
    body:  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 30,left: 15,right: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SemicircularIndicator(
              color: ColorUtils.primaryColor,
              bottomPadding: 0,
              child: Column(
                children: [
                  Text(TextConstants.youSpent,style: TextUtils.getPoppinsMedium(color: Colors.black,fontSize: 16),),
                  const SizedBox(height: 5,),
                  Text.rich(TextSpan(
                      text: "${TextConstants.rupeesSign} 7500 ",
                      style: TextUtils.getPoppinsBold(color: Colors.red,fontSize: 18),
                      children: <InlineSpan>[
                        TextSpan(
                          text: ' of ',
                          style: TextUtils.getPoppinsMedium(color: Colors.grey,fontSize: 16),
                        ),
      
                        TextSpan(
                          text: ' ${TextConstants.rupeesSign} 10000',
                          style: TextUtils.getPoppinsBold(color: Colors.green,fontSize: 18),
                        )
                      ]
                  ))
                 // Text("${TextConstants.rupeesSign} 7500  of  ${TextConstants.rupeesSign} 10000",style: TextUtils.getPoppinsMedium(color: Colors.black,fontSize: 16),),
                ],
              ),
            ),
          ),
      
          SizedBox(height: 60,),
      
          Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
          color: Colors.black.withOpacity(0.2)),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: GestureDetector(onTap: (){
              setState(() {
                selectedTab = 0;
              });
            },
              child: Container(height: 30,width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                color: selectedTab == 0 ?ColorUtils.primaryColor : Colors.transparent,),
              child: Center(child: Text(TextConstants.expense,style: TextUtils.getPoppinsMedium(color: selectedTab == 0 ? Colors.white :Colors.black, fontSize: 14),),),),
            )),
            Flexible(child: GestureDetector(onTap: (){
              setState(() {
                selectedTab = 1;
              });
            },
              child: Container(height: 30,width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                color: selectedTab == 1 ?ColorUtils.primaryColor : Colors.transparent,),
                  child: Center(child: Text(TextConstants.income,style: TextUtils.getPoppinsMedium(color: selectedTab == 1 ? Colors.white :Colors.black, fontSize: 14),),)),
            )),
          ],),),
      
      
          SizedBox(height: 45,),
      
      
          categoryList(),

          SizedBox(height: 30,)
      
        ],),
      ),
    ),);
  }
}
