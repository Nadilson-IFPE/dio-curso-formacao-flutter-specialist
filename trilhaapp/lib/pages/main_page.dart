import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/pagina1.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/pagina3.dart';
import 'package:trilhaapp/shared/widgets/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
          foregroundColor: Colors.white,
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(
                    () {
                      posicaoPagina = value;
                    },
                  );
                },
                children: const [
                  Pagina1(),
                  Pagina2(),
                  Pagina3(),
                ],
              ),
            ),
            BottomNavigationBar(
              onTap: (value) {
                controller.jumpToPage(value);
              },
              currentIndex: posicaoPagina,
              items: const [
                BottomNavigationBarItem(
                  label: "Pagina1",
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: "Pagina2",
                  icon: Icon(Icons.add),
                ),
                BottomNavigationBarItem(
                  label: "Pagina3",
                  icon: Icon(Icons.person),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
