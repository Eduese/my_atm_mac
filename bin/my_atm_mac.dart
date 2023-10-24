//This program mimicks the Automatic Teller Machine (ATM) in Nigeria

/* the following functions mimicks the different services
    available on the ATM machine:
    1. SELECT TRANSACTION. 2. DEPOSIT; 3. WITHDRAW; 4. TRANSFER;
    5. OPEN ACCOUNT, 6. CHECK BALANCE,
    7. SET PIN.
    4. QUICKTELLER SERVICES - TRANSFER, RECHARGE PHONE,  PAY BILLS (dstv, phedc,...),

 * */

import 'dart:io';
import 'exception_errors.dart';
import 'quick_teller.dart';

exception_errors exceptionErrors = exception_errors(); // object of class Exception_Errors
QuickTeller quickTeller = QuickTeller(); // object of class Quickteller
double balance = 20000 ; //customer balance initialised; it is UNIVERSAL - for other clasees usage
late int pin;  // being the PERSONAL IDENTIFICATION NUMBER of the customer

void main(List<String> arguments) {
  print("Welcome Customer"); // message to welcome customer // Please select the number based on the service you need');
  Customer().inputPin(); //creating the Customer class object without first initialising it
}

class Customer { // creating a class with a typical SERVICES needed by a customer

    late int option;  // options for the SERVICES to be offered by the bank

    late double amount; // being the deposit, withdraw, transfer, ...amount. The late keyword means it'll be used LATER
    late int accountNumber; // account number of the Customer
    late int phoneNumber; // phone number of the Customer
    //int pin = 3456; // the default pin for this project

    inputPin() { // input PIN and check correctness of PIN
      for(int i = 0; i <= 2; i++) {
        try {
          print("Please enter your 4 correct number PIN");
          pin = int.parse(stdin.readLineSync()!);
          if(pin == 3456) {
            return select_Transaction();
          }  else  {
            if(i == 1) {
            print("Only 1ne last chance left for (-ve PIN input) ");
            }
            if(i == 2) {
            print("You exhausted your -ve PIN entry limit. Goodbye.");
            return; // used to terminate the loop to avoid printing below message
            }
            print("Chai, I fear you");
          }

          } catch (e) {
            if(i == 1) {
            print("One last chance left for you ");
            }
            if(i == 2) {
            print("You exhausted your xter limit. Goodbye.");
            return; // used to terminate the loop to avoid printing below message
            }
          print("Baddest input.");
        }
      }
    }



