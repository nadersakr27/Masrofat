

  import 'package:email_validator/email_validator.dart';

String? passwordvaildatorfun(text) {
                  if (text == null || text.isEmpty) {
                    return "Please enter password";
                  }
                  if (text.length <= 5) {
                    return "Too Weak Password !";
                  } else if (text.length > 20) {
                    return "Too Long Password !";
                  }
                  return null;
                }
String? emailvaildatorfun (text) {
                    if (text == null || text.isEmpty) {
                      return "Please enter e-mail";
                    }
                    if (!EmailValidator.validate(text)) {
                      return "Unvailed Email";
                    }
                    return null;
                  }
  
