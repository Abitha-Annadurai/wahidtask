import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wahidtask/services.dart';
import 'package:wahidtask/user_model.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
} );