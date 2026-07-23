import 'package:e_learning/controller/SearchController.dart';
import 'package:e_learning/controller/state/SearchState/SearchState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final searchProvider = NotifierProvider<SearchController, SearchState>(SearchController.new);