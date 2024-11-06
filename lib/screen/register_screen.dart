import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/models/province_district_model.dart';
import 'package:surpay_app/models/subdistrict_model.dart';
import 'package:surpay_app/provider/address_provider.dart';
import 'package:surpay_app/widgets/navigation_bar/main_bottom_bar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _postalCodeController = TextEditingController();
  String? selectedGender;
  String? selectedProvince;
  String? selectedCity;
  String? selectedSubdistrict;
  String? selectedVillage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: const MainBottomBar(
        initiateIndex: 1,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Consumer<AddressProvider>(builder: (context, state, _) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Daftar',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        // No. HP
                        buildTextField(
                            'No. HP', 'Selanjutnya akan digunakan untuk login'),
                        const SizedBox(height: 16),

                        // Password
                        buildTextField('Password', 'Password',
                            obscureText: true),
                        const SizedBox(height: 16),

                        // Nama Lengkap
                        buildTextField(
                            'Nama Lengkap', 'Masukkan Nama lengkap anda'),
                        const SizedBox(height: 16),

                        // Tahun Lahir
                        buildTextField('Tahun Lahir', '',
                            keyboardType: TextInputType.number),
                        const SizedBox(height: 16),

                        // Jenis Kelamin
                        buildDropdownField('Jenis Kelamin', selectedGender,
                            ['Laki-laki', 'Perempuan'], (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        }),
                        const SizedBox(height: 16),

                        // Provinsi
                        buildDropdownField(
                          'Provinsi',
                          selectedProvince,
                          state.provinces
                              .map<String>((district) => district.name)
                              .toList(),
                          (value) async {
                            setState(() {
                              selectedProvince = value;
                              selectedCity = null;
                            });
                            ProvinceDistrictModel? province =
                                await state.getProvinceByName(value ?? '');
                            String? idProvince = province?.id;
                            if (idProvince != null)
                              state.getDistrict(idProvince);
                          },
                        ),
                        const SizedBox(height: 16),

                        // Kota/Kabupaten
                        buildDropdownField(
                          'Kota/Kabupaten',
                          selectedCity,
                          state.districts
                              .map<String>((subdistrict) => subdistrict.name)
                              .toList(),
                          (value) async {
                            setState(() {
                              selectedCity = value;
                              selectedSubdistrict = null;
                            });
                            ProvinceDistrictModel? district =
                                await state.getDistrictByName(value ?? '');
                            String? idDistrict = district?.id;
                            if (idDistrict != null) {
                              state.getSubdistrict(idDistrict);
                            }
                          },
                        ),
                        const SizedBox(height: 16),

                        // Kecamatan
                        buildDropdownField('Kecamatan', selectedSubdistrict,
                            state.subdistrictsUnique, (value) {
                          setState(() {
                            selectedSubdistrict = value;
                            selectedVillage = null;
                          });

                          state.getVillage(value ?? '');
                        }),
                        const SizedBox(height: 16),

                        // Desa/Kelurahan
                        buildDropdownField(
                          'Desa/Kelurahan',
                          selectedVillage,
                          state.villages
                              .map((village) => village.kelurahan)
                              .toList(),
                          (value) async {
                            SubdistrictModel? village =
                                await state.getVillageByName(value);

                            setState(() {
                              selectedVillage = value;
                              _postalCodeController.text =
                                  village?.kodepos ?? '';
                            });
                          },
                        ),
                        const SizedBox(height: 16),

                        // Kode Pos
                        buildTextField('Kode Pos', 'Masukkan kode pos',
                            keyboardType: TextInputType.number,
                            controller: _postalCodeController),
                        const SizedBox(height: 16),

                        // Alamat Rumah
                        buildTextField(
                            'Alamat Rumah (Dusun, RT, RW)', 'Masukkan alamat',
                            maxLines: 3),
                        const SizedBox(height: 16),

                        // Button "Selanjutnya"
                        ElevatedButton.icon(
                          onPressed: () {
                            // Aksi ketika tombol Selanjutnya ditekan
                          },
                          icon: const Icon(
                            Icons.arrow_circle_right_outlined,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Selanjutnya',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Link "Sudah Punya Akun?"
                        TextButton(
                          onPressed: () {
                            context.push('/login');
                          },
                          child: const Text(
                            'Sudah Punya Akun ?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),

                        // Button "Ajukan Pendaftaran"
                        ElevatedButton(
                          onPressed: () {
                            // Aksi ketika tombol Ajukan Pendaftaran ditekan
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            'Ajukan Pendaftaran',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    String label,
    String hint, {
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextFormField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildDropdownField(String label, String? value, List<String> items,
      ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          hint: const Text('Pilih'),
        ),
      ],
    );
  }
}
