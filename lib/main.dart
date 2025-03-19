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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índice del menú seleccionado

  // Lista de pantallas asociadas a cada botón
  final List<Widget> _screens = [
    const InicioScreen(), // Mantiene el contenido original
    const BuscarScreen(),
    const AgregarScreen(),
    const NotificacionesScreen(),
    const PerfilScreen(),
  ];

  // Método para cambiar la pantalla cuando se selecciona un ítem
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Cambia la pantalla al tocar un botón
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Añadir'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notificaciones'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
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

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: const [
          TitleSection(),
          SizedBox(height: 20),
          CategorySection(),
        ],
      ),
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
            Opacity(opacity: 0.5, 
              child: Text(
                "Ver todo",
                style: TextStyle(fontSize:18),
              )
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
      height: 80, 
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
        mainAxisSize: MainAxisSize.min, 
        children: [
          Image.network(imagePath, width: 30),
          const SizedBox(width: 10),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

class BuscarScreen extends StatelessWidget {
  const BuscarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: Text("Página de Búsqueda", style: TextStyle(fontSize: 24)),
      child: Placeholder()
    );
  }
}

class AgregarScreen extends StatelessWidget {
  const AgregarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: Text("Página de Añadir", style: TextStyle(fontSize: 24)),
      child: Placeholder()
    );
  }
}

class NotificacionesScreen extends StatelessWidget {
  const NotificacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: Text("Página de Notificaciones", style: TextStyle(fontSize: 24)),
      child: Placeholder()
    );
  }
}

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      // child: Text("Página de Perfil", style: TextStyle(fontSize: 24)),
      child: Placeholder()
    );
  }
}