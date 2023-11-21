//This program mimicks the Automatic Teller Machine (ATM) in Nigeria

/* the following functions mimicks the different services
    available on the ATM machine:
    1. SELECT TRANSACTION. 2. DEPOSIT; 3. WITHDRAW; 4. TRANSFER;
    5. OPEN ACCOUNT, 6. CHECK BALANCE,
    7. SET PIN.
    4. QUICKTELLER SERVICES - TRANSFER, RECHARGE PHONE,  PAY BILLS (dstv, phedc,...),

 * */

import 'dart:ffi';
import 'dart:io'; // //importing the dart.io class
import 'exception_errors.dart'; //importing class ExceptionError thru its file_name
import 'quick_teller.dart'; //importing class QuickTeller thru its file_name

ExceptionErrors exceptionErrors = ExceptionErrors(); // the ExceptionError class object
QuickTeller quickTeller = QuickTeller(); // the QuickTeller class object
double balance = 20000 ; //customer balance initialised as a var with an increment hope


void main(List<String> arguments) { // main function where all codes are executed
  print("Welcome Customer. Please enter your PIN to begin"); // message to welcome customer
  //return customer.inputPin() ; // creating the Customer class object without first initialising it
  return customer.select_Transaction();
}

class Customer { // creating a class for 'all' SERVICES needed by customer
    late int option; // options help customer to select the SERVICES needed
    late double amount; // being the deposit, withdraw, transfer, ...amount. The late keyword means it'll be used LATER
    late int accountNumber; // account number of the Customer
    late int phoneNumber; // phone number of the Customer
    int pin = 3456; // the default pin for this project
    late String recipient;


    inputPin() { // code to enter PIN to gain access to all services
      for(int i = 0; i <= 2; i++) { // iterate three times in case of errors
        try { // taking care of exceptions like non-integers during entry
          print("Please enter the correct PIN (3456)"); // prompt for PIN entry
          pin = int.parse(stdin.readLineSync()!); // code to get PIN entry

            if(pin == 3456) { // checking if PIN is correct
                return select_Transaction(); // goto select_transaction method() if correct
            } else {
              if(i == 1) { // 2nd iteration prompt in case of errors
                print("One chance left. Are you sure this is your card? ");
              }
              if(i == 2) { // last iteration prompt in case of error
                print("Your card is blocked. Visit your bank for rectification. Bye.");
                return; // used to terminate the loop after 3 failed attempts
              }
            }
        } catch (e) { // for non-integer exception
              if(i == 1) { //2nd iteration prompt in case of exception
                print("Chai... I fear you.  ");
              }
              if(i == 2) { // last iteration prompt in case of exception
                print("Card is blocked. Visit your bank for rectification. Goodbye.");
                return; // used to terminate the loop to avoid printing below message
              }
            }
      }
    }

    select_Transaction() { //function to select the TRANSACTION TYPE a customer wants to perform
      print("Welcome. Please type in one of the options below to select your transaction \n"
          "1: DEPOSIT; 2: WITHDRAWAL; 3: BALANCE; 4: TRANSFER; \n"
          "5: QUICKTELLER - Recharge; txfer; ; DSTV; STARTIMES; GOTV; WATER BILL; POWER BILL\n"
          "6: CHANGE PIN; 7:8:"
          "0 or any other character to QUIT all transactions");
      for(int i = 0; i <= 2; i++) { // iterate three times in case of errors
        try {
         option = int.parse(stdin.readLineSync()!);

          if ((option is int) && (option.isNegative == false)) { // condition to accept only positive integers
            switch (option) {  // the SWITCH statement used to offer us options to choose

              case 1:
                return deposit(); //calling the deposit() function

              case 2:
                return withdraw(); // return to the withdraw() function

              case 3:
                print('You selected an option to check your BALANCE ');
                return checkBalance();

              case 4:
                print('You selected a TRANSFER transaction service ');
                return select_Transfer(); // return to the select_Transfer() function

              case 5:
                print('You selected a QUICKTELLER transaction service ');
                return quickTeller.qServices() ;

              case 6:
                print('You selected a CHANGE-PIN transaction service ');
                  return changePin();

              case 7:
                print('You are on CHECK-BALANCE transaction service ');
                  return checkBalance();

              default:
                print('Thank you for choosing to bank with us');
                return;
            }

          } else {

                if(i == 1) {
                     print("Only one last chance left for (-ve input) ");
                   }
                if(i == 2) {
                     print("You exhausted your -ve entry limit. Goodbye.");
                     return; // used to terminate the loop to avoid printing below message
                   }
                print("\n-Negative inputs not allowed. \n"
                    "\nPress any of the options 1 to 9 above to select your transaction ");

                }
          } catch (e) {

          if(i == 1) {
            print("You have only one chance for non-number entries");
          }
          if(i == 2) {
            print("You exhausted your 'xter' entry limit. Goodbye.");
            return; // used to terminate the loop to avoid printing below message
          }
          print("Please enter only INTEGERS 1 to 9 that corresponds to your transaction");
        }
      }
    }


