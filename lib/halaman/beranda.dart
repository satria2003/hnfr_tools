import 'package:flutter/material.dart';
import 'produk.dart';
import 'layanan.dart';
import 'pengaturan.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  final int _selectedIndex = 0;

  final List<Widget> _pages = const [
    BerandaContent(),
    ProdukPage(),
    LayananPage(),
    PengaturanPage(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      backgroundColor: const Color(0xFFDCD7C9),
      
    );
  }
}

class BerandaContent extends StatelessWidget {
  const BerandaContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF4D5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    width: 70,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 40, color: Colors.grey);
                    },
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text(
                      'Lengkapi Ruang, Ciptakan Kenyamanan!',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Produk Baru',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildProductCard(context, 'assets/lemari.png', 'Lemari', 'Baru', 'Rp5.600.000'),
                _buildProductCard(context, 'assets/meja.png', 'Meja', 'Baru', 'Rp2.300.000'),
                _buildProductCard(context, 'assets/lampu.png', 'Lampu', 'Baru', 'Rp650.000'),
                _buildProductCard(context, 'assets/karpet.png', 'Karpet', 'Baru', 'Rp1.200.000'),
                _buildProductCard(context, 'assets/sofa.png', 'Sofa', 'Baru', 'Rp3.000.000'),
                _buildProductCard(context, 'assets/pajangan.png', 'Pajangan', 'Baru', 'Rp800.000'),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Produk Diskon',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                _buildProductCard(context, 'assets/kursi.png', 'Kursi', '30%', 'Rp1.050.000'),
                _buildProductCard(context, 'assets/rak.png', 'Rak', '25%', 'Rp450.000'),
                _buildProductCard(context, 'assets/jam.png', 'Jam', '10%', 'Rp320.000'),
                _buildProductCard(context, 'assets/laci.png', 'Laci', '15%', 'Rp780.000'),
                _buildProductCard(context, 'assets/cermin.png', 'Cermin', '20%', 'Rp950.000'),
                _buildProductCard(context, 'assets/bantal.png', 'Bantal', '35%', 'Rp300.000'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, String image, String title, String label, String price) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 42) / 2,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 80,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
                  ),
                );
              },
            ),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: label == 'Baru' ? Colors.green[100] : Colors.orange[100],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: label == 'Baru' ? Colors.green : Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text('$title.....', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              price,
              style: TextStyle(
                color: label == 'Baru' ? Colors.green : Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
