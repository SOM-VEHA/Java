import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterFormController {

  final signupFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final usernameController = TextEditingController();

  final phoneController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

}

final registerFormProvider = Provider.autoDispose<RegisterFormController>((ref) {
  final form = RegisterFormController();
  ref.onDispose(form.dispose);
  return form;
});