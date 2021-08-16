import 'package:absensi/bloc/cuti_bloc.dart';
import 'package:absensi/models/cuti_models.dart';
import 'package:absensi/styles/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

void modalBottomSheetCuti(BuildContext context) {
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
        child: CutiForm(),
      );
    },
  );
}

class CutiForm extends StatefulWidget {
  const CutiForm({Key? key}) : super(key: key);

  @override
  _CutiFormState createState() => _CutiFormState();
}

class _CutiFormState extends State<CutiForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _tanggalController = TextEditingController();
  final _keteranganController = TextEditingController();

  DateTime selectedDate = DateTime.now().add(const Duration(days: 1));

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      print("=====> $picked");
      setState(() {
        selectedDate = picked;
        _tanggalController.text = DateFormat('dd-MM-yyyy').format(picked);
        FocusScope.of(context).nextFocus();
        // "${picked.day}-${picked.month}-${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final _izinBloc = BlocProvider.of<IzinBloc>(context);

    return BlocListener<CutiBloc, CutiState>(
      listener: (context, state) {
        if (state is CutiSuccess || state is CutiFailure) {
          Navigator.pop(context);

          final bool isSuccess = state is CutiSuccess;

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
                          ? "Cuti berhasil dikirim"
                          : (state as CutiFailure).message,
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
      child: BlocBuilder<CutiBloc, CutiState>(
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pengajuan Cuti",
                style: kHeaderStyle.copyWith(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Form(
                key: _key,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _tanggalController,
                      decoration: InputDecoration(
                        hintText: '- Pilih Tanggal Cuti -',
                      ),
                      onTap: () {
                        _selectDate(context);
                      },
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tanggal tidak boleh kosong';
                        }
                        return null;
                      },
                      enabled: !(state is CutiAddLoading),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
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
                      enabled: !(state is CutiAddLoading),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: state is CutiAddLoading
                    ? Lottie.asset('assets/animations/loading.json', height: 80)
                    : TextButton.icon(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            final cuti = new CutiModel(
                                tanggal: _tanggalController.text,
                                keterangan: _keteranganController.text,
                                diterima: null);

                            context.read<CutiBloc>().add(AddCuti(cuti));
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
