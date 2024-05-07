import 'package:budget_buddy/utils/colorUtils.dart';
import 'package:budget_buddy/utils/dateFormatters.dart';
import 'package:budget_buddy/utils/textConstants.dart';
import 'package:flutter/material.dart';

import '../../utils/textStyleUtils.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({super.key});

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {


  bool isExpense = true;

   String _selectedDate = DateFormatters.currentDate();

   String selectedCategory = "";

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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(TextConstants.addTransaction, style: TextUtils.getPoppinsBold(fontSize: 20.0, color: Colors.black),),),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 30,left: 15,right: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpense = true;
                      });
                    },
                    child: Container(width: (MediaQuery.of(context).size.width - 45) / 2,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: isExpense ? ColorUtils.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          TextConstants.expense,
                          style: TextUtils.getPoppinsSemiBold(
                            color: !isExpense ? Colors.black : Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpense = false;
                      });
                    },
                    child: Container(width: (MediaQuery.of(context).size.width - 45) / 2,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: !isExpense ? ColorUtils.primaryColor : Colors.white,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          TextConstants.income,
                          style: TextUtils.getPoppinsSemiBold(
                            color: isExpense ? Colors.black : Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40,),

              Text(TextConstants.amount,style: TextUtils.getPoppinsRegular(fontSize: 16,color: Colors.black),),
              SizedBox(height: 13,),
              Container(height: 70,width: MediaQuery.of(context).size.width - 30,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(TextConstants.rupeesSign,style: TextUtils.getPoppinsBold(color: Colors.black,fontSize: 25),),

                SizedBox(width: 20,),

                SizedBox(height: 40,width: MediaQuery.of(context).size.width - 90,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'eg: 1000',
                      hintStyle: TextUtils.getPoppinsRegular(fontSize: 15,color: Colors.grey)
                    ),
                  ),
                ),
              ],),),

              SizedBox(height: 20,),

              Text(TextConstants.description,style: TextUtils.getPoppinsRegular(fontSize: 16,color: Colors.black),),
              SizedBox(height: 13,),
              Container(height: 70,width: MediaQuery.of(context).size.width - 30,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,width: MediaQuery.of(context).size.width - 90,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your description',
                            hintStyle: TextUtils.getPoppinsRegular(fontSize: 15,color: Colors.grey)
                        ),
                      ),
                    ),
                  ],),),
              SizedBox(height: 13,),


              Text(TextConstants.date,style: TextUtils.getPoppinsRegular(fontSize: 16,color: Colors.black),),
              SizedBox(height: 13,),
              Container(padding: EdgeInsets.symmetric(vertical: 9,horizontal: 12),
                height: 40,width: MediaQuery.of(context).size.width - 30,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8)),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(DateFormatters.changeDateFormat(DateFormatters.yy_mm_dd__HH_mm_ss_S, DateFormatters.mmmm_d_yyyy, _selectedDate.toString()),style: TextUtils.getPoppinsRegular(color: Colors.black, fontSize: 15),),
                Spacer(),
                GestureDetector(child: Icon(Icons.calendar_month),onTap: (){
                  _selectDate(context);
                },)

              ],),),
              SizedBox(height: 40,),



              Text(TextConstants.categories,style: TextUtils.getPoppinsRegular(fontSize: 16,color: Colors.black),),
              SizedBox(height: 20,),

              SizedBox(height: 30,
                    child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemBuilder: (context,index) {
            return GestureDetector(onTap: (){
              setState(() {
                selectedCategory = expenseTitles[index];
              });
            },
              child: Container(margin: EdgeInsets.only(right: 8),
                padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                height: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black),
                color: selectedCategory == expenseTitles[index] ? ColorUtils.primaryColor : Colors.white),
                child: Center(
                child: Text(expenseTitles[index],style: TextUtils.getPoppinsRegular(color: selectedCategory != expenseTitles[index] ? Colors.black : Colors.white,
                fontSize: 13),),
              ),),
            );
                    }),
              ),

              SizedBox(height: 50,),

              Container(decoration: BoxDecoration(color: ColorUtils.primaryColor,borderRadius: BorderRadius.circular(8)),
                height: 40,child: Center(child: Text(TextConstants.save,style: TextUtils.getPoppinsSemiBold(color: Colors.white,fontSize: 16),),),),

              SizedBox(height: 80,),
            ],),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked.toString();
      });
    }
  }
}
