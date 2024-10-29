import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color _cardColor = Colors.white;
  Color _cardColor1 = Colors.white;
  Color _cardColor2 = Colors.white;
  Color _cardColor3 = Colors.white;
  Color _cardColor4 = Colors.white;
  Color _cardColor5 = Colors.white;

  void _changeColor() {
    setState(() {
      _cardColor = _cardColor == Colors.white ? Colors.orange : Colors.white;
    });
  }
  void _changeColor1() {
    setState(() {
      _cardColor1 = _cardColor1 == Colors.white ? Colors.orange : Colors.white;
    });
  }
  void _changeColor2() {
    setState(() {
      _cardColor2 = _cardColor2 == Colors.white ? Colors.orange : Colors.white;
    });
  }
  void _changeColor3() {
    setState(() {
      _cardColor3 = _cardColor3 == Colors.white ? Colors.orange : Colors.white;
    });
  }
    void _changeColor4() {
    setState(() {
      _cardColor4 = _cardColor4 == Colors.white ? Colors.orange : Colors.white;
    });
  }
  void _changeColor5() {
    setState(() {
      _cardColor5 = _cardColor5 == Colors.white ? Colors.orange : Colors.white;
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0XFFb3e3e0),
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
                    SizedBox(height: 20),
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
                    SizedBox(height: 16),
                    const Text(
                        'Hanya butuh 1 menit untuk menghasilkan ratusan ribu dari handphonemu. Isi surveynya, dapatkan hadiahnya'),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.orange, // Button background color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12), // Padding
                        ),
                        onPressed: () {},
                        child: const Text(
                          'DAFTAR DAN DAPATKAN HADIAHNYA',
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontWeight: FontWeight.bold, // Bold text
                            fontSize: 16, // Text size
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
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
              SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF0355CC), // Button background color
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
              SizedBox(height: 20),
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
                        InkWell(
                          onTap: _changeColor,
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.grey,
                            color: _cardColor,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://surpay.id/images/icon.png",
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Install Aplikasinya',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'instal aplikasinya di Google Play',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        InkWell(
                          onTap: _changeColor1,
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.grey,
                            color: _cardColor1,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://surpay.id/images/check.png",
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Pilih survey dan Hadiahnya',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Tiap survey akan dicantumkan hadiah undian atau hadiah langsungnya. Hadiah langsung akan masuk ke saldo anda, dan akan bisa ditarik ke rekening anda minimal Rp. 100.000,-',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        InkWell(
                          onTap: _changeColor2,
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.grey,
                            color: _cardColor2,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.network(
                                      "https://surpay.id/images/win.png",
                                      width: 200,
                                      height: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Cairkan hadiahnya',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 5),
                                    const Text(
                                      'Anda bisa menarik saldo anda, dan kami akan mentrasfer ke rekening anda. untuk undian, kami akan umumkan kapan undian dilaksanakan dan siapa pemenangnya.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF0355CC), // Button background color
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
              SizedBox(
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
                        InkWell(
                          onTap: _changeColor3,
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.grey,
                            color: _cardColor3,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Pilih survey dengan Hadiah yang anda suka',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        InkWell(
                          onTap: _changeColor4,
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.grey,
                            color: _cardColor4,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      'isi surveynya',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        InkWell(
                          onTap: _changeColor5,
                          child: Card(
                            elevation: 20,
                            shadowColor: Colors.grey,
                            color: _cardColor5,
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      'Tiap bulan akan diumumkan siapa yang memenangkan hadiahnya. undian hadiah akan disiarkan secara online di youtube SurPay.',
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                color: Color(0xFF0a0f43),
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
                    SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(2),
                      child: Container(
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
