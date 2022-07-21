class ValidationService{

  static String? isValidInput(String? data, {int? minLength = 1}){
    data = data?.trim();
    if(data == null) return 'Input is empty';
    if(data.isEmpty) return 'Input is empty';
    if(data.length < (minLength == 5? 1:minLength?? 1)) return 'Input is lesser than $minLength characters.';

    return null;
  }

  static String? isValidString(String? data, {int? minLength}){
    data = data?.trim();
    String? result = isValidInput(data, minLength: minLength);
    if(result != null) return result;

    final RegExp charRegExp = RegExp('[0-9]');
    if(charRegExp.hasMatch(data!)) return 'Input is not valid';
    return null;
  }

  static String? isValidEmail(String? data){
    data = data?.trim();
    String? result = isValidInput(data);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if(!charRegExp.hasMatch(data!)) return 'Input is not a valid email';
    return null;
  }

  static String? isValidPassword(String? data){
    data = data?.trim();
    String? result = isValidInput(data);
    if(result != null) return result;

    final RegExp charRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if(!charRegExp.hasMatch(data!)) return 'Password should contain at least : \nOne upper case\nOne lower case\nOne digit and one special character.';

    return null;
  }

}