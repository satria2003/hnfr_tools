import 'package:flutter/material.dart';
import 'beranda.dart';
import 'produk.dart';
import 'layanan.dart';
import 'pengaturan.dart';
import 'widgets/bottom_navbar.dart';
import 'widgets/top_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    BerandaPage(),
    ProdukPage(),
    LayananPage(),
    PengaturanPage(),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _showTopNavBar() {
    return _selectedIndex == 0 || _selectedIndex == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _showTopNavBar()
          ? const PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: TopNavBar(),
            )
          : null,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: BerandaContent(),
      ),
    );
  }
}
