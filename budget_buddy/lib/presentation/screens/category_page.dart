import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:budget_buddy/utils/textConstants.dart';
import 'package:flutter/material.dart';

import '../../utils/textStyleUtils.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {


  final List<String> shortTitles = [
    "Food",
    "Transport",
    "Utilities",
    "Housing",
    "Entertainment",
    "Dining Out",
    "Health",
    "Education",
    "Clothing",
    "Personal Care",
    "Insurance",
    "Debt",
    "Taxes",
    "Gifts",
    "Travel",
    "Pet Care",
    "Home Repairs",
    "Subscriptions",
    "Childcare",
    "Miscellaneous",
  ];

  final List<IconData> icons = [
    Icons.fastfood,
    Icons.directions_car,
    Icons.flash_on,
    Icons.home,
    Icons.theaters,
    Icons.restaurant,
    Icons.healing,
    Icons.school,
    Icons.shopping_bag,
    Icons.spa,
    Icons.security,
    Icons.credit_card,
    Icons.attach_money,
    Icons.card_giftcard,
    Icons.flight,
    Icons.pets,
    Icons.build,
    Icons.subscriptions,
    Icons.child_friendly,
    Icons.category,
  ];

  final List<String> expenseTitles = [
    "Food",
    "Transport",
    "Utilities",
    "Housing",
    "Entertainment",
    "Dining Out",
    "Health",
    "Education",
    "Clothing",
    "Personal Care",
    "Insurance",
    "Debt",
    "Taxes",
    "Gifts",
    "Travel",
    "Pet Care",
    "Home Repairs",
    "Subscriptions",
    "Childcare",
    "Miscellaneous",
  ];

  final List<IconData> expenseIcons = [
    Icons.fastfood,
    Icons.directions_car,
    Icons.flash_on,
    Icons.home,
    Icons.theaters,
    Icons.restaurant,
    Icons.healing,
    Icons.school,
    Icons.shopping_bag,
    Icons.spa,
    Icons.security,
    Icons.credit_card,
    Icons.attach_money,
    Icons.card_giftcard,
    Icons.flight,
    Icons.pets,
    Icons.build,
    Icons.subscriptions,
    Icons.child_friendly,
    Icons.category,
  ];

  Widget categoryImageList(List categoryList, List iconsList){
    return ListView.builder(
      itemCount: 10,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context,index) {
      return Padding(padding: EdgeInsets.only(bottom: 15),child: Row(mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(height: 40,width: 40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
              color: ColorUtils.getCategoryColor(index)),
          child: Center(child: Icon(iconsList[index]),),),

          SizedBox(width: 15,),

          Text(categoryList[index],style: TextUtils.getPoppinsMedium(color: Colors.black,fontSize: 14),),

          Spacer(),

          Icon(Icons.more_horiz,size: 18,)
        ],));
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.white,
    appBar: AppBar(backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(TextConstants.category, style: TextUtils.getPoppinsBold(fontSize: 20.0, color: Colors.black),),),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 30,left: 15,right: 15),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TextConstants.incomeCategories, style: TextUtils.getPoppinsSemiBold(fontSize: 15.0, color: Colors.black),),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 25,),
          categoryImageList(shortTitles, icons),
      
          SizedBox(height: 20,),
          Text(TextConstants.expenseCategories, style: TextUtils.getPoppinsSemiBold(fontSize: 15.0, color: Colors.black),),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 25,),
          categoryImageList(expenseTitles, expenseIcons),
        ],),
      ),
    ),);
  }
}
