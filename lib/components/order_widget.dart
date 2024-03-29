import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping/models/order.dart';

class OrderWidget extends StatefulWidget {
  final Order order;

  const OrderWidget({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          title: Text('R\$${widget.order.total.toStringAsFixed(2)}'),
          subtitle:
              Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.date)),
          trailing: IconButton(
            icon: const Icon(Icons.expand_more),
            onPressed: () {
              setState(() {
                expanded = !expanded;
              });
            },
          ),
        ),
        Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            height: widget.order.products.length * 25.0 + 10,
            child: expanded
                ? ListView(
                    children: widget.order.products
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${e.quantity}x R\$${e.price}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ))
                        .toList(),
                  )
                : const SizedBox())
      ],
    ));
  }
}
