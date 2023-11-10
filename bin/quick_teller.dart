import 'dart:io';
import 'package:test/expect.dart';

import 'my_atm_mac.dart';

Customer customer = Customer();


class QuickTeller {
  ///This class takes care of the different services offered by QUICKTELLER
  ///...such as recharge of PHONE AIRTIME, DSTV, GOTV, STARTIMES, WATER-BILL,...
  ///...ELECTRIC-BILL, ... and so on
  ///
  ///QUICKTELLER - Recharge; txfer; ; DSTV; STARTIMES; GOTV; WATER-BILL; ELECTRIC-BILL"

  late String option, accountCode, plan, bankName;
  late double amount;
  double balance2 = 678; //customer.balance;
  late int bank_option;

  qServices(){ // SELECT QUICKTELLER SERVICES
    for (int i = 0; i <= 0; i++) {
      try {
        option = (stdin.readLineSync()!);
        switch (option) {
          case 1:
            print("Welcome to STARTIMES recharge interface");
            print("Please input your Startimes decoder Code");
            subscriptionType();

          case 1:
            print("Welcome to STARTIMES recharge interface");
            print("Please input your Startimes decoder Code");
            subscriptionType();

          case 2:
            print("Welcome to STARTIMES recharge interface");
            print("Please input your Startimes decoder Code");
            subscriptionType();

          case 3:
            print("Welcome to DSTV recharge interface");
            print("Please input your IUC  Number");
            subscriptionType();
          case 3:
            print("Welcome to GOTV recharge interface");
            print("Please input your GOTV IUC Number");
            subscriptionType();
          case 4:
            print("Welcome to WATER-BILL recharge interface");
            print("Please input your WATER-BILL destination Code");
            subscriptionType();
          case 5:
            print("Welcome tO ELECTRIC-BILL recharge interface");
            print("Please input your ELECTRICITY account number");
            subscriptionType();
        }
      } catch (e) {
        print("Wrong entry");
      }
    }
  }

  airtimeRecharge() {
    ///we can't verify phone numbers here until at real time...
    //print("Please input the CORRECT phone number");
    for (int i = 0; i <= 2; i++) {
      try {
        //for (int i = 0; i <= 2; i++) {
        print("Please input the CORRECT phone number to recharge");
        String phoneNumber = (stdin.readLineSync()!);
        if ((phoneNumber.length == 11) && (phoneNumber.startsWith(
            '0'))) { // to check length and start of the number
          print("Please input the amount to recharge");
          double amount = double.parse(stdin.readLineSync()!);
          print("You have recharged $phoneNumber with N$amount\n");
          print(phoneNumber.length);
          print('');
          break;
        } else {
          if (i == 1) {
            print("You have only 1 entry-times remaining");
          }
          if (phoneNumber.startsWith('0') == false) {
            print("Phone number must start with 0 (zero)");
          }
          if (phoneNumber.length != 11) {
            print("11 digits make up a Nigerian mobile phone number\n");
          }
          if (i == 2) {
            print("You have exhausted your input limit, Odahbor");
          }
        }
      } catch (e) {
        print("You have entered a non number");
      }
    }
    return customer.furtherTransaction();
  }

  bills() {
    print("Please enter the digit that corresponds to your bill payment"
        "1: STARTIMES; 2: DSTV; 3: GOTV; 4: WATER-BILL; 5: ELECTRICITY-BILL");
    for (int i = 0; i <= 0; i++) {
      try {
        option = (stdin.readLineSync()!);
        switch (option) {
          case 1:
            print("Welcome to STARTIMES recharge interface");
            print("Please input your Startimes decoder Code");
            subscriptionType();
          case 2:
            print("Welcome to DSTV recharge interface");
            print("Welcome to DSTV recharge interface");
            print("Please input your IUC  Number");
            subscriptionType();
          case 3:
            print("Welcome to GOTV recharge interface");
            print("Please input your GOTV IUC Number");
            subscriptionType();
          case 4:
            print("Welcome to WATER-BILL recharge interface");
            print("Please input your WATER-BILL destination Code");
            subscriptionType();
          case 5:
            print("Welcome tO ELECTRIC-BILL recharge interface");
            print("Please input your ELECTRICITY account number");
            subscriptionType();
        }
      } catch (e) {
        print("Wrong entry");
      }
    }
  }


