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
          "6:7:8:"
          "0 to QUIT all transactions");
      try {
      option = int.parse(stdin.readLineSync()!); // customer inputs the digit wrt service needed

          if ((option.isNaN == false) && (option.isNegative == false)) { // condition to accept only integers
            switch (option) {

              case 1:
                print('You selected a DEPOSIT transaction service ');
                deposit(); //calling the deposit() function

              case 2:
                print('You selected a WITHDRAWAL transaction service ');
                withdraw(); //calling the withdraw() function

              case 3:
                print('You selected a TRANSFER transaction service ');
                print(
                    'Press 1 for Quickteller Transfer, Press 2 for Main transfer');
                select_Transfer(); //calling the selec_Transfer() function

              case 4:
                print('You selected a QUICKTELLER transaction service ');
                quickteller(); //calling the quickteller() function

              case 5:
                print('You selected a CHANGE-PIN transaction service ');

              case 0:
                print('Thank you for banking with us');
                //;


            }
          } else {
            print("The input is wrong");

          }
        } catch(e) {
          print('You cannot enter such a wrong input');
          //select_Transaction();

        }
      exit(option);
    }


    deposit() { // for deposit into one's account in one's bank
      // function to help in money deposits
      print("Welcome, please drop your cash on the tray and input the amount you want to deposit");
      amount = double.parse(stdin.readLineSync()!); // to get the amount to be deposited
      print("\nPlease wait while we compare the cash with your input");
      balance = amount + balance; // add amount to the previous balance
      print("You deposited N$amount and your current balance is $balance");
      print("Press 1 for further transaction or any key to exit");

      option = int.parse(stdin.readLineSync()!);
      // TRY/CATCH here
      switch(option){
        case 1 : select_Transaction(); //

        default:
          break;
      }
    }

    double withdraw() {
      // function to help in withdrawing
      print("Please input amount you want to withdraw");
      amount = double.parse(stdin.readLineSync()!);
        if ((amount > 0) && (amount < balance)) {
          withdrawing();
        }
        else {
          confirm_balance();
      }
        return balance;
    }

    double withdrawing() {
      balance = balance - amount;
      print("You have withdrawn N$amount. Your balance is $balance");
      print("\nThank you for banking with us");
      return balance;
      //exit;
    }

    confirm_balance() { // code to check if balance == 0, -ve or other characters before any transaction
      print('You have 3 attempts left (confirm balance)');
        for (int i = 1; i <= 3; i++) {
          //create class  for error messages
          //try {
            amount = double.parse(stdin.readLineSync()!);
            //if (amount <= 0 || amount > balance) {
              //try/catch here
              print("You cannot input $amount as an input");
              //throw FormatException ('Negative values are not allowed');
              if (i == 1) {
                print("\nPlease input a valid amount");
              }

              if (i == 2) {
                print('You have only a chance left!'
                    '\n input a correct amount');
              }
              if (i == 3) {
                print("Sorry! You have exceeded your input limit"
                    "\n");
              }
            //} else {
              //withdrawing();
              //break;

              //print(
                 // "Your input of $amount is greater than your balance of $balance");
              // this doesn't need throw or exception
            //}
          // } on FormatException {
          //   print("Negative Numbers or Strings not allowed");
          // } catch (e) {
          //   print (e);
          // }

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