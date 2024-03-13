import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:whipapp/models/whip_model.dart';

part 'whip_event.dart';
part 'whip_state.dart';

class WhipBloc extends Bloc<WhipEvent, WhipState> {
  WhipBloc() : super(WhipInitial()) {
    on<LoadWhipSelector>((event, emit) {
      emit(WhipLoaded(whip_selected: Whip.whips[0]));
    });
    on<SelectWhip>((event, emit) {
      if(state is WhipLoaded){
        emit(
          WhipLoaded(whip_selected: event.whip)
        );
      }
    });
  }
}
