import 'package:bloc/bloc.dart';

class CalcCubit extends Cubit<int> {
  CalcCubit() : super(0);
  void increment() async {
    emit(state + 1);
  }
}
