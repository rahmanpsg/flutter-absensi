import 'package:absensi/bloc/izin_bloc.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

void modalBottomSheetIzin(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    // backgroundColor: bgColor,
    builder: (BuildContext bc) {
      return Padding(
        padding: const EdgeInsets.all(20),
        child: IzinForm(),
      );
    },
  );
}

class IzinForm extends StatefulWidget {
  const IzinForm({Key? key}) : super(key: key);

  @override
  _IzinFormState createState() => _IzinFormState();
}

class _IzinFormState extends State<IzinForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final _izinBloc = BlocProvider.of<IzinBloc>(context);

    return BlocListener<IzinBloc, IzinState>(
      listener: (context, state) {
        if (state is IzinSuccess || state is IzinFailure) {
          Navigator.pop(context);

          final bool isSuccess = state is IzinSuccess;

          showModalBottomSheet(
              context: context,
              builder: (BuildContext c) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Lottie.asset(
                      'assets/animations/${isSuccess ? 'success' : 'error'}.json',
                      repeat: false,
                      height: 200,
                    ),
                    Text(
                      isSuccess
                          ? "Izin berhasil dikirim"
                          : (state as IzinFailure).message,
                      style: kHeaderStyle,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(c).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(primaryColor),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Text(
                            'Kembali',
                            style: primaryStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
        }
      },
      child: BlocBuilder<IzinBloc, IzinState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pengajuan Izin",
                style: kHeaderStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Form(
                key: _key,
                child: TextFormField(
                  autofocus: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Masukan keterangan',
                  ),
                  textInputAction: TextInputAction.done,
                  controller: _keteranganController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Keterangan tidak boleh kosong';
                    }
                    return null;
                  },
                  enabled: !(state is IzinAddLoading),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: state is IzinAddLoading
                    ? Lottie.asset('assets/animations/loading.json', height: 80)
                    : TextButton.icon(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            // _izinBloc.add(AddIzin(_keteranganController.text));
                            context
                                .read<IzinBloc>()
                                .add(AddIzin(_keteranganController.text));
                            // Navigator.pop(context);
                          }
                        },
                        icon: Icon(Icons.send),
                        label: Text("Kirim"),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.of(context).size.width * 0.3,
                          ),
                          primary: Colors.white,
                          backgroundColor: primaryColor,
                        ),
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
