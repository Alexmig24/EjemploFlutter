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
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded), label: 'Añadir'),
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
          SizedBox(height: 5),
          CategorySection(),
          SizedBox(height: 5),
          LiveCoocking(),
          SizedBox(height: 5),
          TopChef(),
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
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Categorías",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              "Ver todo",
              style: TextStyle(color: Color.fromRGBO(180, 180, 180, 1)),
            )
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
        child: Container( 
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, 
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

class TopChef extends StatelessWidget {
  const TopChef({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final jsonchef = [
      {'img': 'https://plus.unsplash.com/premium_photo-1689568158814-3b8e9c1a9618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D',},
      {'img': 'https://plus.unsplash.com/premium_photo-1689568158814-3b8e9c1a9618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D',},
      {'img': 'https://plus.unsplash.com/premium_photo-1689568158814-3b8e9c1a9618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D',},
      {'img': 'https://plus.unsplash.com/premium_photo-1689568158814-3b8e9c1a9618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D',},
      {'img': 'https://plus.unsplash.com/premium_photo-1689568158814-3b8e9c1a9618?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGVyc29uYXxlbnwwfHwwfHx8MA%3D%3D',},
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Chef',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'View All',
              style: TextStyle(color: Color.fromRGBO(180, 180, 180, 1)),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              spacing: 10,
              children: jsonchef.map(
                (chef) => TopChefContainer(
                  img: chef['img']!)
                ).toList(),
            )
          ),
        )
      ],
    );
  }
}

class TopChefContainer extends StatelessWidget {
  const TopChefContainer({
    required this.img,
    super.key,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(img),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(25)
      ),
      width: 100,
      height: 180,
    );
  }
}

class LiveCoocking extends StatelessWidget {
  const LiveCoocking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final jsonlivecocking = [
      {
        'imgFondo': 'https://img.hellofresh.com/w_3840,q_auto,f_auto,c_fill,fl_lossy/hellofresh_website/es/cms/SEO/recipes/albondigas-caseras-de-cerdo-con-salsa-barbacoa.jpeg',
        'imgPerfil': 'https://static.vecteezy.com/system/resources/thumbnails/025/267/741/small_2x/male-chef-portrait-side-view-suitable-for-avatar-social-media-profile-photo-graphic-vector.jpg',
        'userPerfil': 'Jeff Mcinnis',
        'titulo': 'Special Strand Pasta',
      },
      {
        'imgFondo': 'https://img.hellofresh.com/w_3840,q_auto,f_auto,c_fill,fl_lossy/hellofresh_website/es/cms/SEO/recipes/albondigas-caseras-de-cerdo-con-salsa-barbacoa.jpeg',
        'imgPerfil': 'https://static.vecteezy.com/system/resources/thumbnails/025/267/741/small_2x/male-chef-portrait-side-view-suitable-for-avatar-social-media-profile-photo-graphic-vector.jpg',
        'userPerfil': 'Jeff Mcinnis',
        'titulo': 'Special Strand Pasta',
      },
      {
        'imgFondo': 'https://img.hellofresh.com/w_3840,q_auto,f_auto,c_fill,fl_lossy/hellofresh_website/es/cms/SEO/recipes/albondigas-caseras-de-cerdo-con-salsa-barbacoa.jpeg',
        'imgPerfil': 'https://static.vecteezy.com/system/resources/thumbnails/025/267/741/small_2x/male-chef-portrait-side-view-suitable-for-avatar-social-media-profile-photo-graphic-vector.jpg',
        'userPerfil': 'Jeff Mcinnis',
        'titulo': 'Special Strand Pasta',
      },
    ];

    return Column(
      children: [
        Row(
          children: [
            Expanded( // Evita que el Row interno empuje demasiado
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Live Cooking',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      LiveLabel(),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'View All',
              style: TextStyle(color: Color.fromRGBO(180, 180, 180, 1)),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              spacing: 10,
              children:
                jsonlivecocking.map(
                  (livecoocking) => CocinaContenedor(
                    imgFondo: livecoocking['imgFondo']!,
                    imgPerfil: livecoocking['imgPerfil']!,
                    userPerfil: livecoocking['userPerfil']!,
                    titulo: livecoocking['titulo']!,
                  )
                ).toList(),
            ),
          ),
        )
      ],
    );
  }
}

class CocinaContenedor extends StatelessWidget {
  final String imgFondo; 
  final String imgPerfil;
  final String userPerfil;
  final String titulo;

  const CocinaContenedor({
    super.key, 
    required this.imgPerfil, 
    required this.imgFondo,
    required this.userPerfil,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imgFondo),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Color.fromARGB(40, 0, 0, 0), BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(20)
      ),
      width: 250,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetUser(
              imgPerfil: imgPerfil,
              userPerfil: userPerfil,
            ),
            Text(
              titulo,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WidgetUserstream(
                  imgPerfil: imgPerfil,
                ),
                Icon(Icons.fullscreen, color: Colors.white,)
              ],
            )
          ],
        ),
    );
  }
}

class WidgetUserstream extends StatelessWidget {
  const WidgetUserstream({
    required this.imgPerfil,
    super.key,
  });

  final String imgPerfil;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(248, 227, 209, 1),
      ),
      height: 25,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              WidgetImgProfile(perfil: imgPerfil),
              Positioned(
                left: 12, // Desplazamiento horizontal
                child: WidgetImgProfile(perfil: imgPerfil),
              ),
              Positioned(
                left: 24, // Desplazamiento horizontal
                child: WidgetImgProfile(perfil: imgPerfil),
              ),
              const SizedBox(width: 55),
            ],
          ),
          
          Text('+ 99 k'),
        ],
      ),
    );
  }
}

class WidgetUser extends StatelessWidget {
  const WidgetUser({
    super.key,
    required this.imgPerfil,
    required this.userPerfil,
  });

  final String imgPerfil;
  final String userPerfil;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(200, 200, 200, 0.6),
      ),
      height: 35,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          WidgetImgProfile(
            perfil: imgPerfil,
          ),
          Text(
            userPerfil,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class WidgetImgProfile extends StatelessWidget {
  final String perfil;

  const WidgetImgProfile({
    super.key, 
    required this.perfil,
  });

  @override
  Widget build(BuildContext context) {
    double altura = 25;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(perfil),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(altura),
      ),
      width: altura,
      height: altura,
    );
  }
}

class LiveLabel extends StatelessWidget {
  const LiveLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(255, 210, 215, 0.8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        spacing: 3,
        children: [
          Icon(Icons.adjust_sharp, size: 18, color: Colors.red),
          Text('500 Live'),
        ],
      ),
    );
  }
}