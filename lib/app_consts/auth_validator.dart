class AuthValidator
{
  static String? displayNameValidator(String?displayName){
    if(displayName == null || displayName.isEmpty){
      return 'This field can not be empty';
    }
    if(displayName.length<3 || displayName.length>20){
      return 'This field must be between 3 and 20 characters';
    }
    return null;
  }

  static String? emailValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter your email';
    }
    if(!RegExp(r'\b[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[A-Z|a-z]{2,}\b').hasMatch(value)){
      return 'please enter valid email';
    }
    return null;
  }
  static String? passWordValidator(String?value){
    if(value!.isEmpty){
      return 'Please enter your password';
    }
    if(value.length<6){
      return 'password is too short';
    }
    return null;
  }

  static String? repeatPassWordValidator(String?value,String?password){
    if(value != password){
      return 'password not match';
    }
    return null;
  }

}