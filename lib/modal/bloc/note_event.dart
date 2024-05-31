part of 'note_bloc.dart';


abstract class NoteEvent {}

class adduserinCfirebase extends NoteEvent{
  String title;
  String desc;
  adduserinCfirebase({required this.title,required this.desc});
}