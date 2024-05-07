import 'package:budget_buddy/utils/textConstants.dart';
import 'package:budget_buddy/utils/textStyleUtils.dart';
import 'package:flutter/material.dart';

import '../../utils/colorUtils.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 170,width: double.infinity,decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
    color: ColorUtils.primaryColor),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Balance :",style: TextUtils.getPoppinsMedium(color: Colors.white,fontSize: 15),),
        const SizedBox(height: 4,),
        Text("${TextConstants.rupeesSign} 0",style: TextUtils.getPoppinsBold(color: Colors.white,fontSize: 23),),

        const Spacer(),

        Row(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 30,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
            color: Colors.green),
            child: const Center(child: Icon(Icons.arrow_upward,size: 18,),),),

            const SizedBox(width: 4,),

            Text("${TextConstants.rupeesSign} 0",style: TextUtils.getPoppinsMedium(color: Colors.white,fontSize: 15),),

            const Spacer(),

            Container(height: 30,width: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
                color: Colors.red),
              child: const Center(child: Icon(Icons.arrow_downward,size: 18,),),),

            const SizedBox(width: 4,),

            Text("${TextConstants.rupeesSign} 0",style: TextUtils.getPoppinsMedium(color: Colors.white,fontSize: 15),),
          ],
        )

      ],),
    ),);
  }

}