  billsPayment() {
    print("Please input your  Number/ Code");
    accountCode = (stdin.readLineSync()!);
    for (int i = 0; i <= 2; i++) {
      print("Please enter the amount corresponding to your plan");
      try {
        amount = double.parse(stdin.readLineSync()!);
        if (amount > 0) {
          balance = balance - amount;
          print("You're dong well");
          print("You have N$balance as your balance.");
          break;
        } else {
          if (i == 1) {
            print("You have one more chance left");
          }
          if (i == 2) {
            print("You exhausted your -ve entry grace limit, bye");
            return;
          }
          print("Negative money is not permitted here");
        }
      } catch (e) {
        if (i == 1) {
          print("You have one more chance left");
        }
        if (i == 2) {
          print("You exhausted your xter entry grace limit, bye");
          return;
        }
        print("Baddeer input");
      }
    }
    customer.furtherTransaction();
  }


  subscriptionType() {

    for(int i = 0; i <= 2; i++) {
      print("Please enter your subscription type below:"
          "Type A - N10,000; B - N7,000; C - N5,000; D - N3,000");
      try {
        plan = (stdin.readLineSync()!).toUpperCase(); // checkIfAlphabet()
        if(plan is String ) {
          switch (plan) {
            case 'A':
              print("You selected option A recharge. It costs");
              balance = balance - 10000;
              return customer.checkBalance();
            case 'B':
              print("You selected option B recharge");
              balance = balance - 7000;
              return customer.checkBalance();
            case 'C':
              print("You selected option C recharge");
              balance = balance - 5000;
              return customer.checkBalance();
            case 'D':
              print("You selected option D recharge");
              balance = balance - 3000;
              return customer.checkBalance();
            default:
              if (i == 0) {
                print("Two wrong entries, you end all transactions");
              }
              if (i == 1) {
                print("One more entry-time left");
              }
              if (i == 2) {
                print("You  Thank you for banking with us. Have a nice day!");
                return;
              }
          }
      } else {
          if (i == 1) {
            print("Wrong entry! One more entry-time left");
          }
          if (i == 2) {
            print("You  Thank you for banking with us. Have a nice day!");
            return;
          }
          print("That entry ain't right");

        }
    } catch (e) {

        print("You entered a wrong option. A to D are the options");
      }
    }
  }

  transfer() {
    print("Please select your bank");
    selectBank();
    print("Please select the recipient's bank \n");
    selectBank();
    print("Please input recipient's account number");
    customer.accountNumber = int.parse(stdin.readLineSync()!);
    return customer.mainTransfer();
    }

  selectBank(){
    print("1: ABBA BANK; 2: COCO BANK; 3: EVERLASTING BANK; 4: FLEXING BANK; \n"
        "5: GOOD-BETTER BANK; 6: H - M; 7: N - T ; 8: U - Z  \n"
        "Press 0 or any other character to QUIT all transactions");

    for(int i = 0; i <= 2; i++) { // iterate three times in case of errors
      try {
        bank_option = int.parse(stdin.readLineSync()!);

        // USE ARRAYS
        if ((bank_option is int) && (!bank_option.isNegative )) { // condition to accept only positive integers
          switch (bank_option) {  // the SWITCH statement used to offer us options to choose

            case 1:
              bankName = "ABBA Bank"; //Storing the bank name
              //transfer();
              break;

            case 2:
              bankName = "COCO Bank"; //Storing the bank name; // return to the withdraw() function
              //return transfer();

            case 3:
              bankName = "EVER BANK"; //Storing the bank name;
              //return transfer();

            case 4:
              bankName = "FLEXING BANK";
              //return transfer();

            case 5:
              bankName = "GOOD BETTER BANK";
              //return transfer();

            case 6:
              bankName = "NAIJA BANK"; //Storing the bank name
              return transfer();

            case 7:
              print("For future use");
              return customer.furtherTransaction();

            case 8:
              print("For future use");
              return customer.furtherTransaction();

            // case 9:
            //   return banks_H_M(); //Storing the bank name

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
        print("Please enter only INTEGERS 1 to 9 that corresponds to your transactionzz");
        }
        //break;
      }
    //return transfer();
    }

}