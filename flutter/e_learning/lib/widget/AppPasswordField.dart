
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppPasswordField extends StatelessWidget {
  const AppPasswordField({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    required this.obscureText,
    required this.onToggle,
    required this.icon,
  });
  final String label;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final bool obscureText;
  final VoidCallback onToggle;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: '*****',
        // prefixIcon: Icon(icon),
        filled: true,
        fillColor: Color(0xffF5F5F5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffF5F5F5)),
          borderRadius: BorderRadius.circular(14),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(
            color: Color(0xffF5F5F5), // Change from blue to grey
            width: 1.5,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            obscureText
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
        ),
      ),
    );
  }
}