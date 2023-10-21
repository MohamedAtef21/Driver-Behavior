
import 'package:flutter/material.dart';

void navigateTo (context,page,[bool LeavePage=true]){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:  (context) => page,), (route) => LeavePage);
  // Navigator.pushAndRemoveUntil(context, page, (LeavePage));
  // Navigator.push(context,MaterialPageRoute(builder: (context)=> page));
}