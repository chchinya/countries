import 'package:flutter/material.dart';
import 'package:countries/countries.dart';

Map<String, List<countries>> divideCountries(List<countries> list) {
  int half = (list.length / 2).round();
  return {
    "column1": list.sublist(0, half),
    "column2": list.sublist(half),
  };
}

class CountryCard extends StatelessWidget {
  final countries country;

  const CountryCard({required this.country});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.network(
                  country.flag,
                  width: 60,
                  height: 90,
                ),
                const SizedBox(width: 10),
                Text(
                  country.Title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Площадь: "),
                Text(country.square.toString()),
              ],
            ),
            Row(
              children: [
                const Text("Население: "),
                Text(country.population.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Country App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Countries'),
        ),
        body: Row(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: divideCountries(countriesList)["column1"]!.length,
                itemBuilder: (context, index) {
                  return CountryCard(
                      country:
                          divideCountries(countriesList)["column1"]![index]);
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: divideCountries(countriesList)["column2"]!.length,
                itemBuilder: (context, index) {
                  return CountryCard(
                      country:
                          divideCountries(countriesList)["column2"]![index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}
