import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/provider/auth_provider.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/navigation_bar/main_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeCardIndex = -1;
  int selectedIndexBar = 0;

  @override
  void initState() {
    super.initState();
    final authRead = context.read<AuthProvider>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        bool isLoggedIn = await authRead.isLoggedIn();
        if (isLoggedIn && authRead.isInitialRoute) {
          authRead.changeStatusInitialRoute();
          if (mounted) {
            context.push('/dashboard');
          }
        }
      },
    );
  }

  void _changeCard(int index) {
    setState(() {
      _activeCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      drawer: const MainDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0XFFb3e3e0),
                padding:
                    const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SURPAY',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF0355CC),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hasilkan Uang',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF0355CC),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Mudah',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF0355CC),
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Dari Handphone mu',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF0355CC),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                        'Hanya butuh 1 menit untuk menghasilkan ratusan ribu dari handphonemu. Isi surveynya, dapatkan hadiahnya'),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        onPressed: () {
                          context.push('/login');
                        },
                        child: const Text(
                          'DAFTAR DAN DAPATKAN HADIAHNYA',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 400,
                        height: 400,
                        child: Image.network(
                          'https://surpay.id/images/mbak.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'TENTANG SURPAY',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    const Text(
                      'Mari mengisi survey dengan SurPay. Dapatkan hadiah langsung dan hadiah undian yang langsung tertera jelas kapan hadiah akan diundi dan berapa besarnya. Anda juga bisa mendapatkan uang langsung dengan mengisi survey yang tertera.',
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF0355CC), // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(2), // Rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12), // Padding
                      ),
                      onPressed: () {
                        // Define your action here
                      },
                      child: const Text(
                        'READ MORE',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontWeight: FontWeight.bold, // Bold text
                          fontSize: 16, // Text size
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const Text(
                    'Langkah - Langkah',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomCard(
                          index: 0,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageUrl: "https://surpay.id/images/icon.png",
                          title: 'Install Aplikasinya',
                          description: 'Instal aplikasinya di Google Play',
                        ),
                        const SizedBox(height: 12),
                        CustomCard(
                          index: 1,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageUrl: "https://surpay.id/images/check.png",
                          title: 'Pilih survey dan Hadiahnya',
                          description:
                              'Tiap survey akan dicantumkan hadiah undian atau hadiah langsungnya. Hadiah langsung akan masuk ke saldo anda, dan akan bisa ditarik ke rekening anda minimal Rp. 100.000,-',
                        ),
                        const SizedBox(height: 12),
                        CustomCard(
                          index: 2,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageUrl: "https://surpay.id/images/win.png",
                          title: 'Cairkan hadiahnya',
                          description:
                              'Anda bisa menarik saldo anda, dan kami akan mentransfer ke rekening anda. Untuk undian, kami akan umumkan kapan undian dilaksanakan dan siapa pemenangnya.',
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF0355CC), // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(4), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12), // Padding
                    ),
                    onPressed: () {
                      // Define your action here
                    },
                    child: const Text(
                      'VIEW MORE',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontWeight: FontWeight.bold, // Bold text
                        fontSize: 16, // Text size
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Column(
                children: [
                  const Text(
                    'Contoh survey',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomCard2(
                          index: 3,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageAsset: 'assets/images/listsurvey.png',
                          description:
                              'Pilih Survey dengan Hadiah yang anda suka',
                        ),
                        const SizedBox(height: 12),
                        CustomCard2(
                          index: 4,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageAsset: 'assets/images/detailsurvey.png',
                          description: 'Isi surveynya',
                        ),
                        const SizedBox(height: 12),
                        CustomCard2(
                          index: 5,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageAsset: 'assets/images/detailsurvey.png',
                          description:
                              'Tiap bulan akan diumumkan siapa yang memenangkan hadiahnya. undian hadiah akan disiarkan secara online di youtube SurPay.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                color: const Color(0xFF0a0f43),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'FOLLOW US',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(2),
                      child: SizedBox(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final Uri mapsUri = Uri.parse(
                                    "https://www.facebook.com/share/1BZK9psQ6t/?mibextid=qi2Omg");
                                if (await canLaunchUrl(mapsUri)) {
                                  await launchUrl(
                                    mapsUri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Akun tidak ditemukan",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: const FaIcon(
                            //     FontAwesomeIcons.twitter,
                            //     color: Colors.blue,
                            //     size: 20,
                            //   ),
                            // ),
                            IconButton(
                              onPressed: () async {
                                final Uri mapsUri = Uri.parse(
                                    "https://www.youtube.com/@surpayindonesia");
                                if (await canLaunchUrl(mapsUri)) {
                                  await launchUrl(
                                    mapsUri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Could not launch Maps",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.youtube,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                final Uri mapsUri = Uri.parse(
                                    "https://www.instagram.com/surpay_indonesia/profilecard/?igsh=cmE4ZXNtZm9pMWlk");
                                if (await canLaunchUrl(mapsUri)) {
                                  await launchUrl(
                                    mapsUri,
                                    mode: LaunchMode.externalApplication,
                                  );
                                } else {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Akun tidak ditemukan",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge
                                              ?.copyWith(color: Colors.white),
                                        ),
                                        duration: const Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                }
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final int index;
  final int activeIndex;
  final Function(int) onTap;
  final String imageUrl;
  final String title;
  final String description;

  const CustomCard({
    super.key,
    required this.index,
    required this.activeIndex,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Color cardColor = (activeIndex == index) ? Colors.orange : Colors.white;
    Color textColor = (activeIndex == index) ? Colors.white : Colors.black;

    return InkWell(
      onTap: () => onTap(index),
      child: Card(
        elevation: 20,
        shadowColor: Colors.grey,
        color: cardColor,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  imageUrl,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomCard2 extends StatelessWidget {
  final int index;
  final int activeIndex;
  final Function(int) onTap;
  final String imageAsset;
  final String description;

  const CustomCard2({
    super.key,
    required this.index,
    required this.activeIndex,
    required this.onTap,
    required this.imageAsset,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    Color cardColor = (activeIndex == index) ? Colors.orange : Colors.white;
    Color textColor = (activeIndex == index) ? Colors.white : Colors.black;

    return InkWell(
      onTap: () => onTap(index),
      child: Card(
        elevation: 20,
        shadowColor: Colors.grey,
        color: cardColor,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imageAsset,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
