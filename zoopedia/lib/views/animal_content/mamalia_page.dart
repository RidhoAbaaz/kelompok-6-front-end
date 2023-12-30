import 'package:flutter/material.dart';
import 'package:zoobeta/controllers/animals_controller.dart';
import 'package:zoobeta/models/mamalia.dart';

class MamaliaPage extends StatelessWidget {
  const MamaliaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 178, 200, 186),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Center(
            child: AppBar(
              backgroundColor: const Color.fromARGB(255, 134, 167, 137),
              title: const Center(
                child: Text('Mamalia (Mammals)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context); // Handle back navigation
                },
              ),
            ),
          )),
      body: const AnimalListView(),
    );
  }
}

class AnimalListView extends StatefulWidget {
  const AnimalListView({super.key});

  @override
  State<AnimalListView> createState() => _AnimalListViewState();
}

class _AnimalListViewState extends State<AnimalListView> {
  late List<Mamalia> mamalias;

  @override
  void initState() {
    super.initState();
    mamalias = [];
    getAnimals();
  }

  Future<void> getAnimals() async {
    final List<Mamalia> animals = await getMammals();

    if (mounted) {
      setState(() {
        mamalias = animals;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: mamalias.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 134, 167, 137),
                    border: Border.all(
                        color: const Color.fromRGBO(137, 167, 137, 1)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Kotak gambar (Image Box) dengan border
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 79, 111, 82),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              mamalias[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Informasi hewan
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name: ${mamalias[index].nama}'),
                              Text(
                                  'Latin Name: ${mamalias[index].nama_ilmiah}'),
                              Text('Species: ${mamalias[index].jenis}'),
                              Text('Type: ${mamalias[index].habitat}'),
                              // Text('Name: ${mammals[index].name}'),
                              // Text('Latin Name: ${mammals[index].latinName}'),
                              // Text('Species: ${mammals[index].habitat}'),
                              // Text('Type: ${mammals[index].type}'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
