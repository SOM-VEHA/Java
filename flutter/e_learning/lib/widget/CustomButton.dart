// import 'package:flutter/material.dart';
//
// class CustomButton extends StatelessWidget {
//   final String text;
//   final VoidCallback onPressed;
//
//   const CustomButton({
//     super.key,
//     required this.text,
//     required this.onPressed,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 50,
//       child: ElevatedButton(
//         onPressed: onPressed,
//         style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: isLoading
            ? const
        // SizedBox(
        //         width: 22,
        //         height: 22,
        //         child: CircularProgressIndicator(
        //           strokeWidth: 2.5,
        //           color: Colors.white,
        //         ),
        //       )
        SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
            : Text(text, style: const TextStyle(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
