import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      // 1.- Escuchando
      currentIndex: navegacionModel.paginaActual,
      // 2.- Actualizando
      onTap: (i) => navegacionModel.paginaActual = i,
      // 3.- Redibujando
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text('Menu 1'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text('Menu 2'),
        ),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}

// Clase que notificara a los Widget cuando redibujarse
// Estructura de un Provider Basico
class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor, duration: Duration(milliseconds: 250), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
