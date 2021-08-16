import 'package:absensi/bloc/izin_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/cardIzin.dart';
import 'package:absensi/widgets/modalIzin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class IzinScreen extends StatelessWidget {
  const IzinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Izin",
          style: primaryStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          modalBottomSheetIzin(context);
        },
      ),
      body: BlocBuilder<IzinBloc, IzinState>(
        builder: (context, state) {
          print("=====> $state");
          return state is IzinLoading
              ? Center(child: Lottie.asset('assets/animations/loading.json'))
              : state is IzinIsEmpty
                  ? Center(child: _empty())
                  : ListView.builder(
                      // itemCount: 5,
                      itemCount: state.izins.length,
                      itemBuilder: (context, index) {
                        return CardIzin(
                          tanggal: DateFormat('dd MMMM yyyy kk:mm a').format(
                            state.izins[index].createdAt!.add(
                              Duration(hours: 8),
                            ),
                          ),
                          keterangan: state.izins[index].keterangan,
                        );
                      });
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
      Text('Anda belum memiliki data izin')
    ],
  );
}
