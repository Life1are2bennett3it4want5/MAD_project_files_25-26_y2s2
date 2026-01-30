class Order{
  String main = "", appetizers = "", sides = "", drinks = "", dessert = "", table = "";

  Order(this.main, this.appetizers, this.sides, this.drinks, this.dessert, this.table);
}

class OrderingService{
  //detect the tapped order
  static String tappedMain="";
  static String tappedAppetizers="";
  static String tappedSides="";
  static String tappedDrinks="";
  static String tappedDessert="";
  static String tappedTable="";

  static List<Order> z = [];

  static int getCount(){
    return (z.length);
  }

  static void addTable(String table) {
    z.add(Order('', '', '', '', '', table));
  }

  static void addOrder({required String main, required String appetizers, required String sides, required String drinks, required String dessert, required String table, }){
    z.add(Order(main, appetizers, sides, drinks, dessert, table));
  }

  static Order getOrderAt(int index){
    return(z[index]);
  }

  static void updateOrderByMainDish(String mainDish, String newAppetizers, String newSides, String newDrinks, String newDessert, String newTable){
    for (int i=0; i<z.length; i++){
      if(z[i].main == mainDish){
        z[i].appetizers = newAppetizers;
        z[i].sides = newSides;
        z[i].drinks = newDrinks;
        z[i].dessert = newDessert;
        z[i].table = newTable;
      }
    }
  }

  static void deleteOrder(int index){
    z.removeAt(index);
  }

}