    select_Transaction() {
      //function to select the TRANSACTION TYPE a customer wants to perform
      print("Welcome. Please type in one of the options below to select your transaction \n"
          "1: DEPOSIT; 2: WITHDRAWAL; 3: BALANCE CHECK; 4: TRANSFER; \n"
          "5: QUICKTELLER - (Recharge; Transfer; Startimes; DSTV; GoTV; Water Bill; Power Bill)\n"
          "6: CHANGE PIN; "
          "0: QUIT all transactions");
      for(int i = 0; i <= 2; i++) {
        try {
         option = int.parse(stdin.readLineSync()!);

          if ((option is int) && (option.isNegative == false)) { // condition to accept only positive integers
            switch (option) {  // the SWITCH statement used to offer us options to choose

              case 1: // DEPOSIT
                print('You selected a DEPOSIT transaction service ');
                return deposit(); //calling the deposit() function

              case 2: // WITHDRAWAL
                print('You selected a WITHDRAWAL transaction service ');
                return withdraw(); // return to the withdraw() function

              case 3: // BALANCE_CHECK
                print('You selected an option to check your BALANCE ');
                return checkBalance();

              case 4: // INTER or INTRA TRANSFERS
                print('You selected a TRANSFER transaction service ');
                print('Press 1 for Quickteller Transfer, Press 2 for Main transfer');
                return select_Transfer(); // return to the selec_Transfer() function

              case 5: // QUICKTELLER SERVICES
                print('You selected a QUICKTELLER transaction service ');
                return quickTeller.subscriptionType() ;
                //return furtherTransaction();

              case 6: // CHANGE PIN
                print('You selected a CHANGE-PIN transaction service ');
                  return setPin();

              case 7:
                print('You are on CHECK-BALANCE transaction service ');
                  return checkBalance();

              case 0:
                print('Thank you for banking with us');
                return;
            }

          } else {

                if(i == 1) {
                     print("Only 1ne last chance left for (-ve input) ");
                   }
                if(i == 2) {
                     print("You exhausted your -ve entry limit. Goodbye.");
                     return; // used to terminate the loop to avoid printing below message
                   }
                print("-Ve input not allowed. \n"
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
      // for money deposit into one's bank account 
      print("Please input the amount you want to deposit ");
      for (int i = 0; i <= 2; i++) {
        print("Please enter a +ve number as amount");
        try { // Taking care of exceptions - non number inputs
                amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

                if ((amount is num) && (amount > 0)) {  /// IF INPUT IS A +VE NUMBER

                  print("\nPlease wait while we compare the cash with your input");
                  balance = amount + balance; // add amount to the previous balance
                  print("You deposited N$amount and your current balance is $balance");
                  print("Press 1 for further transaction or any key to exit");
                  break;
                } else {  /// IF INPUT AMOUNT IS A -VE VALUE
                  //print({"Negative numbers not needed."});
                  if (i == 1) {
                    print("One more entry-time left");
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
                        "You exhausted your input limit, Goodbye..."); // for the last chance that remains in this -ve condition loop
                    return;
                  }
                }
              }
            return furtherTransaction();
        }

    end_transactions(){
      try{
        print("Do you really want to end all transactions? \n"
            "PRESS 1 if 'YES'; PRESS 2 or other input for 'NO'");
        option = int.parse(stdin.readLineSync()!);
          switch (option) {  // the SWITCH statement used to offer us options to choose

            case 1: //
              print("Hope you have a great day. Goodbye!");
              return; //calling the deposit() function

            default: //
              return furtherTransaction(); // end all transactions
            }
          } catch(e) {
          return furtherTransaction(); // end all transactions
        }
    }
    

    furtherTransaction() {
      print("Press 1 for further transaction \nPress any key to exit all transactions");
        try {
          option = int.parse(stdin.readLineSync()!);
          if (option == 1) {
            return inputPin();
          } else {
            return end_transactions();
          }
        } catch (e) {
          return end_transactions();
        }
    }

    withdraw() { // function to help customer make withdrawals
      print("Please enter the amount to withdraw. ");
      for (int i = 0; i <= 2; i++) {
        try { // Taking care of exceptions - non number inputs
          amount = double.parse(stdin.readLineSync()!); // get the amount to be deposited

          if ((amount < balance) && (amount > 0)) {  /// IF INPUT IS A +VE NUMBER AND LESS THAN BALANCE
            balance = balance - amount; // subtract amount from the previous balance
            print("You withdrew N$amount and your current balance is $balance\n");
            break;
          } else {  /// IF AMOUNT GREATER THAN BALANCE or -VE VALUE
            if(amount > balance) {
              print("Your entry of N$amount is greater than your balance of N$balance\n"
                  "Please enter an amount less than your balance");
              }
            if(amount < 0){ // if amount is less than zero
              print("Your entry amount of $amount Naira is negative \n"
              "Please enter a +ve number as amount");
            }
            if(amount == balance){ // if amount is equal to balance
              print("Your entry of N$amount is same as your balance of N$balance");
              print("Things hard, leave small change for us. Enter a lesser amount to withdraw");
            }
            if (i == 1) { //second iteration in a -ve input situauion
              print("One more entry-time left");
            }
            if (i == 2) { //third iteration in a -ve input situauion
              print("You exhausted your -ve input limit, bye");
              return;
            }
          }
        } catch (e) {  ///CATCH EXCEPTIONS FROM INPUT "AMOUNT" ABOVE

          if (i == 1) {
            print("One Chance left..."); //2nd iteration; one chance remains in this exception condition loop
          }
          print("Error!!! Non numbers not allowed");
          if (i == 2) {
            print("You exhausted your input limit, Goodbye..."); // for the last chance that remains in the exception condition loop
            return; // execution/ running ends
          }
        }
      }
       return furtherTransaction(); // from the break loop above
    }


    checkBalance() {
      print("Your balance is $balance");
      furtherTransaction();
    }

    setPin() { // to set or change transaction PINs
        for (int i = 0; i <= 2; i++) {
          try {
            print("Please enter your new 5-digit whole number as PIN");
            pin = int.parse(stdin.readLineSync()!);
            if((pin.toString().length == 5) && (pin > 0))  { //if PIN is 5 digits and PIN > 0
              print("You have your new PIN set to $pin");
              return furtherTransaction();

            } else {
              print ("Negative entry! ");
              if (i == 1) {
                print('One chance left!');
              }
              if (i == 2) {
                print("You have exceeded your input limit. Goodbye!"
                    "\n");
                return;
              }
                //print("Negative numbers not permitted");
            }
          } catch (e) { // for non integer inputs
            if (i == 1) {
              print("One chance left!");
            }
            if (i == 2) {
              print("You have exceeded your input limit. Goodbye!"
                  "\n");
              return;
            }

          }
        }
        //furtherTransaction();
    }

    // quickteller() { // check QuickTeller class
    // }

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

    billPayment() {
      if (amount < balance) {
        balance = balance - amount;
        print("You balance is $balance");
        //return balance;
      } else {
        print("Your balance is less than amount entered");

      }
    }
}
