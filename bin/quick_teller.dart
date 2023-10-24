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

  late String option, accountCode, plan;
  late double amount;
  double balance2 = 678; //customer.balance;

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





}