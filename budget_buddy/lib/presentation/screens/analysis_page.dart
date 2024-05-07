import 'package:budget_buddy/presentation/screens/graphView.dart';
import 'package:budget_buddy/utils/assetUtils.dart';
import 'package:budget_buddy/utils/textConstants.dart';
import 'package:flutter/material.dart';
import '../../utils/colorUtils.dart';
import '../../utils/textStyleUtils.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({super.key});

  @override
  State<AnalysisPage> createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {

  int selectedTab = 0;
  String selectedChoice = TextConstants.today;
  String dateIndicatorText = "5 May, 2024";

  @override
  Widget build(BuildContext context) {


    Widget categoryList(){
      return ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: (context,index) {
            return Container(margin: const EdgeInsets.only(bottom: 25),
              height: 50,
              child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,children: [
                      Container(height: 15,width: 15,color: ColorUtils.getCategoryColor(index),) ,

                      const SizedBox(width: 10,),

                      Text(TextConstants.category,style: TextUtils.getPoppinsMedium(fontSize: 12,color: Colors.black),)
                    ],),

                  const SizedBox(height: 10,),

                  Container(height: 8,
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
      title: Text(TextConstants.analysis, style: TextUtils.getPoppinsBold(fontSize: 20.0, color: Colors.black),),
      actions: [
        PopupMenuButton<String>(icon: AssetUtils.commonAssetImage("filter.png", 18, 18),
          onSelected: handleClick,
          color: Colors.white,
          itemBuilder: (BuildContext context) {
            return {TextConstants.today,TextConstants.weekly,TextConstants.monthly, TextConstants.year}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(choice,style: TextUtils.getPoppinsMedium(fontSize: 13,color: Colors.black),),
                    SizedBox(width: 10,),
                    selectedChoice == choice ? Container(height: 8,width: 8,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                    color: Colors.red),) : Container()
                  ],
                ),
              );
            }).toList();
          },
        ),
      ],
    ),
      backgroundColor: Colors.white,
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios,size: 20,),
                  SizedBox(width: 15,),
                  Text("5 May, 2024",style: TextUtils.getPoppinsMedium(color: Colors.black, fontSize: 13),),
                  SizedBox(width: 15,),
                  Icon(Icons.arrow_forward_ios,size: 20,)
                ],
              )),

              SizedBox(height: 25      ,),

              SizedBox(height: 200,
                  child: GraphView(keyValue: selectedTab == 0 ? true : false,)),

              const SizedBox(height: 60,),

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


              const SizedBox(height: 45,),


              categoryList(),

              const SizedBox(height: 30,)

            ],),
        ),
      ),);
  }

  void handleClick(String value) {
    switch (value) {
      case 'Today':
        {
          setState(() {
            selectedChoice = value;
          });
        }
        break;
      case 'Weekly':
        {
          setState(() {
            selectedChoice = value;
          });
        }
        break;
      case 'Monthly':
        {
          setState(() {
            selectedChoice = value;
          });
        }
        break;
      case 'Year':
        {
          setState(() {
            selectedChoice = value;
          });
        }
        break;
    }
  }
}
