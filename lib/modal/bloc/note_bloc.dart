


import 'package:flutter_bloc/flutter_bloc.dart';

import '../note_modal.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {

  NoteBloc() : super(NoteInitialState()) {
    on<NoteEvent>((event, emit) {
      emit(NoteLoadingState());




    });
  }

}
