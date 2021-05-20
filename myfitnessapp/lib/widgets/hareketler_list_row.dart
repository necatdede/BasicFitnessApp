import 'package:flutter/material.dart';
import 'package:myfitnessapp/models/hareketler.dart';

class HareketlerListRowWidget extends StatelessWidget {
  Hareketler hareketler;
  HareketlerListRowWidget(this.hareketler);
  @override
  Widget build(BuildContext context) {
    return buildHareketlerItemCard(context);
  }

  Widget buildHareketlerItemCard(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        shadowColor: Colors.blue,
        child: Column(
          children: [
            Container(
              child: Image.network(hareketler.hareketUrl),
              height: 130.0,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                hareketler.hareketAdi,
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
