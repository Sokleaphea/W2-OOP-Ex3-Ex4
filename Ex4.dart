enum DeliveryOption { DELIVERY, PICKUP }

class Product {
  String name;
  int id;
  double price;

  Product({required this.name, required this.id, required this.price});
  String printResult() {
    return ("Name: $name, Id: $id, Price: $price");
  }
}

class Customer {
  String name;
  int id;
  String email;
  int phoneNumber;
  Customer({
    required this.name,
    required this.email,
    required this.id,
    required this.phoneNumber,
  });
}

class Order {
  int orderId;
  Customer customer;
  List<OrderItem> items;
  Address? address;
  DeliveryOption option;
  bool isPickUp;
  Order({
    required this.orderId,
    required this.customer,
    required this.items,
    this.address,
    this.option = DeliveryOption.PICKUP,
    this.isPickUp = false,
  });
  Order.forDelivery({
    required this.address,
    required this.orderId,
    required this.customer,
    required this.items,
    this.option = DeliveryOption.DELIVERY,
    this.isPickUp = true,
  });
  double computeTotal() {
    double totalAmount = 0;
    for (var item in items) {
      totalAmount += item.product.price * item.quantity;
    }
    return totalAmount;
  }
}

class OrderItem {
  Product product;
  int quantity;

  OrderItem(this.product, this.quantity);
}

class Address {
  String street;
  String city;
  int zipCode;

  Address(this.street, this.city, this.zipCode);
  void getAddress() {
    print("Street: $street, City: $city, ZipCode: $zipCode");
  }
}

void main() {
  var laptop = Product(name: 'mac', id: 1, price: 2000);
  var mouse = Product(name: 'lipstick', id: 2, price: 25);
  var customer1 = Customer(
    name: 'Kane',
    email: 'kane@gmail.com',
    id: 1,
    phoneNumber: 00019,
  );
  var orderItem1 = OrderItem(laptop, 1);
  var orderItem2 = OrderItem(mouse, 2);
  List<OrderItem> items1 = [orderItem1, orderItem2];
  var order1 = Order(orderId: 1, customer: customer1, items: items1);
  print('Customer: ${order1.customer.name}');
  print('Order total: \$${order1.computeTotal()}');
  print(
    'Status: ${order1.option == DeliveryOption.DELIVERY ? "Delivery" : "Pick Up"}',
  );
  if (order1.option == DeliveryOption.DELIVERY) {
    order1.address?.getAddress();
  }
  // var address1 = Address('123 st', 'Phnom Penh', 1000);
  // var customer2 = Customer(
  //   name: 'Raelina',
  //   email: 'r@gmail.com',
  //   id: 2,
  //   phoneNumber: 012345,
  // );
  // var orderItem3 = OrderItem(laptop, 2);
  // var orderItem4 = OrderItem(mouse, 3);
  // var order2 = Order.forDelivery(
  //   orderId: 2,
  //   customer: customer2,
  //   items: items1,
  //   address: address1,
  // );
  // List<OrderItem> items2 = [orderItem3, orderItem4];
}
