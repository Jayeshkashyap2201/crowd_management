import 'package:crowd_management/Cubit/States.dart';
import 'package:crowd_management/StaticVariables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class StateData extends Cubit<AllStates>{
  StateData(): super (Initial());

  Future <void> fetching(String email , String password)async{
    emit(Loading());
    try{
      UserCredential usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      User? user = usercredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
      }
      if (usercredential.user!.emailVerified) {
        StaticVariable.loggedUserName = FirebaseAuth.instance.currentUser!.email.toString();
      }
      emit(Loaded());
    }
    catch(e){
      emit(ErrorState(e:e.toString()));
    }
  }
}