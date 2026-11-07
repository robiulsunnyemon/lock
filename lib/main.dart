// ignore_for_file: deprecated_member_use
import 'package:bd_locations/bd_locations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const BdAddressPicker(),
    );
  }
}


class BdAddressPicker extends StatefulWidget {
  const BdAddressPicker({super.key});

  @override
  State<BdAddressPicker> createState() => _BdAddressPickerState();
}

class _BdAddressPickerState extends State<BdAddressPicker> {
  Division? selectedDivision;
  District? selectedDistrict;
  Upazila? selectedUpazila;
  Union? selectedUnion;

  @override
  Widget build(BuildContext context) {
    final districts = selectedDivision?.districts ?? const [];
    final upazilas = selectedDistrict?.upazilas ?? const [];
    final unions = selectedUpazila?.unions ?? const [];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButtonFormField<Division>(
            value: selectedDivision,
            hint: const Text('Select Division (বিভাগ নির্বাচন করুন)'),
            items: BdLocations.divisions.map((div) {
              return DropdownMenuItem(
                value: div,
                child: Text('${div.nameBn} (${div.nameEn})'),
              );
            }).toList(),
            onChanged: (division) {
              setState(() {
                selectedDivision = division;
                selectedDistrict = null;
                selectedUpazila = null;
                selectedUnion = null;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<District>(
            value: selectedDistrict,
            hint: const Text('Select District (জেলা নির্বাচন করুন)'),
            items: districts.map((dist) {
              return DropdownMenuItem(
                value: dist,
                child: Text('${dist.nameBn} (${dist.nameEn})'),
              );
            }).toList(),
            onChanged: (district) {
              setState(() {
                selectedDistrict = district;
                selectedUpazila = null;
                selectedUnion = null;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<Upazila>(
            value: selectedUpazila,
            hint: const Text('Select Upazila (উপজেলা নির্বাচন করুন)'),
            items: upazilas.map((upa) {
              return DropdownMenuItem(
                value: upa,
                child: Text('${upa.nameBn} (${upa.nameEn})'),
              );
            }).toList(),
            onChanged: (upazila) {
              setState(() {
                selectedUpazila = upazila;
                selectedUnion = null;
              });
            },
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<Union>(
            value: selectedUnion,
            hint: const Text('Select Union (ইউনিয়ন নির্বাচন করুন)'),
            items: unions.map((uni) {
              return DropdownMenuItem(
                value: uni,
                child: Text('${uni.nameBn} (${uni.nameEn})'),
              );
            }).toList(),
            onChanged: (union) {
              setState(() => selectedUnion = union);
            },
          ),
        ],
      ),
    );
  }
}
