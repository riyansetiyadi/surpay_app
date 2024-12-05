import 'package:flutter/material.dart';
import 'package:surpay_app/widgets/drawer/main_drawer.dart';
import 'package:surpay_app/widgets/navigation_bar/user_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserAppBar(),
      drawer: const MainDrawer(),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Temukan Kami',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          final Uri mapsUri = Uri.parse(
                              "https://www.google.com/maps?ll=-8.082487,113.222733&z=13&t=m&hl=id&gl=ID&mapclient=embed&cid=14695811650495879814");
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 217, 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Lihat Lokasi Kami',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Image(
                          image: NetworkImage(
                              'https://surpay.id/user/assets/loc.png'),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Kab. Lumajang, Jawa Timur',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Image(
                            image: NetworkImage(
                                'https://surpay.id/user/assets/email.png'),
                            width: 30,
                            height: 30),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'solverra.aplikasi@gmail.com',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Row(
                      children: [
                        Image(
                            image: NetworkImage(
                                'https://surpay.id/user/assets/wa.png'),
                            width: 30,
                            height: 30),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '0823-3534-4285',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      children: [
                        Image(
                          image: NetworkImage(
                            'https://surpay.id/user/assets/ig.png',
                          ),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '@surpay.indonesia',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Copyrights © 2023 - >IT Solverra.')
          ],
        ),
      ),
    );
  }
}
