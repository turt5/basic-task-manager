import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager/features/welcome/model/_task_model.dart';

final taskProivder = ChangeNotifierProvider<TaskModel>((ref) => TaskModel());
