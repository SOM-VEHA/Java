class FormAuthState {
  final bool isLoggedIn;
  final bool isLoading;
  final bool rememberMe;
  final bool obscurePassword;
  final bool isRegisterLoading;
  final bool registerObscurePassword;
  final bool isGoogleLoading;
  const FormAuthState({
    this.isLoggedIn = false,
    this.isLoading = false,
    this.isRegisterLoading = false,
    this.isGoogleLoading = false,
    this.obscurePassword = true,
    this.registerObscurePassword=true,
    this.rememberMe = true,
  });
  FormAuthState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    bool? obscurePassword,
    bool? registerObscurePassword,
    bool? rememberMe,
    bool? isLoginLoading,
    bool? isRegisterLoading,
    bool? isGoogleLoading,
  }) {
    return FormAuthState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoading,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      registerObscurePassword:registerObscurePassword ?? this.registerObscurePassword,
      rememberMe: rememberMe ?? this.rememberMe,
      isRegisterLoading: isRegisterLoading ?? this.isRegisterLoading,
      isGoogleLoading: isGoogleLoading ?? this.isGoogleLoading,
    );
  }
}