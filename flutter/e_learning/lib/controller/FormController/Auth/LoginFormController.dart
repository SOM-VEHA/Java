import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFormController {

  final loginFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

}

final loginFormProvider = Provider.autoDispose<LoginFormController>((ref) {
  final form = LoginFormController();
  ref.onDispose(form.dispose);
  return form;
});