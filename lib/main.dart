import 'package:btcare/btcare.dart';
import 'package:btcare/core/helper/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const BtCare()); 
}
