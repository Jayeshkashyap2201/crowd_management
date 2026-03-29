import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../StaticVariables.dart';
import 'States.dart';

class Detail extends Cubit<AllStates> {
  Detail() : super(Initial());

  Future<void> submitDetails({
    required String name,
    required String state,
    required String number,
    required String age,
    required String gender,
  }) async {
    try {
      emit(Loading());

      final supabase = Supabase.instance.client;
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        emit(ErrorState(e: "User not logged in"));
        return;
      }

      // ✅ Get dynamic lane
      final laneRes = await supabase.rpc('get_best_lane');
      int lane = laneRes as int;

      final response = await supabase
          .from("user_detail")
          .insert({
        "user_id": user.uid,
        "name": name,
        "number": number,
        "sex": gender,
        "age": age,
        "state": state,
        "lane": lane
      }).select();

      final insertedData = response[0];

      // ✅ Store data
      StaticVariable.userID = insertedData['id'];
      StaticVariable.loggedUserName = name;
      StaticVariable.userNumber = number;
      StaticVariable.userAge = age;
      StaticVariable.userGender = gender;
      StaticVariable.state = state;

      String qrData = jsonEncode({
        "id": StaticVariable.userID,
        "lane": lane,
        "name": name,
        "phone": number,
        "age": age,
        "gender": gender,
        "state": state,
      });

      StaticVariable.qrData = qrData;

      emit(Loaded());
    } catch (e) {
      emit(ErrorState(e: e.toString()));
    }
  }
}