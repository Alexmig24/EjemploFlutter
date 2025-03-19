import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: const [
            TitleSection(),
            SizedBox(height: 20),
            CategorySection(),
            
          ],
        ),
      ),
      bottomNavigationBar: const MenuSection(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            'https://cdn-icons-png.flaticon.com/512/3577/3577429.png',
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {
            // Acción al presionar el ícono de búsqueda
          },
        ),
      ],
    );
  }
}


class TitleSection extends StatelessWidget {
  const TitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "¿Qué deseas comprar hoy?",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categorías",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ver todo",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Hogar", "image": "https://cdn-icons-png.flaticon.com/512/6694/6694730.png"},
      {"title": "Tecnología", "image": "https://static.vecteezy.com/system/resources/previews/010/349/834/non_2x/digital-native-technology-color-icon-illustration-vector.jpg"},
      {"title": "Herramientas", "image": "https://cdn-icons-png.flaticon.com/512/2282/2282315.png"},
      {"title": "Cocina", "image": "https://cdn-icons-png.flaticon.com/512/1140/1140049.png"},
      {"title": "Juguetes", "image": "https://cdn-icons-png.flaticon.com/512/2540/2540955.png"},
    ];

    return SizedBox(
      height: 80, // Define una altura adecuada para la sección
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories
              .map((category) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CategoryButton(
                      text: category["title"]!,
                      imagePath: category["image"]!,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String text;
  final String imagePath;

  const CategoryButton({super.key, required this.text, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 247, 228, 213),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ajusta el tamaño del contenedor al contenido
        children: [
          Image.network(imagePath, width: 30),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      
      type: BottomNavigationBarType.fixed, // Evita cambios de tamaño
      selectedItemColor: Colors.orange, // Color del icono seleccionado
      unselectedItemColor: Colors.grey, // Color de iconos no seleccionados
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        BottomNavigationBarItem(icon: Icon(Icons.hdr_plus), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.campaign), label: 'Favoritos'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
      ],
    );
  }
}