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
  String lessCharacterPassword(){
    return 'Your Password should be only 4 characters';
  }

}

// deposit()2 { // for deposit into one's account in one's bank
//   // function to help in money deposits
//   if ((amount is num) && (amount > 0)) { /// IF INPUT IS A +VE NUMBER
//     print("\nPlease wait while we compare the cash with your input");
//     balance = amount + balance; // add amount to the previous balance
//     print("You deposited N$amount and your current balance is $balance");
//     print("Press 1 for further transaction or any key to exit");
//
//   }
//   //print("Welcome, please drop your cash on the tray and input the amount you want to deposit");
//   else { /// IF INPUT AMOUNT IS A -VE VALUE
//     try { // Taking care of exceptions - non number inputs
//       amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
//
//
//       for (int i = 0; i <= 2; i++) { //allow this error for only three times
//         print("Zeros and Negative inputs not allowed");
//         print("Input a positive value");
//         amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
//         //select_Transaction();
//         if(amount is num && amount > 0) { /// under the error condition loop, if a +ve entry is entered, eventually
//           balance = amount + balance;
//           print("You deposited N$amount and your current balance is $balance");
//           break;
//
//         } else { /// under the error condition, if a +ve entry is entered,
//           if(i == 1){
//             print("one more entry-time left");
//           }
//           //deposit();
//           if (i == 2) {
//             print("bye");
//             break;
//           }
//         }
//       }
//     }
//     //return select_Transaction(); /// when the correct input is entered, this happens
//     catch(e) { ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE
//
//       for (int i = 0; i <= 2; i++) { //another loop under the catch condition
//         print("Please input only +ve numbers to go to Main Menu");
//         try{ //taking care of exceptions again
//           amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
//
//           if (amount > 0) { /// IF A +VE AMOUNT IS EVENTUALLY ENTERED IN THE CATCH CONDITION/LOOP
//             select_Transaction(); // go to the main menu
//             break; // break out of this loop
//           } else{   /// if a -ve value is ENTERED IN THE CATCH CONDITION/LOOP
//             if (i == 1) { // for the last chance that remains in this -ve condition loop
//               print("Last Chance...");
//             }
//             print("Negative numbers not permitted. Input +ve value");
//           }
//         } catch(e) {
//           if (i == 1) {
//             print("Last Chance..."); // for the last chance that remains in this -ve condition loop
//           }
//           print("Error!!!");
//         }
//       }
//     }
//   }
// }
//
//
//
// deposit() { // for deposit into one's account in one's bank
//   // function to help in money deposits
//   print("Welcome, please drop your cash on the tray and input the amount you want to deposit");
//   try { // Taking care of exceptions - non number inputs
//     amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
//
//     if ((amount is num) && (amount > 0)) { /// IF INPUT IS A +VE NUMBER
//       print("\nPlease wait while we compare the cash with your input");
//       balance = amount + balance; // add amount to the previous balance
//       print("You deposited N$amount and your current balance is $balance");
//       print("Press 1 for further transaction or any key to exit");
//
//     } else { /// IF INPUT AMOUNT IS A -VE VALUE
//       for (int i = 0; i <= 2; i++) { //allow this error for only three times
//         print("Zeros and Negative inputs not allowed");
//         print("Input a positive value");
//         amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
//         //select_Transaction();
//         if(amount is num && amount > 0) { /// under the error condition loop, if a +ve entry is entered, eventually
//           balance = amount + balance;
//           print("You deposited N$amount and your current balance is $balance");
//           break;
//
//         } else { /// under the error condition, if a +ve entry is entered,
//           if(i == 1){
//             print("one more entry-time left");
//           }
//           //deposit();
//           if (i == 2) {
//             print("bye");
//             break;
//           }
//         }
//       }
//     }
//     return select_Transaction(); /// when the correct input is entered, this happens
//   } catch(e) { ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE
//
//     for (int i = 0; i <= 2; i++) { //another loop under the catch condition
//       print("Please input only +ve numbers to go to Main Menu");
//       try{ //taking care of exceptions again
//         amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
//
//         if (amount > 0) { /// IF A +VE AMOUNT IS EVENTUALLY ENTERED IN THE CATCH CONDITION/LOOP
//           select_Transaction(); // go to the main menu
//           break; // break out of this loop
//         } else{   /// if a -ve value is ENTERED IN THE CATCH CONDITION/LOOP
//           if (i == 1) { // for the last chance that remains in this -ve condition loop
//             print("Last Chance...");
//           }
//           print("Negative numbers not permitted. Input +ve value");
//         }
//       } catch(e) {
//         if (i == 1) {
//           print("Last Chance..."); // for the last chance that remains in this -ve condition loop
//         }
//         print("Error!!!");
//       }
//     }
//   }
// }

//
// `    I need help on how to print the value of balance especially with a print statement (check the codes              with the IMP tag by the comments and an explanation behind the EXCEPTION ERROR. THANKS
//
// QuickTeller quickTeller = QuickTeller();
// Customer customer = Customer();
// double amount = 489; // being the deposit amount
//
//
// void main(List<String> arguments) {
// print('Welcome Customer.'); // message to welcome customer
// Customer().deposit(); //to print balance (OUTPUT => 529.0)
// customer.checkBalance(); // print value of balance in checkBalance() func
// quickTeller.bills(); //
// }
//
// class Customer { //creating a class
// double balance = 40; // being the balance
// deposit() {
// balance = amount + balance; // (OUTPUT => 529.0)
// print("Your balance is $balance");
// }
//
// checkBalance() {
// print("Dear Client balance is $balance"); // (OUTPUT => 40.0) @ Main
// print("Welcome Client, your balance is " + deposit().balance); // (OUTPUT => 529.0) - IMP
// }
// }
//
//
// class QuickTeller {
// bills() {
// print( customer.deposit().balance ); // (NO OUTPUT) - IMP
// }
// }
//
//
//
// /*EXCEPTION MESSAGE
//     Unhandled exception:
//     NoSuchMethodError: The getter 'balance' was called on null.
//     Receiver: null
//     Tried calling: balance
//     #0      Object.noSuchMethod (dart:core-patch/object_patch.dart:63:5)
//     #1      Customer.checkBalance (file:///home/jdoodle.dart:26:60)
//     #2      main (file:///home/jdoodle.dart:12:14)
//     #3      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:281:32)
//     #4      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:184:12)
//     Command exited with non-zero status 255 */
// `