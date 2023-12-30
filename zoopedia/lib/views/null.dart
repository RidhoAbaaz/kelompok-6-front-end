import 'package:flutter/material.dart';

// void main() {
//   runApp(const ChartNull());
// }

class ChartNull extends StatelessWidget {
  const ChartNull({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          // style: GoogleFonts.leagueSpartan(),
        ),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: const Color.fromRGBO(163, 204, 176, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(137, 167, 137, 1),
                    shape: BoxShape.circle),
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 90,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Oops!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Text(
                'You haven\'t added a ticket yet.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add ticket
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromRGBO(137, 167, 137, 1)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ))),
                child: const Text(
                  'Add ticket',
                  // style: GoogleFonts.openSans(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
