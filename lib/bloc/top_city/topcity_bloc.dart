import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:zk_weather/model/top_citys/top_citys.dart';
import 'package:zk_weather/utils/network/api.dart';

part 'topcity_event.dart';
part 'topcity_state.dart';

class TopcityBloc extends Bloc<TopcityEvent, TopcityState> {
  TopcityBloc() : super(TopcityInitial()) {
    on<TopcityEvent>(_onTopcityLoad);
  }

  FutureOr<void> _onTopcityLoad(
      TopcityEvent event, Emitter<TopcityState> emit) async {
    EasyLoading.show();
    var json = await Api.topCitys();
    TopCitysModel model = TopCitysModel.fromJson(json);
    state.model = model;
    emit(TopcityLoadedState(model: state.model));
    EasyLoading.dismiss();
  }
}
