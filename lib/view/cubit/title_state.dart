part of 'title_cubit.dart';

@immutable
abstract class TitleState {}

class TitleInitial extends TitleState {}

class TitleLoading extends TitleState {}

class TitleSuccess extends TitleState {}

class TitleError extends TitleState {}