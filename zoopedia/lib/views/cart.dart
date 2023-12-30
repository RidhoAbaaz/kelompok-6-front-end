// ignore_for_file: unnecessary_string_escapes, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoobeta/controllers/layouts.dart';
import 'package:zoobeta/models/cartModel.dart';
import 'package:zoobeta/views/own_ticket.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    var total = context.watch<FavoritePageModel>().calculateTotal();
    var favoritepage = context.watch<FavoritePageModel>();
    bool hasItems = favoritepage.items.isNotEmpty;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 200, 186),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: _FavoritePageList(),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 150,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromRGBO(137, 167, 137, 1),
              ),
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Stack(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    height: 150,
                    width: 420,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFF86A789),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Total : ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "\RP. ${total.toStringAsFixed(3)}", // Display the total
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: hasItems
                                ? () {
                                    successful(context);
                                    if (context.mounted) {
                                      Navigator.pop(context);
                                    }
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                const MyTicket()));
                                  }
                                : null, // Disable the button if no items
                            child: Ink(
                              decoration: BoxDecoration(
                                color: hasItems
                                    ? Colors.white
                                    : Colors.grey[300], // Disable color
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 180,
                                child: Text(
                                  "Payment",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: hasItems
                                        ? Colors.black
                                        : Colors.grey, // Disable color
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoritePageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favoritepage = context.watch<FavoritePageModel>();

    return ListView.builder(
      itemCount: favoritepage.items.length,
      itemBuilder: (context, index) {
        final item = favoritepage.items[index];
        return Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              height: 120,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 134, 167, 137)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 160,
                        child: Image.asset(item.image),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        item.subtittle,
                        style: const TextStyle(fontSize: 15),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<FavoritePageModel>()
                                  .increaseQuantity(item);
                            },
                            icon: const Icon(Icons.add_circle),
                            color: Colors.white,
                          ),
                          Text(
                            item.quantity.toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          IconButton(
                            onPressed: () {
                              context
                                  .read<FavoritePageModel>()
                                  .decreaseQuantity(item);
                            },
                            icon: const Icon(Icons.remove_circle_rounded),
                            color: Colors.white,
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<FavoritePageModel>().removeItem(item);
                    },
                    icon: const Icon(Icons.delete_outline),
                    color: Colors.black,
                  ),
                ],
              )),
        );
      },
    );
  }
}
