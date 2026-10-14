import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const FindMyClassApp());
}

class FindMyClassApp extends StatelessWidget {
  const FindMyClassApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Find My Class',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const LandingPage(), // Ganti ke DashboardPage() jika ingin langsung melihat dashboard
    );
  }
}

// // ==========================================
// 1. LANDING / LOGIN PAGE (KIRI)
// ==========================================
class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                
                // Title
                Text(
                  'FIND MY CLASS',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                
                const SizedBox(height: 40),
                
                // Icon/Illustration (Teacher in front of board)
                const IconIllustration(),
                
                const SizedBox(height: 100),
                
                // Subtitle
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Get Started With FindMyClass',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                
                const SizedBox(height: 12),
                
                // NIM Text Field dengan background ungu muda
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCD0E4), // Ungu muda
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                        decoration: BoxDecoration(
                          color: const Color(0xFFC7B3D6), // Ungu lebih gelap sedikit
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          'NIM:',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 16),
                            hintText: 'Masukkan NIM',
                            hintStyle: TextStyle(color: Colors.black38),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
                
                // Login Buttons (SSO & Google)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Tombol SSO (Kiri) - dengan logo UMB
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DashboardPage()),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAEEEC),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/logoumb-gradient.png', // Pastikan nama file sesuai
                              height: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    
                    // Tombol Google (Kanan) - dengan logo Google
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DashboardPage()),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xFFEAEEEC),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/google.png', // Pastikan nama file sesuai
                              height: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Ilustrasi Pengajar & Siswa (Custom Drawing dengan CustomPainter atau kombinasi Icon)
class IconIllustration extends StatelessWidget {
  const IconIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Papan Tulis
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              width: 100,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.more_horiz, color: Colors.black, size: 40),
            ),
          ),
          // Guru / Pengajar (Kiri)
          Positioned(
            left: 25,
            top: 35,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  width: 32,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Tangan Guru yang menunjuk papan
          Positioned(
            left: 55,
            top: 55,
            child: Transform.rotate(
              angle: -0.5,
              child: Container(
                width: 30,
                height: 6,
                color: Colors.black,
              ),
            ),
          ),
          // Dua Siswa di kanan bawah
          Positioned(
            bottom: 15,
            right: 30,
            child: Row(
              children: [
                _buildStudentSmall(),
                const SizedBox(width: 12),
                _buildStudentSmall(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStudentSmall() {
    return Column(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 2),
        Container(
          width: 20,
          height: 15,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}


// ==========================================
// 2. DASHBOARD PAGE (KANAN)
// ==========================================
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Ungu
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFCABCD2), // Sesuai screen background
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar bulat
                      CircleAvatar(
                     radius: 26,
                     backgroundImage: AssetImage('assets/wowo.png'), // Nama file foto Anda
                          ),
                      // Tanggal Tag
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '10 October 2026',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ferry Irwandi',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '240102200',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Coba cari kelas',
                  hintStyle: const TextStyle(color: Colors.black45, fontSize: 13),
                  prefixIcon: null,
                  suffixIcon: const Icon(Icons.search, color: Colors.black54),
                  fillColor: const Color(0xFFE8DCEE),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Kategori Menu / Icons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMenuItem(Icons.unfold_more_double, 'Lantai'),
                  _buildMenuItem(Icons.business, 'Lab'),
                  _buildMenuItem(Icons.co_present, 'Kelas'),
                  _buildMenuItem(Icons.person, 'Petugas'),
                ],
              ),
            ),

            const SizedBox(height: 20),
            const Divider(thickness: 1, color: Colors.black12),

            // Kelas Kosong Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kelas Kosong Hari Ini',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),

            // List Kelas
            _buildClassCard('RKB 08.05', '14.00 - 18.00', isBooking: true),
            _buildClassCard('RKB 05.10', '10.00 - 11.45', isBooking: false),
            _buildClassCard('RKB 08.08', '08.40 - 11.40', isBooking: false),
            _buildClassCard('RKB 01.01', '08.40 - 11.40', isBooking: false),
            _buildClassCard('RKB 01.03', '08.40 - 11.40', isBooking: false),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Builder Item Menu Kategori
  Widget _buildMenuItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: Icon(icon, color: Colors.black, size: 28),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        )
      ],
    );
  }

  // Builder Kartu Kelas
  Widget _buildClassCard(String name, String time, {required bool isBooking}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE3D6E8), // Warna ungu muda list
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                time,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          // Booking Status (Checkbox check/uncheck)
          Row(
            children: [
              Icon(
                isBooking ? Icons.check_box : Icons.check_box_outline_blank,
                color: isBooking ? Colors.green[700] : Colors.black54,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Booking',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}