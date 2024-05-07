
import 'package:budget_buddy/utils/assetUtils.dart';
import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:budget_buddy/utils/textConstants.dart';
import 'package:budget_buddy/utils/textStyleUtils.dart';
import 'package:flutter/material.dart';

import '../../data/models/transactionModel.dart';
import '../widgets/balance_card.dart';
import '../widgets/custom_app_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  String jsonData = '''
  [
    {"title":"Grocery Shopping","description":"Bought weekly groceries","transactionType":1,"categoryType":1, "value": 50},
    {"title":"Salary Deposit","description":"Monthly salary credited","transactionType":2,"categoryType":1, "value": 300},
    {"title":"Dinner at Restaurant","description":"Celebrated anniversary at a fancy restaurant","transactionType":1,"categoryType":1, "value": 100},
    {"title":"Freelance Project Payment","description":"Received payment for completing a freelance project","transactionType":2,"categoryType":1, "value": 500},
    {"title":"Utilities Bill Payment","description":"Paid electricity and water bills","transactionType":1,"categoryType":1, "value": 150}
  ]
  ''';


  List colorList = [
    Color(0xFFB2DFDB),
    Color(0xFFE1BEE7),
    Color(0xFFFFCCBC),
    Color(0xFFC8E6C9),
    Color(0xFFFFF9C4)
  ];



  @override
  Widget build(BuildContext context) {



    Widget transactionList(){

      List<TransactionModel> transactions = transactionModelFromJson(jsonData);


      return ListView.builder(
        shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: transactions.length,
          itemBuilder: (context,index) {
        return Container(margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,children: [

          Container(height: 60,width: 60,decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
          color: ColorUtils.getCategoryColor(index)),),

            const SizedBox(width: 15,),

             Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(transactions[index].title,style: TextUtils.getPoppinsSemiBold(color: Colors.black,fontSize: 15),),
              const SizedBox(height: 3,),
              SizedBox(width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  transactions[index].description,
                  style: TextUtils.getPoppinsMedium(color: Colors.black.withOpacity(0.5), fontSize: 13),
                  overflow: TextOverflow.clip, // Clip the text if it overflows
                  maxLines: 3, // Set the maximum number of lines
                ),
              ),
            ],),


            const Spacer(),

             Text("${TextConstants.rupeesSign} ${transactions[index].value}",style: TextUtils.getPoppinsSemiBold(
                 color: transactions[index].transactionType == 1 ? Colors.red : Colors.green, fontSize: 15),),

          ],),);
      });
    }


    return  Scaffold(backgroundColor: Colors.white,
      appBar: CustomAppBar(
      title: TextConstants.homepage,
      leftIcon: "${AssetUtils.commonIconPath}app.png",
      rightIcon: "${AssetUtils.commonIconPath}bell.png",
      onLeftPressed: () {
        // Handle left icon pressed
        // Navigator.of(context).pop();
      },
      onRightPressed: () {
        // Handle right icon pressed
        // For example, navigate to search screen
        //Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchScreen()));
      },
    ),
      body:  SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 20,),

        const BalanceCard(),
        
        const SizedBox(height: 20,),
        
        
        transactionList()
        
            ],),
      ),);
  }
}
