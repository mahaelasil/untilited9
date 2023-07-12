import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'colors_states.dart';

class ColorsCubit extends Cubit<ColorsState> {
  ColorsCubit() : super(ColorsInitialState());

  static ColorsCubit get(context) => BlocProvider.of<ColorsCubit>(context);

  List<Color> colors = [
    Colors.cyan,
    Colors.cyanAccent,
    Colors.red,
    Colors.purple,
    Colors.orange,
  ];

  late Color backgroundColor = colors.first;
  void changeBackgroundToSelected(int index){
    backgroundColor=colors[index];
    emit(ColorsSelectedState());
  }
}