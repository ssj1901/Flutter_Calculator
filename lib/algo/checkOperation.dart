import 'package:flutter/material.dart';
bool check_Operator(String s){
  if(s=='C' || s== '⌫' ||s=='%'||s=='/'||s=='x'||s=='-'||s=='+'||s=='='){
    return true;
  }
  else{
    return false;
  }
}