
class ProductEx {
  String item;
  int id;
  int quatity;
  int price;
  int total;

  ProductEx({this.item, this.quatity, this.price, this.total,this.id});

  @override
  String toString() {
    return '${item} ${quatity} ${price} ${total} ${id}';
  }
  Map toJson() => {
    'product_id': id,
    'quantity': quatity,
    'unit_price': price,
    'sub_total': total,
  };
}