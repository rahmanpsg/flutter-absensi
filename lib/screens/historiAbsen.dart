import 'package:absensi/models/histori_models.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/cardHistori.dart';
import 'package:flutter/material.dart';

class HistoriScreen extends StatelessWidget {
  const HistoriScreen({Key? key}) : super(key: key);

  Widget _dropDownButton({
    required List<String> list,
    required String hint,
    required double width,
  }) {
    return Container(
      decoration: kBoxDecorationStyle.copyWith(
        color: secondaryColor,
      ),
      alignment: Alignment.centerLeft,
      height: 60.0,
      width: width,
      child: Center(
        child: SizedBox(
          width: width - 10,
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                // value: 'Januari',
                iconEnabledColor: Colors.white,
                hint: Text(hint,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
                onChanged: (String? newValue) {
                  // setState(() {
                  //   dropdownValue = newValue!;
                  // });
                },
                items: list.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> list = ['Januari', 'Februari'];

    List<HistoriModel> listHistori = [
      HistoriModel(
        tanggal: '30 Juli 2021',
        jamDatang: '08:30',
        infoDatang: 'Datang terlambat',
        jamPulang: '14:00',
        infoPulang: 'Pulang cepat',
      ),
      HistoriModel(
        tanggal: '30 Juli 2021',
        jamDatang: '08:30',
        infoDatang: 'Datang terlambat',
        jamPulang: '14:00',
        infoPulang: 'Pulang cepat',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histori Absen',
          style: primaryStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                _dropDownButton(
                  list: list,
                  hint: '- Pilih Bulan -',
                  width: 220,
                ),
                SizedBox(width: 5),
                _dropDownButton(
                  list: list,
                  hint: '- Pilih Tahun -',
                  width: 150,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: EdgeInsets.all(20),
                shrinkWrap: true,
                itemCount: listHistori.length,
                itemBuilder: (context, index) {
                  return CardHistori(
                    histori: listHistori[index],
                  );
                }),
          )
        ],
      ),
    );
  }
}
