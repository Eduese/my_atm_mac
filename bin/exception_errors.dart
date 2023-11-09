class ExceptionErrors implements Exception {
  String negativeValuesErrorMessage() { // error message for -ve inputs
    return 'Negative values are not permitted';
  }
  String characterInputErrorMessage(){
    return 'Alphabets and other characters are not permitted, only numbers';
  }
  String nonIntegerErrors(){ //error message for double instead of integers inputs
    return 'Decimal numbers not permitted; Only positive whole numbers';
  }
  String lessCharacterPassword(){
    return 'Your Password should be only 4 characters';
  }

}

// checkPositiveIntegerInputs(){
//   for(int k = 0; k <= 2; k++) {
//     print("Please input the correct code");
//     option = int.parse(stdin.readLineSync()!);
//     if(k == 1){ print("Only one input chance is left for you");}
//     if (option > 0) {
//       return select_Transaction();
//     } else if (option < 0) {
//       print("That is a wrong input");
//     } else {
//       print("Do you understand english at all? Goodbye");
//       break;
//       break;
//     }
//   }
//   }
// }


// confirmBalance() { // code to check if balance == 0, -ve or other characters before any transaction
//   print('Wrong input. You have 3 attempts left (confirm balance)');
//   for (int i = 1; i <= 3; i++) {
//     //create class  for error messages
//     try {
//       amount = double.parse(stdin.readLineSync()!);
//       if (amount <= 0 || amount > balance) {
//         //try/catch here
//         print("You cannot input $amount as a withdrawal amount");
//         if(amount > balance) {
//           print("Input amount N$amount is greater than your balance of $balance");
//         }
//
//         //throw FormatException ('Negative values are not allowed');
//         if (i == 1) {
//           print("\nPlease input a valid amount");
//         }
//
//         if (i == 2) {
//           print('You have only a chance left!'
//               '\nPlease input a correct amount');
//         }
//         if (i == 3) {
//           print("Sorry! You have exceeded your input limit"
//               "\n");
//         }
//       } else {
//         break;
//       }
//     } catch (e) {
//       print ("Non number are not permitted here!");
//       //return;
//     }
//   }
//   //return amount;
//   select_Transaction();
// }


// checkPositiveIntegerInputs(){
//   for(int k = 0; k <= 2; k++) {
//     print("Please input the correct code");
//     option = int.parse(stdin.readLineSync()!);
//     if(k == 1){ print("Only one input chance is left for you");}
//     if (option > 0) {
//       return select_Transaction();
//     } else if (option < 0) {
//       print("That is a wrong input");
//     } else {
//       print("Do you understand english at all? Goodbye");
//       break;
//     }
//   }
// }

// confirmBalance() { // code to check if balance == 0, -ve or other characters before any transaction
//   print('Wrong input. You have 3 attempts left (confirm balance)');
//   for (int i = 1; i <= 3; i++) {
//     //create class  for error messages
//     try {
//       amount = double.parse(stdin.readLineSync()!);
//       if (amount <= 0 || amount > balance) {
//         //try/catch here
//         print("You cannot input $amount as a withdrawal amount");
//         if(amount > balance) {
//           print("Input amount N$amount is greater than your balance of $balance");
//         }
//
//         //throw FormatException ('Negative values are not allowed');
//         if (i == 1) {
//           print("\nPlease input a valid amount");
//         }
//
//         if (i == 2) {
//           print('You have only a chance left!'
//               '\nPlease input a correct amount');
//         }
//         if (i == 3) {
//           print("Sorry! You have exceeded your input limit"
//               "\n");
//         }
//       } else {
//         break;
//       }
//     } catch (e) {
//       print ("Non number are not permitted here!");
//       //return;
//     }
//   }
//   //return amount;
//   select_Transaction();
// }