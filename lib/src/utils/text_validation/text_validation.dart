class Validate {
  static String? empty(String value, [String? message]) {
    if (value.trim().isEmpty) {
      return message ?? "Field cannot be empty";
    } else {
      return null;
    }
  }

  static String? compareAccountNumber(String value1, String value2) {
    if (value1.isEmpty || value2.isEmpty) {
      return "Field cannot be empty";
    }
    else if(value1 != value2){
      return "Account number does not match.";
    }
    else {
      return null;
    }
  }

  static String? minLength(
      {required String value, required int minLen, String? message}) {
    if (value.trim().length < minLen) {
      return message ?? "field must be larger than $minLen character.";
    } else {
      return null;
    }
  }

  static String? maxLength(
      {required String value, required int maxLen, String? message}) {
    if (value.length > maxLen) {
      return message ?? "field must not be larger than $maxLen character.";
    } else {
      return null;
    }
  }

  static String? range(
      {required String value,
        required int maxLen,
        required int minLen,
        String? messageLess,
        String? messageMore}) {
    if (value.trim().length < minLen) {
      return messageLess ?? "field must be at least $minLen character.";
    } else if (value.length > maxLen) {
      return messageMore ?? "field must not be larger than $maxLen character.";
    } else {
      return null;
    }
  }

  static String? phone(String value) {
    final nob = int.tryParse(value);
    if (nob != null) {
      if (value.length == 10) {
        return null;
      } else {
        return 'Mobile no. must be of 10 digit.';
      }
    } else {
      return 'Not a Valid mobile no.';
    }
  }


  static String? emptyNum(String value) {
    final nob = int.tryParse(value);
    if (nob != null) {
      if (value.trim().isNotEmpty) {
        return null;
      } else {
        return 'Not a valid format.';
      }
    } else {
      return 'Field cannot be empty.';
    }
  }


  static String? number(String value, int length) {
    final nob = int.tryParse(value);
    if (nob != null) {
      if (value.length == length) {
        return null;
      } else {
        return 'Must be of $length digit.';
      }
    } else {
      return 'Not a Valid Format.';
    }
  }

  static String? email(String value) {
    final bool isValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value.trim());
    if (isValid) {
      return null;
    } else {
      return 'Please enter a valid email';
    }
  }

  static String? youtubeLink(String value, [String? message]) {
    final String? url = empty(value);
    if (url == null) {
      final bool isValid = RegExp(
          r'^((?:https?:)?\/\/)?((?:www|m)\.)?((?:youtube\.com|youtu.be))(\/(?:[\w\-]+\?v=|embed\/|v\/)?)([\w\-]+)(\S+)?')
          .hasMatch(value.trim());
      if (isValid) {
        return null;
      } else {
        return message ?? 'Please enter a valid youtube url';
      }
    } else {
      return url;
    }
  }

  static String? validateURL(String value, [String? message]) {
    final String? url = empty(value);
    if (url == null) {
      final bool isValid = RegExp(
          r'^(.*?)((https?:\/\/)?(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,4}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*))')
          .hasMatch(value.trim());
      if (isValid) {
        return null;
      } else {
        return message ?? 'Please enter a valid url';
      }
    } else {
      return url;
    }
  }

  static String? find(String value) {
    final String? mail = empty(value);
    if (mail == null) {
      if (value.contains("@")) {
        return email(value);
      } else {
        return phone(value);
      }
    } else {
      return mail;
    }
  }
}
