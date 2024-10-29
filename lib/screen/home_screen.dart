import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mail,
                size: 30,
              )),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const Text('SURPAY'),
                  const Column(
                    children: [
                      Text('Hasilkan Uang'),
                      Text('Mudah'),
                      Text('Dari Handphone mu'),
                    ],
                  ),
                  const Text(
                      'Hanya butuh 1 menit untuk menghasilkan ratusan ribu dari handphonemu. Isi surveynya, dapatkan hadiahnya'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Rounded corners
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12), // Padding
                    ),
                    onPressed: () {
                      context.go(
                        Uri(
                          path: '/webview',
                          queryParameters: {
                            'url': 'https://surpay.id/user/login.php'
                          },
                        ).toString(),
                      );
                    },
                    child: const Text(
                      'DAFTAR DAN DAPATKAN HADIAHNYA',
                      style: TextStyle(
                        color: Colors.white, // Text color
                        fontWeight: FontWeight.bold, // Bold text
                        fontSize: 16, // Text size
                      ),
                    ),
                  ),
                  Image.network('https://surpay.id/images/mbak.png')
                ],
              ),
              Column(
                children: [
                  const Text('Tentang SurPay'),
                  const Text(
                      'Mari mengisi survey dengan SurPay. Dapatkan hadiah langsung dan hadiah undian yang langsung tertera jelas kapan hadiah akan diundi dan berapa besarnya. Anda juga bisa mendapatkan uang langsung dengan mengisi survey yang tertera.'),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
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
              Column(
                children: [
                  const Text('Langkah - Langkah'),
                  Column(
                    children: [
                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.network(
                                    "https://surpay.id/images/icon.png"),
                                const Text(
                                  'Instal Aplikasinya',
                                ),
                                const Text('instal aplikasinya di googleplay'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.network(
                                    "https://surpay.id/images/check.png"),
                                const Text(
                                  'Pilih survey dan Hadiahnya',
                                ),
                                const Text(
                                    'Tiap survey akan dicantumkan hadiah undian atau hadiah langsungnya. Hadiah langsung akan masuk ke saldo anda, dan akan bisa ditarik ke rekening anda minimal Rp. 100.000,-'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.network(
                                    "https://surpay.id/images/win.png"),
                                const Text(
                                  'Cairkan hadiahnya',
                                ),
                                const Text(
                                    'Anda bisa menarik saldo anda, dan kami akan mentrasfer ke rekening anda. untuk undian, kami akan umumkan kapan undian dilaksanakan dan siapa pemenangnya.'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button background color
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
              Column(
                children: [
                  const Text('Contoh survey'),
                  Column(
                    children: [
                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.network(
                                    "https://surpay.id/images/icon.png"),
                                const Text(
                                  'Pilih Survey dengan Hadiah yang anda suka',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.network(
                                    "https://surpay.id/images/check.png"),
                                const Text(
                                  'isi surveynya',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 50,
                        shadowColor: Colors.black,
                        color: Colors.greenAccent[100],
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Image.network(
                                    "https://surpay.id/images/win.png"),
                                const Text(
                                  'Tiap bulan akan diumumkan siapa yang memenangkan hadiahnya. undian hadiah akan disiarkan secara online di youtube SurPay.',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('Follow Us'),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.facebook)),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.twitter)),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.youtube)),
                      IconButton(
                          onPressed: () {},
                          icon: const FaIcon(FontAwesomeIcons.instagram)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
