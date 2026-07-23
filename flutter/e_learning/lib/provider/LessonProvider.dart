import 'package:e_learning/controller/LessonController/LessonDetailController.dart';
import 'package:e_learning/controller/LessonController/LessonListController.dart';
import 'package:e_learning/controller/state/LessonState/LessonDetailState.dart';
import 'package:e_learning/controller/state/LessonState/LessonListState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final lessonListProvider = NotifierProvider<LessonListController, LessonListState>(LessonListController.new);
final lessonDetailProvider = NotifierProvider<LessonDetailController, LessonDetailState>(LessonDetailController.new);
