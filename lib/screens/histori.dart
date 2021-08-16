import 'package:absensi/bloc/histori_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/cardHistori.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HistoriScreen extends StatelessWidget {
  const HistoriScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);

    List<String> listBulan = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    final int tahun = DateTime.now().year;

    List<String> listTahun =
        List.generate(3, (index) => (tahun - index).toString());

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
      body: BlocBuilder<HistoriBloc, HistoriState>(
        builder: (context, state) {
          print(state);
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    _dropDownButton(
                      value: state.bulan,
                      list: listBulan,
                      hint: '- Pilih Bulan -',
                      width: (mediaQuery.size.width / 100) * 45.0,
                      callback: (String? value) async {
                        context
                            .read<HistoriBloc>()
                            .add(ChangeBulan(value ?? ''));
                        if (state.tahun != '')
                          context.read<HistoriBloc>().add(HistoriLoaded(
                              bulan: value ?? '', tahun: state.tahun));
                      },
                    ),
                    SizedBox(width: 5),
                    _dropDownButton(
                      value: state.tahun,
                      list: listTahun,
                      hint: '- Pilih Tahun -',
                      width: (mediaQuery.size.width / 100) * 40.0,
                      callback: (String? value) {
                        context
                            .read<HistoriBloc>()
                            .add(ChangeTahun(value ?? ''));
                        if (state.bulan != '')
                          context.read<HistoriBloc>().add(HistoriLoaded(
                              bulan: state.bulan, tahun: value ?? ''));
                      },
                    ),
                  ],
                ),
              ),
              state is HistoriIsLoaded
                  ? state.historis.length > 0
                      ? Expanded(
                          child: ListView.builder(
                              padding: EdgeInsets.all(20),
                              shrinkWrap: true,
                              itemCount: state.historis.length,
                              itemBuilder: (context, index) {
                                return CardHistori(
                                  histori: state.historis[index],
                                );
                              }),
                        )
                      : _empty()
                  : state is HistoriLoading
                      ? Lottie.asset('assets/animations/loading.json')
                      : _search(),
            ],
          );
        },
      ),
    );
  }
}

Widget _empty() {
  return Column(
    children: <Widget>[
      Lottie.asset(
        'assets/animations/empty.json',
        height: 250,
      ),
      Text('Tidak ada data yang ditemukan')
    ],
  );
}

Widget _search() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Lottie.asset(
        'assets/animations/search.json',
        height: 300,
      ),
      Text('Silahkan pilih bulan dan tahun terlebih dahulu')
    ],
  );
}

Widget _dropDownButton({
  required String? value,
  required List<String> list,
  required String hint,
  required double width,
  required Function(String?) callback,
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
        width: width,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value == '' ? null : value,
              iconEnabledColor: Colors.white,
              hint: Text(hint,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  )),
              onChanged: callback,
              items: list.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
