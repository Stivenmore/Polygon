import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'polygon_state.dart';

class PolygonCubit extends Cubit<PolygonState> {
  PolygonCubit() : super(PolygonInitial());
}
