import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tayuyon/constants.dart';
import 'package:tayuyon/models/Product.dart';
import 'package:tayuyon/screens/details/components/body.dart';

import '../home/components/favIcon.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kMainColor,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        FavIcon(product: product),
        const SizedBox(width: kDefaultPaddin)
      ],
    );
  }
}
