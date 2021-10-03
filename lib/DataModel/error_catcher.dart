class ErrorCatcher{
  static String error = "";

  static void setError(String inError){
    error = inError;
  }
  static void clearError(){
    error = "";
  }

  static String  getError(){
    if(error.isNotEmpty){
      return error;
    }
    return "No errors.";
  }
}