import 'package:flutter/cupertino.dart';
import 'package:jajan_id/screens/dashboard/daftar-barang.dart';

import '../../model/barang_model.dart';

class ProductDetailPage extends StatefulWidget{
  ProductDetailPage(this.barang);

  final Barang barang;

  @override
  State<StatefulWidget> createState() => _ProductDetailPageState();
  
}

class _ProductDetailPageState extends State<ProductDetailPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}