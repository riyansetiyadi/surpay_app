import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:surpay_app/widgets/navigation_bar/main_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeCardIndex = -1;
  int selectedIndexBar = 0;

  void _changeCard(int index) {
    setState(() {
      _activeCardIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone,
            size: 30,
            color: Colors.orange,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mail,
                size: 30,
                color: Colors.orange,
              )),
        ],
      ),
      bottomNavigationBar: const MainBottomBar(),
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
                    'contoh survey',
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        CustomCard(
                          index: 3,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageUrl: "https://surpay.id/images/icon.png",
                          title: 'Install Aplikasinya',
                          description: 'Instal aplikasinya di Google Play',
                        ),
                        const SizedBox(height: 12),
                        CustomCard(
                          index: 4,
                          activeIndex: _activeCardIndex,
                          onTap: _changeCard,
                          imageUrl: "https://surpay.id/images/check.png",
                          title: 'Pilih survey dan Hadiahnya',
                          description:
                              'Tiap survey akan dicantumkan hadiah undian atau hadiah langsungnya. Hadiah langsung akan masuk ke saldo anda, dan akan bisa ditarik ke rekening anda minimal Rp. 100.000,-',
                        ),
                        const SizedBox(height: 12),
                        CustomCard(
                          index: 5,
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
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.facebook,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const FaIcon(
                                FontAwesomeIcons.youtube,
                                color: Colors.blue,
                                size: 20,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
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
