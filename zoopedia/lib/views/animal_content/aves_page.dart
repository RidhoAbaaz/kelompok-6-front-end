import 'package:flutter/material.dart';
import 'package:zoobeta/controllers/animals_controller.dart';
import 'package:zoobeta/models/aves.dart';

class AvesPage extends StatelessWidget {
  const AvesPage({super.key});

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
                child: Text('Aves (Birds)',
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
  late List<Aves> aves;

  @override
  void initState() {
    super.initState();
    aves = [];
    getAnimals();
  }

  Future<void> getAnimals() async {
    final List<Aves> animals = await getAves();

    if (mounted) {
      setState(() {
        aves = animals;
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
            itemCount: aves.length,
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
                              aves[index].image,
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
                              Text('Name: ${aves[index].nama}'),
                              Text('Latin Name: ${aves[index].nama_ilmiah}'),
                              Text('Habitat: ${aves[index].jenis}'),
                              Text('Type: ${aves[index].habitat}'),
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
