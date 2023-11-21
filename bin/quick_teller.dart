import 'dart:io';
//import 'dart:svg';
//import 'package:test/expect.dart';

import 'my_atm_mac.dart';

Customer customer = Customer();


class QuickTeller {
  ///This class takes care of the different services offered by QUICKTELLER
  ///...such as recharge of PHONE AIRTIME, DSTV, GOTV, STARTIMES, WATER-BILL,...
  ///...ELECTRIC-BILL, ... and so on
  ///
  ///QUICKTELLER - Recharge; txfer; ; DSTV; STARTIMES; GOTV; WATER-BILL; ELECTRIC-BILL"

  late String option, plan, bankName;
  late double amount;
  double balance2 = 678; //customer.balance;
  late int bankOption;
  late var accountCode;

  qServices(){ // SELECT QUICKTELLER SERVICES
    print("Welcome to QuickTeller services. "
        "Please type in one of the options below to select your transaction \n"
        "1: AIRTIME; 2: UTILITY BILLS; 3: MONEY TRANSFER; 4: REMITTA PAYMENTS; \n"
        "5: RECEIVE MONEY \n"
        "Press 0 or any other character to QUIT all transactions");
    for (int i = 0; i <= 0; i++) {
      try {
        option = (stdin.readLineSync()!);
        switch (option) {

          case "1":
            print("Welcome to AIRTIME recharge interface");
            return airtimeRecharge();
          case "2":
            print("Welcome to  UTILITY BILLS recharge interface");
            return bills();
          case "3":
            print("Welcome to MONEY TRANSFER interface");
            return transfer();
          case "4":
            print("Welcome to REMITTA interface");
            print("Not yet developed");
            customer.furtherTransaction();
          case "5":
            print("Welcome to RECEIVE MONEY interface");
            print("Not yet developed");
            customer.furtherTransaction();

          default:
            print("This is over. Goodbye");
            return;
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
        if ((phoneNumber.length == 11)  && (phoneNumber.startsWith('0') == true)) { // to check length and start of the number
          print("Please input the amount to recharge");
          double amount = double.parse(stdin.readLineSync()!);
          print("You have recharged $phoneNumber with N$amount\n");
          print('');
          return customer.furtherTransaction();
        } else {
          if (i == 1) {
            print("You have only 1 entry-times remaining");
          }
          if (phoneNumber.startsWith('0') == false) {
            print("Phone number must start with 0 (zero)");
          }
          if (phoneNumber.length != 11) {
            print("11 digitzz make up a Nigerian mobile phone number\n");
          }
          if (i == 2) {
            print("You have exhausted your input limit, Odahbor");
          }
        }
      } catch (e) {
        print("You have entered a non number");
        if (i == 2) {
          print("You have exhausted non-number input limits, Odahbor");
        }
      }
    }
    return;
  }

  bills() { // for UTILITY BILLS
    print("Please enter the digit that corresponds to your bill payment \n"
        "1: STARTIMES; 2: DSTV; 3: GOTV; 4: WATER-BILL; 5: ELECTRICITY-BILL");
    for (int i = 0; i <= 0; i++) {
      try {
        option = (stdin.readLineSync()!);
        switch (option) {
          case "1":
            print("Welcome to STARTIMES recharge interface");
            print("Please input your Startimes decoder Code-Number");
            return accountCodeEntry();

          case "2":
            print("Welcome to DSTV recharge interface");
            print("Please input your DSTV decoder IUC Number");
            return accountCodeEntry();
          case "3":
            print("Welcome to GOTV recharge interface");
            print("Please input your GOTV decoder IUC Number");
            return accountCodeEntry();
          case "4":
            print("Welcome to WATER-BILL recharge interface");
            print("Please input your WATER-BILL destination Code");
            return accountCodeEntry();
          case "5":
            print("Welcome tO ELECTRIC-BILL recharge interface");
            print("Please input your ELECTRICITY account number");
            return accountCodeEntry();

          default:
            print("Game over meh...n. Goodbye");
            return;
        }
      } catch (e) {
        print("Wrong entry");
      }
    }
  }

  accountCodeEntry() {
    for(int i = 0; i <= 2; i++) {
      accountCode = (stdin.readLineSync()!); // checkIfAlphabet()
      if (accountCode.length >= 4) {
        return subscriptionType();
      } else {
        print("Wrong entry Brethren!");
        if (i == 2) {
          print("You exhausted your input limits ");
          return;
        }
        print("Please enter the right code");
      }
    }
  }


  subscriptionType() {

    for(int i = 0; i <= 2; i++) {
      print("Please enter your subscription type below:"
          "Type A - N10,000; B - N7,000; C - N5,000; D - N3,000");
      try {
        plan = (stdin.readLineSync()!).toUpperCase(); // checkIfAlphabet()
        if(plan is String) {
          switch (plan) {
            case 'A':
              print("You selected option A recharge. It costs N10,000");
              if (balance >= 10000 ) {
                balance = balance - 10000;
                print("You successfully recharged your account with account code $accountCode and Type A Service. Enjoy");
                //return customer.furtherTransaction();
              } else {
                print("Your balance of N$balance is less than subscription amount of N10,000");
              }
            case 'B':
              print("You selected option B recharge with N7,000 cost");
              if (balance > 7000 ) {
                balance = balance - 7000;
                print("You successfully recharged your account with Type B Service. Enjoy");

              } else {
                print("Your balance of N$balance is less than subscription amount of N7,000");
              }
            case 'C':
              print("You selected option C recharge with N5,000 cost");
              if (balance > 5000 ) {
                balance = balance - 5000;
                print("You successfully recharged your account with Type C Service. Enjoy");
              } else {
                print("Your balance of N$balance is less than subscription amount of N5,000");
              }
            case 'D':
              print("You selected option D recharge with N3,000 cost");
              if (balance > 3000 ) {
                balance = balance - 3000;
                print("You successfully recharged your account with Type D Service. Enjoy");
              } else {
                print("Your balance of N$balance is less than subscription amount of N3,000");
              }
            default:
              if (i == 0) {
                print("Two more wrong entries, you end all transactions");
              }
              if (i == 1) {
                print("One more entry-time left");
              }
              if (i == 2) {
                print("You  Thank you for banking with us. Have a nice day!");
                return;
              }
          }
          break;
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
    return customer.furtherTransaction();
  }


  transfer() {
    print("Please select the recipient's bank \n");
    return selectBank();
  }

  selectBank(){
    print("1: ABBA BANK; 2: COCO BANK; 3: EVERLASTING BANK; 4: FLEXING BANK; \n"
        "5: GOOD-BETTER BANK; 6: H - M; 7: N - T ; 8: U - Z  \n"
        "Press 0 or any other character to QUIT all transactions");

    for(int i = 0; i <= 2; i++) { // iterate three times in case of errors
      try {
        bankOption = int.parse(stdin.readLineSync()!);

        //
        if ((bankOption is int) && (!bankOption.isNegative)) { // condition to accept only positive integers
          switch (bankOption) {  // the SWITCH statement used to offer us options to choose

            case 1:
              bankName = "ABBA Bank"; //Storing the bank name
              return customer.mainTransfer();
              break;

            case 2:
              bankName = "COCO Bank"; //Storing the bank name; // return to the withdraw() function
              return transfer();

            case 3:
              bankName = "EVER BANK"; //Storing the bank name;
              return transfer();

            case 4:
              bankName = "FLEXING BANK";
              return transfer();

            case 5:
              bankName = "GOOD BETTER BANK";
              return transfer();

            case 6:
              bankName = "NAIJA BANK"; //Storing the bank name
              return transfer();

            case 7:
              print("Bank O - R For future use");
              return customer.furtherTransaction();

            case 8:
              print("Bank S - Z For future use");
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

      }
    return; //
    }


  // billsPayment() { // for further use
  //   print("Please input your  Number/ Code");
  //   accountCode = (stdin.readLineSync()!);
  //   for (int i = 0; i <= 2; i++) {
  //     print("Please enter the amount corresponding to your plan");
  //     try {
  //       amount = double.parse(stdin.readLineSync()!);
  //       if ((amount > 0) && (amount < balance)) {
  //         balance = balance - amount;
  //         print("You're dong well");
  //         print("You have N$balance as your balance.");
  //         break;
  //       } else {
  //         if (i == 1) {
  //           print("You have one more chance left");
  //         }
  //         if (i == 2) {
  //           print("You exhausted your -ve entry grace limit, bye");
  //           return;
  //         }
  //         print("Negative money is not permitted here");
  //       }
  //     } catch (e) {
  //       if (i == 1) {
  //         print("You have one more chance left");
  //       }
  //       if (i == 2) {
  //         print("You exhausted your xter entry grace limit, bye");
  //         return;
  //       }
  //       print("Baddeer input");
  //     }
  //   }
  //   customer.furtherTransaction();
  // }







}