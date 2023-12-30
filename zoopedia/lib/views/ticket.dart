import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoobeta/models/TicketModel.dart';
import 'package:zoobeta/models/cartModel.dart';
import 'package:zoobeta/views/cart.dart';

class FavoriteList extends StatelessWidget {
  const FavoriteList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 200, 186),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Shop',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context); // Handle back navigation
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const FavoritePage()));
              },
              icon: const Icon(
                Icons.shopping_cart_checkout,
                color: Colors.black,
              ))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(bottom: 30),
                color: const Color.fromARGB(255, 134, 167, 137),
                width: double.infinity,
                height: 130,
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Zoo! is being opened.',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Text(
                      'Come on, buy tickets immediately and we are waiting \n for your presence at the Zoo!',
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return _MyListItem(index);
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;

  const _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<FavoriteListModel, Item>(
      (favoritelist) => favoritelist.getByPosition(index),
    );

    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        height: 130,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 134, 167, 137)),
        // color: const Color.fromARGB(255, 134, 167, 137),
        child: Center(
          child: ListTile(
              leading: SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(item.image, fit: BoxFit.cover),
              ),
              title: Text(item.name),
              subtitle: Text(item.subtittle),
              trailing: _AddButton(item: item)),
        ));
  }
}

class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavoritePage = context.select<FavoritePageModel, bool>(
      (favoritepage) => favoritepage.items.contains(item),
    );

    return IconButton(
      icon: isInFavoritePage
          ? const Icon(
              Icons.add_box,
              color: Colors.white,
              size: 30,
            )
          : const Icon(
              Icons.add_box_outlined,
              size: 30,
            ),
      onPressed: isInFavoritePage
          ? () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.remove(item);
            }
          : () {
              var favoritepage = context.read<FavoritePageModel>();
              favoritepage.add(item);
            },
    );
  }
}
