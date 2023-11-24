import 'dart:io';
class Trash{
  int quantity;
  int category;
  int amount;

  //Quantity of trash and price for each category of trash
  static Map <int, int> trashMeasurment = {
    1:  50,
    2:  75,
    3:  100
  };

  Trash(this.quantity, this.category, this.amount);//Constructor

  //Check if client's amount is enough for the trash pickup
   bool checkAmount(){ 
       double actualPrice = ((trashMeasurment[category])! * this.quantity) * 0.75;
       bool isAmountCorrect = (this.amount < actualPrice)? false : true;
       return isAmountCorrect;
   }
}
void main(){
    print("Enter 1 for bucket");
    print("Enter 2 for trashbag");
    print("Enter 3 for wheelbarrow");


    print("Enter the item you want your trash to be measured in: "); //The item the user wants to use to measure the trash
    int trashItem = int.parse(stdin.readLineSync()!);

    print("Enter the quantity of the trash in terms of the item you just said: ");//The quantity of the trash in terms of the item the user wants to use to measure the trash
    int trashQuantity = int.parse(stdin.readLineSync()!);

    print("The price for your trash pickup is ${(Trash.trashMeasurment[trashItem])! * trashQuantity} FCFA");//The price for the trash pickup
    print("How much do you want to pay for the trash?: ");

    int trashAmount = int.parse(stdin.readLineSync()!);//Client's amount for the trash pickup


    Trash trash = Trash(trashQuantity, trashItem, trashAmount);//Creation instance of the Trash class

    if(trash.checkAmount()){
      print("EcoCaasitech agent is on the way to pick up your trash");
    }else{
      print("You have to pay more");
      exit;
    }
}