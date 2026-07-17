// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../provider/AuthProvider.dart';
// import 'hh.dart';
// class AuthScreen extends ConsumerStatefulWidget  {
//   final VoidCallback onSuccess;
//   final bool isDarkMode;
//   const AuthScreen({
//     super.key,
//     required this.onSuccess,
//     required this.isDarkMode,
//   });
//   @override
//   ConsumerState<AuthScreen> createState() => _AuthScreenState();
// }
// class _AuthScreenState extends ConsumerState<AuthScreen> {
//   bool isLogin = true;
//   String name = '';
//   String email = 'student@aura.edu';
//   String password = '••••••••';
//   bool showPassword = false;
//   String error = '';
//   void login()async {
//    await ref.read(authProvider.notifier).login(
//       email.trim(),
//       password.trim(),
//     );
//   }
//   void register()async {
//     await ref.read(authProvider.notifier).register(
//       name.trim(),
//       email.trim(),
//       password.trim(),
//     );
//   }
//   void _handleSubmit() {
//     if(isLogin==true){
//       print("login");
//       login();
//     }else{
//       print("register");
//       register();
//     }
//
//
//     // print(isLogin);
//     // print('object');
//     // Navigator.push(
//     //   context,
//     //   MaterialPageRoute(builder: (context) => HomeDashboard(onSelectCourse: (String p1) {  }, onResumeLesson: (String p1) {  }, isDarkMode: false,)),
//     // );
//
//
//
//     // if (email.isEmpty || password.isEmpty || (!isLogin && name.isEmpty)) {
//     //   setState(() => error = 'Please fill in all fields');
//     //   return;
//     // }
//     // setState(() => error = '');
//     // widget.onSuccess();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final isDark = widget.isDarkMode;
//     final bgColor = isDark ? const Color(0xFF0A0A0A) : const Color(0xFFF8FAFC);
//     final textColor = isDark ? Colors.white : Colors.black87;
//     final mutedColor = isDark ? Colors.grey[400]! : Colors.grey[600]!;
//     final authState = ref.watch(authProvider);
//     return Scaffold(
//       backgroundColor: bgColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             children: [
//               // Header
//               Column(
//                 children: [
//                   const SizedBox(height: 32),
//                   Container(
//                     height: 48,
//                     width: 48,
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
//                         begin: Alignment.topLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                       borderRadius: BorderRadius.circular(12),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.blue.withOpacity(0.2),
//                           blurRadius: 12,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: const Icon(
//                       Icons.menu_book_rounded,
//                       color: Colors.white,
//                       size: 28,
//                     ),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     isLogin ? 'Welcome Back' : 'Create Account',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: textColor,
//                       letterSpacing: -0.5,
//                     ),
//                   ),
//                   const SizedBox(height: 6),
//                   Text(
//                     isLogin
//                         ? 'Sign in to resume your learning tracks'
//                         : 'Start your journey across 50+ premium subjects',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: mutedColor,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 32),
//               // Toggle Tab
//               Container(
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: isDark ? const Color(0xFF1F1F1F) : Colors.grey[200],
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: _buildTabButton('Sign In', true),
//                     ),
//                     Expanded(
//                       child: _buildTabButton('Sign Up', false),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 32),
//               // Form
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (error.isNotEmpty)
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.red.withOpacity(0.1),
//                         border: Border.all(color: Colors.red.withOpacity(0.3)),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Text(
//                         error,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(color: Colors.red, fontSize: 13),
//                       ),
//                     ),
//                   const SizedBox(height: 16),
//                   // Name Field (Sign Up only)
//                   if (!isLogin) ...[
//                     _buildLabel('Full Name'),
//                     _buildTextField(
//                       hint: 'Alex Johnson',
//                       icon: Icons.person_outline,
//                       value: name,
//                       onChanged: (val) => setState(() => name = val),
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                   // Email Field
//                   _buildLabel('Email Address'),
//                   _buildTextField(
//                     hint: 'alex@example.com',
//                     icon: Icons.email_outlined,
//                     value: email,
//                     onChanged: (val) => setState(() => email = val),
//                     keyboardType: TextInputType.emailAddress,
//                   ),
//                   const SizedBox(height: 20),
//                   // Password Field
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildLabel('Password'),
//                       if (isLogin)
//                         GestureDetector(
//                           onTap: () {}, // Forgot password
//                           child: Text(
//                             'Forgot Password?',
//                             style: TextStyle(
//                               fontSize: 13,
//                               color: Colors.blue[600],
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                     ],
//                   ),
//                   _buildPasswordField(),
//                   const SizedBox(height: 28),
//                   // Submit Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 56,
//                     child: ElevatedButton(
//                       onPressed: _handleSubmit,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.transparent,
//                         padding: EdgeInsets.zero,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                       ).copyWith(
//                         backgroundColor: MaterialStateProperty.all(Colors.transparent),
//                       ),
//                       child: Ink(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
//                           ),
//                           borderRadius: BorderRadius.circular(16),
//                         ),
//                         child: Container(
//                           alignment: Alignment.center,
//                           child: Text(
//                             isLogin ? 'Sign In' : 'Create Account',
//                             style: const TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   // Divider
//                   Row(
//                     children: [
//                       Expanded(child: Divider(color: isDark ? Colors.grey[800] : Colors.grey[300])),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           'OR CONTINUE WITH',
//                           style: TextStyle(
//                             fontSize: 11,
//                             letterSpacing: 1.5,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.grey,
//                           ),
//                         ),
//                       ),
//                       Expanded(child: Divider(color: isDark ? Colors.grey[800] : Colors.grey[300])),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   // Social Buttons
//                   Row(
//                     children: [
//                       Expanded(child: _socialButton('Google', Icons.g_mobiledata, Colors.white)),
//                       const SizedBox(width: 12),
//                       Expanded(child: _socialButton('Apple', Icons.apple, Colors.white)),
//                     ],
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 40),
//               // Terms
//               Text(
//                 "By continuing, you agree to AuraLearn's Terms of Service and Privacy Policy.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 11,
//                   color: mutedColor,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildTabButton(String text, bool isLoginTab) {
//     final isActive = isLoginTab == isLogin;
//     final isDark = widget.isDarkMode;
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isLogin = isLoginTab;
//           error = '';
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 14),
//         decoration: BoxDecoration(
//           color: isActive
//               ? (isDark ? const Color(0xFF262626) : Colors.white)
//               : Colors.transparent,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: isActive && !isDark
//               ? [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.05),
//               blurRadius: 6,
//               offset: const Offset(0, 2),
//             )
//           ]
//               : null,
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: isActive ? (isDark ? Colors.white : Colors.black87) : Colors.grey,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildLabel(String text) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 4, bottom: 8),
//       child: Text(
//         text.toUpperCase(),
//         style: TextStyle(
//           fontSize: 11,
//           fontWeight: FontWeight.w600,
//           letterSpacing: 0.5,
//           color: widget.isDarkMode ? Colors.grey[400] : Colors.grey[700],
//         ),
//       ),
//     );
//   }
//   Widget _buildTextField({
//     required String hint,
//     required IconData icon,
//     required String value,
//     required Function(String) onChanged,
//     TextInputType keyboardType = TextInputType.text,
//   }) {
//     final isDark = widget.isDarkMode;
//     return TextField(
//       controller: TextEditingController(text: value)..selection = TextSelection.fromPosition(
//         TextPosition(offset: value.length),
//       ),
//       onChanged: onChanged,
//       keyboardType: keyboardType,
//       style: TextStyle(color: isDark ? Colors.white : Colors.black87),
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, size: 20, color: Colors.grey),
//         hintText: hint,
//         hintStyle: TextStyle(color: Colors.grey[500]),
//         filled: true,
//         fillColor: isDark ? const Color(0xFF171717) : Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 18),
//       ),
//     );
//   }
//   Widget _buildPasswordField() {
//     final isDark = widget.isDarkMode;
//     return TextField(
//       controller: TextEditingController(text: password)..selection = TextSelection.fromPosition(
//         TextPosition(offset: password.length),
//       ),
//       onChanged: (val) => setState(() => password = val),
//       obscureText: !showPassword,
//       style: TextStyle(color: isDark ? Colors.white : Colors.black87),
//       decoration: InputDecoration(
//         prefixIcon: const Icon(Icons.lock_outline, size: 20, color: Colors.grey),
//         suffixIcon: IconButton(
//           icon: Icon(
//             showPassword ? Icons.visibility_off : Icons.visibility,
//             color: Colors.grey,
//           ),
//           onPressed: () => setState(() => showPassword = !showPassword),
//         ),
//         hintText: '••••••••',
//         hintStyle: TextStyle(color: Colors.grey[500]),
//         filled: true,
//         fillColor: isDark ? const Color(0xFF171717) : Colors.white,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: BorderSide(color: isDark ? Colors.grey[800]! : Colors.grey[300]!),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
//         ),
//         contentPadding: const EdgeInsets.symmetric(vertical: 18),
//       ),
//     );
//   }
//   Widget _socialButton(String label, IconData icon, Color color) {
//     final isDark = widget.isDarkMode;
//     return GestureDetector(
//       onTap: widget.onSuccess,
//       child: Container(
//         height: 52,
//         decoration: BoxDecoration(
//           color: isDark ? const Color(0xFF1F1F1F) : Colors.white,
//           borderRadius: BorderRadius.circular(16),
//           border: Border.all(
//             color: isDark ? Colors.grey[800]! : Colors.grey[300]!,
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon, size: 22, color: label == 'Apple' ? Colors.black : null),
//             const SizedBox(width: 10),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w600,
//                 color: isDark ? Colors.white : Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }