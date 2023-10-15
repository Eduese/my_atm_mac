//This program mimicks the Automatic Teller Machine (ATM) in Nigeria

/* the following functions mimicks the different services
    available on the ATM machine:
    1. SELECT TRANSACTION. 2. DEPOSIT; 3. WITHDRAW; 4. TRANSFER;
    5. OPEN ACCOUNT, 6. CHECK BALANCE,
    7. SET PIN.
    4. QUICKTELLER SERVICES - TRANSFER, RECHARGE PHONE,  PAY BILLS (dstv, phedc,...),

 * */

import 'package:my_atm_mac/my_atm_mac.dart' as my_atm_mac;
import 'dart:io';
import 'exception_errors.dart';

void main(List<String> arguments) {
  print('Welcome Customer. Please select the number based on the service you need'); // message to welcome customer
  Customer().select_Transaction() ; //creating the Customer class object without first initialising it

}

exception_errors exceptionErrors = exception_errors();


class Customer { // creating a class with a typical SERVICES needed by a customer
    double balance = 0; //customer balance initialised to zero with an increment hope
    late int option; // options for the SERVICES to be offered by the bank
    late double amount; // being the deposit, withdraw, transfer, ...amount. The late keyword means it'll be used LATER
    late int accountNumber; // account number of the Customer
    late int phoneNumber; // phone number of the Customer
    int pin = 3456; // the default pin for this project
    //late bool isString = true;

  /* 1. SELECT TRANSACTION. 2. DEPOSIT; 3. WITHDRAW; 4. TRANSFER;
  5. OPEN ACCOUNT, 6. CHECK BALANCE,
  7. SET PIN.
  4. QUICKTELLER SERVICES - TRANSFER, RECHARGE PHONE,  PAY BILLS (dstv, phedc,...),**/

    select_Transaction() {
      //function to select the TRANSACTION TYPE a customer wants to perform
      print("Welcome. Please type in one of the options below to select your transaction "
          "1: DEPOSIT; 2: WITHDRAWAL; 3:TRANSFER 4: QUICKTELLER; 5: CHANGE PIN"
          "\n6:7:8:"
          "0 to QUIT all transactions"
          "Any other character will terminate the program instantly");
      try {
      option = int.parse(stdin.readLineSync()!); // customer inputs the digit wrt service needed

          if ((option is int) && (option.isNegative == false)) { // condition to accept only positive integers
            switch (option) {  // the SWITCH statement used to offer us options to choose

              case 1: //
                print('You selected a DEPOSIT transaction service ');
                deposit(); //calling the deposit() function

              case 2:
                print('You selected a WITHDRAWAL transaction service ');
                return withdraw(); // return to the withdraw() function

              case 3:
                print('You selected a TRANSFER transaction service ');
                print(
                    'Press 1 for Quickteller Transfer, Press 2 for Main transfer');
                return select_Transfer(); // return to the selec_Transfer() function

              case 4:
                print('You selected a DEPOSIT-2 transaction service ');
                return deposit2(); // return to the quickteller() function

              case 5:
                print('You selected a CHANGE-PIN transaction service ');
                deposit3();

              case 0:
                print('Thank you for banking with us');

              // default:
              //   return;
            }

          } else {
              print("The input is wrong");
            return checkPositiveIntegerInputs();
          }
        } catch(e) {
          print("Bad input, goodbye");
          //return deposit();
        }
    }


    deposit3() {
      // for deposit into one's account in one's bank
      // function to help in money deposits

      amount = double.parse(
          stdin.readLineSync()!); // to get the amount to be deposited
      if ((amount is num) && (amount > 0)) {
        /// IF INPUT IS A +VE NUMBER
        print("\nPlease wait while we compare the cash with your input");
        balance = amount + balance; // add amount to the previous balance
        print("You deposited N$amount and your current balance is $balance");
        print("Press 1 for further transaction or any key to exit");
        select_Transaction(); //break;
      } else {

      for (int i = 0; i <= 2; i++) {
        print("You selected DEPOSIT-3 method. Please input the amount you want to deposit");
        try { // Taking care of exceptions - non number inputs

          amount = double.parse(
              stdin.readLineSync()!); // to get the amount to be deposited

          if ((amount is num) && (amount > 0)) {
            /// IF INPUT IS A +VE NUMBER
            print("\nPlease wait while we compare the cash with your input");
            balance = amount + balance; // add amount to the previous balance
            print(
                "You deposited N$amount and your current balance is $balance");
            print("Press 1 for further transaction or any key to exit");
            break;
          } else {
            /// IF INPUT AMOUNT IS A -VE VALUE
            //for (int i = 0; i <= 2; i++) { //allow this error for only three times

            print("Wrong input, please input a +ve amount");

            /// under the error condition, if a +ve entry is entered,
            print({"Negative numbers not needed"});
            if (i == 1) {
              print("one more entry-time left");
            }
            //deposit();
            if (i == 2) {
              print("You exhausted your -ve input limit, bye");
              return;
            }

            /// when the correct input is entered, this happens
          }
        } catch (e) {
          ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

          if (i == 1) {
            print(
                "One Chance left..."); // for the last chance that remains in this -ve condition loop
          }
          print("Error!!! Non numbers not allowed");
          if (i == 2) {
            print(
                "You exhausted your input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
            return;
          }
        }
      }
      select_Transaction();
    }
      //
}



    deposit2() { // for deposit into one's account in one's bank
      // function to help in money deposits
      print("Welcome, please drop your cash on the tray and input the amount you want to deposit");
      try { // Taking care of exceptions - non number inputs
        amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

        if ((amount is num) && (amount > 0)) { /// IF INPUT IS A +VE NUMBER
          print("\nPlease wait while we compare the cash with your input");
          balance = amount + balance; // add amount to the previous balance
          print("You deposited N$amount and your current balance is $balance");
          print("Press 1 for further transaction or any key to exit");

        } else { /// IF INPUT AMOUNT IS A -VE VALUE
          for (int i = 0; i <= 2; i++) { //allow this error for only three times
            print("Zeros and Negative inputs not allowed");
            print("Input a positive value");
            amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
            //select_Transaction();
            if(amount is num && amount > 0) { /// under the error condition loop, if a +ve entry is entered, eventually
              balance = amount + balance;
              print("You deposited N$amount and your current balance is $balance");
              break;

            } else { /// under the error condition, if a +ve entry is entered,
              if(i == 1){
                print("one more entry-time left");
              }
              //deposit();
              if (i == 2) {
                print("You exhausted your -ve input limit, bye");
                return;
              }
            }
          }
        }
        return select_Transaction(); /// when the correct input is entered, this happens
      } catch(e) { ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

        for (int i = 0; i <= 2; i++) { //another loop under the catch condition
          print("Wrong input. Press any +ve numbers to go to Main Menu");
          try{ //taking care of exceptions again
            option = int.parse(stdin.readLineSync()!); // to get the amount to be deposited

            if (option > 0) { /// IF A +VE AMOUNT IS EVENTUALLY ENTERED IN THE CATCH CONDITION/LOOP
              select_Transaction(); // go to the main menu
              break; // break out of this loop
            } else{   /// if a -ve value is ENTERED IN THE CATCH CONDITION/LOOP
              if (i == 1) { // for the last chance that remains in this -ve condition loop
                print("Last Chance...");
              }
              print("Negative numbers not permitted. Input +ve value");
            }
          } catch(e) {
            if (i == 1) {
              print("One Chance left..."); // for the last chance that remains in this -ve condition loop
            }
            print("Error!!! Non numbers not allowed");
            if (i == 2) {
              print("You exhausted your input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
            }
          }
        }
      }
    }

    deposit() { // for deposit into one's account in one's bank
      // function to help in money deposits
      print("Welcome, please drop your cash on the tray and input the amount you want to deposit");
      try { // Taking care of exceptions - non number inputs
        amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

        if ((amount is num) && (amount > 0)) { /// IF INPUT IS A +VE NUMBER
          print("\nPlease wait while we compare the cash with your input");
          balance = amount + balance; // add amount to the previous balance
          print("You deposited N$amount and your current balance is $balance");
          print("Press 1 for further transaction or any key to exit");

        } else { /// IF INPUT AMOUNT IS A -VE VALUE
          for (int i = 0; i <= 2; i++) { //allow this error for only three times
            print("Zeros and Negative inputs not allowed");
            print("Input a positive value");
            amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
            //select_Transaction();
            if(amount is num && amount > 0) { /// under the error condition loop, if a +ve entry is entered, eventually
              balance = amount + balance;
              print("You deposited N$amount and your current balance is $balance");
              break;

            } else { /// under the error condition, if a +ve entry is entered,
              if(i == 1){
                print("one more entry-time left");
              }
              //deposit();
              if (i == 2) {
                print("bye");
                break;
              }
            }
          }
        }
        return select_Transaction(); /// when the correct input is entered, this happens
      } catch(e) { ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

        for (int i = 0; i <= 2; i++) { //another loop under the catch condition
          print("Please input only +ve numbers to go to Main Menu");
          try{ //taking care of exceptions again
            amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

            if (amount > 0) { /// IF A +VE AMOUNT IS EVENTUALLY ENTERED IN THE CATCH CONDITION/LOOP
              select_Transaction(); // go to the main menu
              break; // break out of this loop
            } else{   /// if a -ve value is ENTERED IN THE CATCH CONDITION/LOOP
              if (i == 1) { // for the last chance that remains in this -ve condition loop
                print("Last Chance...");
              }
              print("Negative numbers not permitted. Input +ve value");
            }
          } catch(e) {
            if (i == 1) {
              print("Last Chance..."); // for the last chance that remains in this -ve condition loop
            }
            print("Error!!!");
          }
        }
      }
    }


    checkPositiveIntegerInputs(){
      for(int k = 0; k <= 2; k++) {
        print("Please input the correct code");
        option = int.parse(stdin.readLineSync()!);
        if(k == 1){print("Only one input chance is left for you");}
        if (option > 0) {
          break;
        } else if (option < 0) {
          print("That is a wrong input");
        } else {
          print("Do you understand english at all? Goodbye");
          break;
        }
      }
    }

    

    furtherTransaction(){
      print("Press 1 for further transaction \nPress any key to exit all transactions");
      option = int.parse(stdin.readLineSync()!);
      switch(option) {
        case 1:
          select_Transaction();
        default:
          print("\nThank you for banking with us. \n Goodbye!");
          return;
      }

    }

    withdraw() {
      // function to help in withdrawing
      print("Please input amount you want to withdraw");
      amount = double.parse(stdin.readLineSync()!);
        if ((amount > 0) && (amount < balance)) {
          withdrawing();
        }
        else {
          confirm_balance();
      }
        return;
    }

    withdrawing() {
      balance = balance - amount;
      print("You have withdrawn N$amount. Your balance is $balance");
      print("\nThank you for banking with us");
      furtherTransaction();
      //exit;
    }

    confirm_balance() { // code to check if balance == 0, -ve or other characters before any transaction
      print('Wrong input. You have 3 attempts left (confirm balance)');
        for (int i = 1; i <= 3; i++) {
          //create class  for error messages
          try {
            amount = double.parse(stdin.readLineSync()!);
            if (amount <= 0 || amount > balance) {
              //try/catch here
              print("You cannot input $amount as a withdrawal amount");
              if(amount > balance) {
                print("Input amount N$amount is greater than your balance of $balance");
              }

              //throw FormatException ('Negative values are not allowed');
              if (i == 1) {
                print("\nPlease input a valid amount");
              }

              if (i == 2) {
                print('You have only a chance left!'
                    '\nPlease input a correct amount');
              }
              if (i == 3) {
                print("Sorry! You have exceeded your input limit"
                    "\n");
              }
            } else {

              withdrawing();
              break;
            }

           } catch (e) {
            print ("Non number are not permitted here!");
            //return;
           }
      }
        //return amount;
      select_Transaction();
    }

    checkBalance() {
      print("Welcome, your balance is $balance");
    }

    setPin() {

    }

    quickteller() {

    }

    select_Transfer()  { // code to transfer money
      print('Press 1 for interbank transfer or 2 for intra-bank transfer '); //a message of direction
      int transferType_code = int.parse(stdin.readLineSync()!); //here we take an input to select transfer type

      if(transferType_code == 1) {

      }
      else if(transferType_code == 2) {

      }
      else {
        select_Transaction();
      }

    }

}
