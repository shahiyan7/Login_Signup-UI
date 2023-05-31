class Validator{
 static String? validateEmail(String value) {
  // Regular expression pattern for email validation
  final pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$';
  
  // Create a RegExp object with the pattern
  final regExp = RegExp(pattern);
  
  if (value.isEmpty) {
    return 'Please enter an email address';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter a valid email address';
  }
  
  // Return null if the email is valid
  return null;
}


 static String? validatePassword(String value) {
  if (value.isEmpty) {
    return 'Please enter a password';
  } else if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  } else if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least 1 uppercase letter';
  } else if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Password must contain at least 1 special character';
  }
  
  // Return null if the password is valid
  return null;
}

}