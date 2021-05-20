import 'package:flutter/material.dart';
import 'package:myfitnessapp/models/hareketler.dart';
import 'package:myfitnessapp/widgets/hareketler_list_row.dart';

class HareketlerListWidget extends StatefulWidget {
  List<Hareketler> hareketler = new List<Hareketler>();
  HareketlerListWidget(List<Hareketler> hareketler) {
    this.hareketler = hareketler;
  }

  @override
  State<StatefulWidget> createState() {
    return HareketlerListWidgetState();
  }
}

class HareketlerListWidgetState extends State<HareketlerListWidget> {
  @override
  Widget build(BuildContext context) {
    return buildHareketlerList(context);
  }

  Widget buildHareketlerList(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          height: 540,
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(widget.hareketler.length, (index) {
              return HareketlerListRowWidget(widget.hareketler[index]);
            }),
          ),
        ),
      ],
    );
  }
}
