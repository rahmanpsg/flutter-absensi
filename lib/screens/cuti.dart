import 'package:absensi/bloc/cuti_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:absensi/widgets/cardCuti.dart';
import 'package:absensi/widgets/modalCuti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CutiScreen extends StatelessWidget {
  const CutiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cutiBloc = BlocProvider.of<CutiBloc>(context);

    RefreshController _refreshController =
        RefreshController(initialRefresh: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cuti",
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
          modalBottomSheetCuti(context);
        },
      ),
      body: BlocListener<CutiBloc, CutiState>(
        listener: (context, state) {
          print("=====> $state");
          if (state is CutiSuccess || state is CutiFailure) {
            _refreshController.refreshCompleted();
          }
        },
        child: BlocBuilder<CutiBloc, CutiState>(
          builder: (context, state) {
            return state is CutiLoading
                ? Center(child: Lottie.asset('assets/animations/loading.json'))
                : state is CutiIsEmpty
                    ? Center(child: _empty())
                    : SmartRefresher(
                        controller: _refreshController,
                        onRefresh: () async {
                          _cutiBloc.add(CutiLoaded());

                          // await Future.delayed(Duration(milliseconds: 1000));
                        },
                        child: ListView.builder(
                            // itemCount: 5,
                            itemCount: state.cutis.length,
                            itemBuilder: (context, index) {
                              return CardCuti(
                                tanggal: state.cutis[index].tanggal,
                                keterangan: state.cutis[index].keterangan,
                                diterima: state.cutis[index].diterima,
                              );
                            }),
                      );
          },
        ),
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
      Text('Anda belum memiliki data cuti')
    ],
  );
}