    deposit() {
      // for money deposit into one's account in one's bank
      print("Input the amount you want to deposit");

      for (int i = 0; i <= 2; i++) { //
        print("Please enter a +ve number as amount");
        try { // Taking care of exceptions - non number inputs
                amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

                if ((amount is num) && (amount > 0)) {  /// IF INPUT IS A +VE NUMBER

                  print("\nPlease wait while we compare the cash with your input");
                  balance = amount + balance; // add amount to the previous balance
                  print("You deposited N$amount and your current balance is $balance");
                  break;
                } else {  /// IF INPUT AMOUNT IS A -VE VALUE

                  //print({"Negative numbers not needed."});
                  if (i == 1) {
                    print("Onez more entry-time left");
                  }
                  if (i == 2) {
                    print("You exhausted your -ve input limit, bye");
                    return;
                  }
                }
              } catch (e) {  ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

                  if (i == 1) {
                    print(
                        "One Chance left..."); // for the last chance that remains in this -ve condition loop
                  }
                  print("Error!!! Non numbers not allowed");
                  if (i == 2) {
                    print(
                        "You exhausted your char input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
                    return;
                  }
                }
              }
            return furtherTransaction();
            //select_Transaction();
        }


    furtherTransaction() {
      print("Press 1 for further transaction or any key to exit");
        try {
          option = int.parse(stdin.readLineSync()!);
          if (option == 1) {
            select_Transaction();
          } else {
            print("Thank you for banking with us. Goodbye!");
          }
        } catch (e) {
          print("Thank you for banking with us. Have a nice day!");
        }
       ///FOR THE FOR-LOOP
    }

    withdraw() {
      // function to help in withdrawing
      print("Please enter the amount to withdraw");
      for (int i = 0; i <= 2; i++) {
        print("Please enter a +ve number as amount");
        try {                                             // Taking care of exceptions - non number inputs
          amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

          if ((amount < balance) && (amount > 0)) {  /// IF INPUT IS A +VE NUMBER
            balance = balance - amount;                 // add amount to the previous balance
            print("You withdrew N$amount and your current balance is $balance\n");
            break;
          } else {                                   /// IF INPUT AMOUNT IS A -VE VALUE
            if(amount > balance){
              print("Your entry amount of N$amount is greater than your balance of N$balance");
              }

            if(amount <= 0){
              print("You cannot withdraw a zero or -ve $amount Naira");
            }
            if (i == 1) {
              print("You have one entry-time left");
            }
            if (i == 2) {
              print("You exhausted your -ve input limit, bye");
              return;
            }
          }
        } catch (e) {  ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

          if (i == 1) {
            print("One Chance left..."); // for the last chance that remains in this -ve condition loop
          }
          print("Error!!! Non numbers not allowed");
          if (i == 2) {
            print("You exhausted your input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
            return;
          }
        }
      }
       return furtherTransaction();
    }



    checkBalance() {
      print("Welcome Customer, your balance is $balance");
      furtherTransaction();
    }

    changePin() {

    }


    select_Transfer()  { // code to transfer money
      print('Press 1 for Quickteller (or InterBank) Transfer, Press 2 for Intra-bank transfer');  //a message of direction
      for (int i = 0; i <= 2; i++) {
        print("Please press button 1 or 2 ");
        try { // Taking care of exceptions - non number inputs
          option = int.parse(stdin.readLineSync()!); // to get the amount to be deposited

          if ((option is int) && (option.isNegative == false)) { // condition to accept only positive integers
            switch (option) { // the SWITCH statement used to offer us options to choose

              case 1:
                return quickTeller.transfer(); //calling the deposit() function

              case 2:
                return mainTransfer(); // return to the withdraw() function

              default:
                if(i == 2){print('Wrong selection,. Goodbye.');}
              }
           } else {
            if (i == 1) {
              print("One Chance left..."); // for the last chance that remains in this -ve condition loop
            }
            if(i == 2) {
              print("Entry limit exceeded. Goodbye");
            }
          }

        } catch (e) {
          ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

          if (i == 1) {
            print("One Chance left..."); // for the last chance that remains in this -ve condition loop
          }
          print("Error!!! Non numbers not allowed");
          if (i == 2) {
            print(
                "You exhausted your char input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
            return;
            }
          }
        }
    }

    mainTransfer() {
      for(int i = 1; i <= 2; i++) {
        print("Please enter the recipient's correct account number");
        try {
            accountNumber = int.parse(stdin.readLineSync()!); // to get the recipient account number
            if (accountNumber > 0) {
              break;
            } else {
            print("Account number shouldn't be negative");
            if(i == 2){
              print("You exhausted your input limit. Odahbor");
              return;
            }
          }
        } catch (e) {
          print("Bad boy. You wan hack!!!");
          //furtherTransaction();
        }
      }
      print("Please input recipient's name");
      recipient = (stdin.readLineSync()!);
      print("Please enter the amount to transfer");
      for (int i = 0; i <= 2; i++) {
        print("Please enter a +ve number as amount");
        try {                                             // Taking care of exceptions - non number inputs
          amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

          if ((amount < balance) && (amount > 0)) {  /// IF INPUT IS A +VE NUMBER
            balance = balance - amount;                 // add amount to the previous balance
            print("You transferred N$amount to $recipient with $accountNumber as account number"
                " and your current balance is $balance\n");
            break;
          } else {                                  /// IF INPUT AMOUNT IS A -VE VALUE
            if(amount > balance){
              print("Transfer amount of N$amount is greater than your balance of N$balance");
            }
            if(amount <= 0){
              print("You cannot transfer a zero or -ve $amount Naira");
            }
            if (i == 1) {
              print("You have one entry-time left");
            }
            if (i == 2) {
              print("You exhausted your -ve input limit, bye");
              return;
            }
          }
        } catch (e) {  ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

          if (i == 1) {
            print("One Chance left..."); // for the last chance that remains in this -ve condition loop
          }
          print("Error!!! Non numbers not allowed");
          if (i == 2) {
            print("You exhausted your input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
            return;
          }
        }
      }
      return furtherTransaction();
    }

    checkNumericInput() {
      for(int i = 1; i <= 2; i++) {
        print("Please enter the recipient's correct account number");
        try {
          accountNumber = int.parse(stdin.readLineSync()!); // to get the recipient account number
          if (accountNumber > 0) {
            break;
          } else {
            print("Account number shouldn't be negative");
            if(i == 2){
              print("You exhausted your input limit. Odahbor");
              return;
            }
          }
        } catch (e) {
          print("Bad boy. You wan hack!!!");
          //furtherTransaction();
        }
      }
      //print("Please input recipient's name");
      //recipient = (stdin.readLineSync()!);
      //print("Please enter the amount to transfer");
      // for (int i = 0; i <= 2; i++) {
      //   print("Please enter a +ve number as amount");
      //   try {                                             // Taking care of exceptions - non number inputs
      //     amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
      //
      //     if ((amount < balance) && (amount > 0)) {  /// IF INPUT IS A +VE NUMBER
      //       balance = balance - amount;                 // add amount to the previous balance
      //       print("You transferred N$amount to $recipient with $accountNumber as account number"
      //           " and your current balance is $balance\n");
      //       break;
      //     } else {                                  /// IF INPUT AMOUNT IS A -VE VALUE
      //       if(amount > balance){
      //         print("Transfer amount of N$amount is greater than your balance of N$balance");
      //       }
      //       if(amount <= 0){
      //         print("You cannot transfer a zero or -ve $amount Naira");
      //       }
      //       if (i == 1) {
      //         print("You have one entry-time left");
      //       }
      //       if (i == 2) {
      //         print("You exhausted your -ve input limit, bye");
      //         return;
      //       }
      //     }
      //   } catch (e) {  ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE
      //
      //     if (i == 1) {
      //       print("One Chance left..."); // for the last chance that remains in this -ve condition loop
      //     }
      //     print("Error!!! Non numbers not allowed");
      //     if (i == 2) {
      //       print("You exhausted your input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
      //       return;
      //     }
      //   }
      // }
    }

}
