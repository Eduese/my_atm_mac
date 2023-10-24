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

exception_errors exceptionErrors = exception_errors();
QuickTeller quickTeller = QuickTeller();
double balance = 20000 ; //customer balance initialised to zero with an increment hope
//late int newPin;

void main(List<String> arguments) {
  print('Welcome Customer. Please select the number based on the service you need'); // message to welcome customer
  Customer().inputPin() ; //creating the Customer class object without first initialising it
}


class Customer { // creating a class with a typical SERVICES needed by a customer
    //double balance = 0 ; //customer balance initialised to zero with an increment hope
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

    inputPin() {
      for(int i = 0; i <= 2; i++) {
        try {
          print("Please enter the correct PIN");
          pin = int.parse(stdin.readLineSync()!);
            if(pin == 3456) {
                select_Transaction();
            } else {
              if(i == 1) {
                print("One chance left. Are you sure this is your card? ");
              }
              if(i == 2) {
                print("Your card is blocked. Visit your bank for rectification. Goodbye.");
                return; // used to terminate the loop to avoid printing below message
              }
            }
          
        } catch (e) {
              if(i == 1) {
                print("Chai... I fear you.  ");
              }
              if(i == 2) {
                print("Your card is blocked. Visit your bank for rectification. Goodbye.");
                return; // used to terminate the loop to avoid printing below message
              }
            }
      }
    }

    select_Transaction() {
      //function to select the TRANSACTION TYPE a customer wants to perform
      print("Welcome. Please type in one of the options below to select your transaction \n"
          "1: DEPOSIT; 2: WITHDRAWAL; 3: BALANCE; 4: CHECK; TRANSFER; \n"
          "5: QUICKTELLER - Recharge; txfer; ; DSTV; STARTIMES; GOTV; WATER BILL; POWER BILL\n"
          "6: CHANGE PIN; 7:8:"
          "0 to QUIT all transactions"
          "Any other character will terminate the program instantly");
      for(int i = 0; i <= 2; i++) {
        try {
         option = int.parse(stdin.readLineSync()!);

          if ((option is int) && (option.isNegative == false)) { // condition to accept only positive integers
            switch (option) {  // the SWITCH statement used to offer us options to choose

              case 1: //
                print('You selected a DEPOSIT transaction service ');
                return deposit(); //calling the deposit() function

              case 2:
                print('You selected a WITHDRAWAL transaction service ');
                return withdraw(); // return to the withdraw() function

              case 3:
                print('You selected an option to check your BALANCE ');
                return checkBalance();

              case 4:
                print('You selected a TRANSFER transaction service ');
                print('Press 1 for Quickteller Transfer, Press 2 for Main transfer');
                return select_Transfer(); // return to the selec_Transfer() function

              case 5:
                print('You selected a QUICKTELLER transaction service ');
                return quickTeller.airtimeRecharge() ;
                //return furtherTransaction();

              case 6:
                print('You selected a CHANGE-PIN transaction service ');
                  return quickTeller.subscriptionType();

              case 7:
                print('You are on CHECK-BALANCE transaction service ');
                  return checkBalance();

              default:
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

                ///this code is for variety sake
                ///we can do without the INPUT and the IF-ELSE statement
                ///by making the user input OPTIONS 1 to 9 under SELECT TRANSACTION
                ///as shown in the CATCH for loop that follows immediately after this IF-ELSE option
                //option = int.parse(stdin.readLineSync()!);
                // if(option > 0) {
                //   select_Transaction();
                // } else {
                //   i++;
                // }
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
      print("You selected a DEPOSIT method. Please input the amount you want to deposit");

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
            //select_Transaction();
        }

    checkPositiveIntegerInputs(){
      for(int k = 0; k <= 2; k++) {
        print("Please input the correct code");
        option = int.parse(stdin.readLineSync()!);
        if(k == 1){ print("Only one input chance is left for you");}
        if (option > 0) {
          return select_Transaction();
        } else if (option < 0) {
          print("That is a wrong input");
        } else {
          print("Do you understand english at all? Goodbye");
          break;
        }
      }
    }

    

    furtherTransaction() {
      print("Press 1 for further transaction \nPress any key to exit all transactions");
      //for (int v = 0; v <= 2; v++) {
        try {
          option = int.parse(stdin.readLineSync()!);
          if (option == 1) {
            select_Transaction();
          } else {
            print("Thank you for banking with us. Goodbye!");
            //return;
          }
        } catch (e) {
          print("Thank you for banking with us. Have a nice day!");
          //return;
        }
      ///} ///FOR TE FOR-LOOP
    }

    withdraw() {
      // function to help in withdrawing
      print("Please enter the amount to withdraw");
      for (int i = 0; i <= 2; i++) {
        //print("Please enter a +ve number as amount");
        try { // Taking care of exceptions - non number inputs
          amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited

          if ((amount < balance) && (amount > 0)) {  /// IF INPUT IS A +VE NUMBER

            print("\nPlease wait while we compare the cash with your input");
            balance = balance - amount; // add amount to the previous balance
            print("You withdrew N$amount and your current balance is $balance");
            print("Press 1 for further transaction or any key to exit");
            break;
          } else {  /// IF INPUT AMOUNT IS A -VE VALUE
            if(amount > balance){
              print("Your entry amount of N$amount is greater than your balance of N$balance");
              }
            if(amount < 0){
              print("Your entry amount of $amount Naira is negative");
              print("Please enter a +ve number as amount");
            }
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

    confirmBalance() { // code to check if balance == 0, -ve or other characters before any transaction
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
      print("Welcome Customer, your balance is $balance");
      print(quickTeller.balance2);

      //furtherTransaction();
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
