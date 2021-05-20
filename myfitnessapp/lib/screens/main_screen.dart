import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myfitnessapp/data/bolumler_api.dart';
import 'package:myfitnessapp/data/hareketler_api.dart';
import 'package:myfitnessapp/models/bolumler.dart';
import 'package:myfitnessapp/models/hareketler.dart';
import 'package:myfitnessapp/widgets/hareketler_list_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State {
  List<Bolumler> bolumler = List<Bolumler>();
  List<Widget> bolumlerWidgets = List<Widget>();
  List<Hareketler> hareketler = List<Hareketler>();

  @override
  void initState() {
    getBolumlerFromApi();
    getHareketler();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Fitness App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: bolumlerWidgets),
            ),
            HareketlerListWidget(hareketler)
          ],
        ),
      ),
    );
  }

  void getBolumlerFromApi() {
    BolumlerApi.getBolumler().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.bolumler =
            list.map((bolumler) => Bolumler.fromJson(bolumler)).toList();
        getBolumlerWidgets();
      });
    });
  }

  List<Widget> getBolumlerWidgets() {
    for (int i = 0; i < bolumler.length; i++) {
      bolumlerWidgets.add(getBolumlerWidget(bolumler[i]));
    }
    return bolumlerWidgets;
  }

  Widget getBolumlerWidget(Bolumler bolumler) {
    return InkWell(

      onTap:() {getHareketlerByBolumId(bolumler);},
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Container(
          width: 60,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50),
            shape: BoxShape.rectangle,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Image.network(bolumler.bolumUrl,width: 40,height: 40,),
              ),
              Expanded(
                child: Text(
                  bolumler.bolumAdi,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getHareketlerByBolumId(Bolumler bolumler) {
    HareketlerApi.getHareketlerBolumId(bolumler.id).then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.hareketler =
            list.map((hareketler) => Hareketler.fromJson(hareketler)).toList();
      });
    });
  }

  void getHareketler() {
    HareketlerApi.getHareketler().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.hareketler =
            list.map((hareketler) => Hareketler.fromJson(hareketler)).toList();
      });
    });
  }
}
