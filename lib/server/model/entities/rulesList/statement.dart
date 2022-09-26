import 'package:medical_dialogue_system/server/model/functions/mfs/mfInterface.dart';

abstract class Statement {
  late IMembershipFunction __term;

  Statement(IMembershipFunction term) {
    __term = term;
  }

  IMembershipFunction get getTerm => __term;
}