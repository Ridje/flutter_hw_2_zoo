class MockData {
  static Map<int, Animal> animals = {
    1: Animal(
      imageUrl: 'assets/images/lion.jpeg',
      name: 'Lion',
      id: 1,
      description:
          'The lion is a large carnivorous mammal of the Felidae family.',
      sound: 'Roar!',
    ),
    2: Animal(
      imageUrl: 'assets/images/elephant.jpeg',
      name: 'Elephant',
      id: 2,
      description: 'The elephant is the largest land animal on Earth.',
      sound: 'Trumpet!',
    ),
    3: Animal(
      imageUrl: 'assets/images/tiger.jpeg',
      name: 'Tiger',
      id: 3,
      description: 'The tiger is the largest cat species.',
      sound: 'Roar!',
    ),
    4: Animal(
      imageUrl: 'assets/images/girafee.jpeg',
      name: 'Giraffee',
      id: 4,
      description: 'The giraffe is the tallest living terrestrial animal.',
      sound: 'Grunt!',
    ),
    5: Animal(
      imageUrl: 'assets/images/zebra.jpeg',
      name: 'Zebra',
      id: 5,
      description: 'Zebras are several species of African equids.',
      sound: 'Bray!',
    ),
    6: Animal(
      imageUrl: 'assets/images/cheetah.jpeg',
      name: 'Cheetah',
      id: 6,
      description: 'The cheetah is the fastest land animal.',
      sound: 'Growl!',
    ),
    7: Animal(
      imageUrl: 'assets/images/kangaroo.jpeg',
      name: 'Kangaroo',
      id: 7,
      description: 'Kangaroos are marsupials found in Australia.',
      sound: 'Clicking!',
    ),
    8: Animal(
      imageUrl: 'assets/images/penguin.jpeg',
      name: 'Penguin',
      id: 8,
      description: 'Penguins are a group of aquatic flightless birds.',
      sound: 'Honk!',
    ),
  };
}

class Animal {
  final String imageUrl;
  final String name;
  final int id;
  final String description;
  final String sound;

  Animal({
    required this.imageUrl,
    required this.name,
    required this.id,
    required this.description,
    required this.sound,
  });
}
