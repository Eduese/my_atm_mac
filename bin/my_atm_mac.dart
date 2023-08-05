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

void main(List<String> arguments) {
  print('Welcome Customer. Please select the number based on the service you need'); // message to welcome customer
  Customer().select_Transaction() ; //creating the Customer class object without first initialising it

}


class Customer { // creating a class with a typical SERVICES needed by a customer
  double balance = 0; //customer balance initialised to zero with an increment hope
  int option = 0; // the options for the  SERVICES options to be offered the  bt the bank
  late double amount; // being the deposit, wihdraw, transfer, ...amount. The late keyword means it'll be used LATER
                      //late double input_amount; //
  late int account_number; // account number of the Cusromer
  late int phone_number; // phone number of the Customer
  int pin = 3456; // the default pin for this project


/* 1. SELECT TRANSACTION. 2. DEPOSIT; 3. WITHDRAW; 4. TRANSFER;
5. OPEN ACCOUNT, 6. CHECK BALANCE,
7. SET PIN.
4. QUICKTELLER SERVICES - TRANSFER, RECHARGE PHONE,  PAY BILLS (dstv, phedc,...),**/

  select_Transaction() {
    //function to select the TRANSACTION TYPE customer wants to perform
    print("Welcome. Please type in one of the options below to select your transaction "
        "1: DEPOSIT; 2: WITHDRAWAL; 3:TRANSFER 4: QUICKTELLER; 5: CHANGE PIN"
        "6:7:8:"
        "");
    option = int.parse(stdin.readLineSync()!);
    
    switch(option){
      case 1: print('You selected a DEPOSIT transaction service ');
          deposit();

      case 2: print('You selected a WITHDRAWAL transaction service ');
          withdraw();

      case 3: print('You selected a TRANSFER transaction service ');
              print('Press 1 for Quickteller Transfer, Press 2 for Main transfer');
              select_Transfer();

      case 4: print('You selected a QUICKTELLER transaction service ');
      case 5: print('You selected a CHANGE-PIN transaction service ');

    }
  }

  deposit() { // for deposit into one's account in one's bank
    // function to help in money deposits
    print("Welcome, please drop your cash on the tray and input the amount you want to deposit");
    //after input
    print("Please wait while we compare the cash with your input");
    balance = amount + balance;
    print("You deposited N$amount and your current balance is $balance");
    print("Thank you for banking with us");
  }

  withdraw() {
    // function to help in withdrawing
    print("Please input amount you want to withdraw");
    confirm_balance();
  }

  confirm_balance() { // code to check balance before an debit transaction
    print('Please enter your amount');

    for (int i = 1; i <= 3; i++ ) {
      amount = double.parse(stdin.readLineSync()!);
      if (balance < amount) {
        print("Wrong transaction your input of N$amount is less than your balance of $balance "
            "\nPlease input a valid amount");
        if(i == 2) {
          print('You have only a chance left');
        }
      }
    }
    print('You have exceeded your input limit');
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