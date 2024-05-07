import 'package:intl/intl.dart';

class DateFormatters {


  static DateFormat yy_mm_dd__HH_mm_ss_S = DateFormat("yyyy-MM-dd HH:mm:ss.S");
  static DateFormat mmmm_d_yyyy = DateFormat("MMMM d, yyyy");

  static String changeDateFormat(DateFormat inputFormat, DateFormat outputFormat, String dateString){
    DateTime parsedDate = inputFormat.parse(dateString);
    String formattedDate = outputFormat.format(parsedDate);
    return formattedDate;
  }


  static String currentDate(){
    DateTime currentDate = DateTime.now();
    String formattedDate = yy_mm_dd__HH_mm_ss_S.format(currentDate);
    return formattedDate;
  }
}