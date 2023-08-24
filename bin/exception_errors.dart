class exception_errors implements Exception {
  String negativeValuesErrorMessage() { // error message for -ve inputs
    return 'Negative values are not permitted';
  }
  String characterInputErrorMessage(){
    return 'Alphabets and other characters are not permitted, only numbers';
  }
  String nonIntegerErrors(){ //error message for double instead of integers inputs
    return 'Decimal numbers not permitted; Only positive whole numbers';
  }

}