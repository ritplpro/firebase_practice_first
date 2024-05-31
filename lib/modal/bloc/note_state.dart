part of 'note_bloc.dart';


abstract class NoteState {}

 class NoteInitialState extends NoteState {}
class NoteLoadingState extends NoteState {}
class NoteLoadedState extends NoteState {
  List<NoteModal> userdata;
  NoteLoadedState({required this.userdata});
}
class NoteErrorState extends NoteState {
  String Errormsg;
  NoteErrorState({required this.Errormsg});
}

