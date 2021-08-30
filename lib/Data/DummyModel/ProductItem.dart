
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
    'id': id,
    'item': item,
    'quatity': quatity,
    'price': price,
    'total': total,
  };
}