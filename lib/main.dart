import 'package:flutter/material.dart';
import 'package:flutter_hw_2_zoo/detail.dart';
import 'package:flutter_hw_2_zoo/mocked_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: AnimalsGrid(
            animals: MockData.animals.entries.map((e) => e.value).toList()),
      ),
    );
  }
}

class AnimalsGrid extends StatelessWidget {
  final List<Animal> animals;
  const AnimalsGrid({super.key, required, required this.animals});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: animals.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        primary: false,
        padding: const EdgeInsets.all(20),
        itemBuilder: (context, index) {
          return GridCard(animal: animals[index]);
        });
  }
}

class GridCard extends StatelessWidget {
  final Animal animal;
  const GridCard({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'TEST${animal.id}',
        child: Card(
            clipBehavior: Clip.hardEdge,
            child: InkWrapperForImagedContainer(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              animal: animal,
                            )),
                  );
                },
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(animal.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                    alignment: AlignmentDirectional.bottomStart,
                    width: 300,
                    height: 300,
                    child: GridCardTitle(title: animal.name)))));
  }
}

class InkWrapperForImagedContainer extends StatelessWidget {
  final BoxDecoration? decoration;
  final Widget child;
  final void Function() onTap;
  const InkWrapperForImagedContainer(
      {super.key,
      required this.decoration,
      required this.child,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          onTap();
        },
        child: Ink(decoration: decoration, child: child));
  }
}

class GridCardTitle extends StatelessWidget {
  final String title;
  const GridCardTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsetsDirectional.all(8),
        decoration: BoxDecoration(
            color: Colors.black.withAlpha(150),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.white,
              ),
        ));
  }
}
