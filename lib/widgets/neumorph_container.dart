import 'package:flutter/material.dart';

class NeumorphContainer extends StatelessWidget {
  final Widget nchild;
  const NeumorphContainer({super.key, required this.nchild});

  @override
  Widget build(BuildContext context) {
  
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
           BoxShadow(
            color:  Color.fromRGBO(189, 189, 189, 1),
            offset: Offset(4.0, 4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
           BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 10.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Center(child: nchild),
    );
  }
}