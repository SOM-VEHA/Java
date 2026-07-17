// class AuthNotifier extends StateNotifier<AsyncValue<void>> {
//
//   final AuthRepository authRepository;
//
//   AuthNotifier(this.authRepository) : super(const AsyncData(null));
//
//   Future<void> login(String email, String password) async {
//     state = const AsyncLoading();
//     try {
//       final response = await authRepository.login(
//         email: email,
//         password: password,
//       );
//       print(response.user?.email);
//       state = const AsyncData(null);
//     } on AuthException catch (e) {
//       state = AsyncError(e.message, StackTrace.current);
//     } catch (e) {
//       state = AsyncError(e.toString(), StackTrace.current);
//     }
//   }
//
//   Future<void> register(String username, String email, String password) async {
//     print("username : $username");
//     print("email :  $email");
//     print("password : $password");
//     state = const AsyncLoading();
//     try {
//       final response = await authRepository.register(
//         username: username,
//         email: email,
//         password: password,
//       );
//       print("REGISTER SUCCESS: ${response.user?.email}");
//       state = const AsyncData(null);
//     } on AuthException catch (e, st) {
//       print("AUTH ERROR: ${e.message}");
//       state = AsyncError(e.message, st);
//     } catch (e, st) {
//       print("UNKNOWN ERROR: $e");
//       state = AsyncError(e, st);
//     }
//   }
//
//   Future<void> logout() async {
//     state = const AsyncLoading();
//     try {
//       await authRepository.logout();
//       state = const AsyncData(null);
//     } catch (e) {
//       state = AsyncError(e.toString(), StackTrace.current);
//     }
//   }
// }

