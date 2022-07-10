import 'package:capstone/screens/history/detail_transaksi/detail_transaksi_viewmodel.dart';
import 'package:capstone/screens/widget/preferences.dart';
import 'package:capstone/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  String idTransaction;
  DetailScreen({Key? key, required this.idTransaction}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String token = '';

  Future getData() async {
    // await Future.delayed(Duration(seconds: 2));
    SharedPref sharedPref = SharedPref();
    String tokens = await sharedPref.read("token");

    setState(() {
      token = tokens.replaceAll('"', '');
    });

    return "done getting history";
  }

  @override
  void initState() {
    // TODO: implement initState
    getData().then((value){
      print(value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DetailHistoryViewModel modelView =
        Provider.of<DetailHistoryViewModel>(context);
    String date = "${modelView.detailHistory!.createdat}";
    DateTime parseDate =
        new DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMMM yyyy HH.mm WIB');
    var outputDate = outputFormat.format(inputDate);
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text(
            "Detail Transaction",
            style: TextStyle(fontSize: 17, fontFamily: 'Merriweather'),
          ),
        ),
        body: Container(
          padding:
              const EdgeInsets.only(bottom: 80, top: 20, left: 20, right: 20),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                            modelView.detailHistory!.statusTransaction
                                .toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                    SizedBox(height: 10),
                    Center(
                        child: Text(outputDate,
                            style:
                                TextStyle(color: Colors.grey, fontSize: 12))),
                    SizedBox(height: 20),
                    Text('Detail Transaksi',
                        style: TextStyle(color: Colors.blue, fontSize: 16)),
                    SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(children: [
                          Text('ID Transaksi',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(
                              widget.idTransaction,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: [
                          Text('Jenis Transaksi',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text(
                              modelView.detailHistory!.transactionType
                                  .toString(),
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('Nama Bank',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text(modelView.detailHistory!.description.toString(),
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('No Rekening',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text(modelView.detailHistory!.nomor.toString(),
                              style: TextStyle(fontSize: 16)),
                        ]),
                      ],
                    ),
                    SizedBox(height: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(children: [
                          Text('POIN Kamu',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Spacer(),
                          Text(modelView.detailHistory!.poinAccount.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        ]),
                        Row(children: [
                          Text('Total Poin yang ditukar',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text(modelView.detailHistory!.poinRedeem.toString(),
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('Total Uang yang didapat  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Spacer(),
                          Text(modelView.detailHistory!.amount.toString(),
                              style: TextStyle(fontSize: 16)),
                        ]),
                        Row(children: [
                          Text('Sisa POIN  ',
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 16)),
                          Text(
                              '${(modelView.detailHistory!.poinRedeem! - modelView.detailHistory!.amount!)}',
                              style: TextStyle(fontSize: 16)),
                        ]),
                        SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  ]),
            ),
          ),
        ));
  }
}
