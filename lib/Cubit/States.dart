abstract class AllStates {

}
class Initial extends AllStates{

}
class Loading extends AllStates{

}
class Loaded extends AllStates{

}
class ErrorState extends AllStates{
  late String e;
  ErrorState({required this.e});
}