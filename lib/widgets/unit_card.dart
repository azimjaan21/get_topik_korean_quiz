import 'package:flutter/material.dart';
import 'package:get_topik_korean_quiz/tools/file_importer.dart';

class UnitCard extends StatelessWidget {
  const UnitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        width: MediaQuery.sizeOf(context).width * 0.65,
        height: 180,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(
                'assets/images/unit2_1.jpg',
              ),
              fit: BoxFit.cover,
              ),
       
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(189, 189, 189, 1),
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
        
      ),
      ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.65,
          height: 180,
          color: Colors.black45,
          
          child: Text('Introduction')
        ),
      ),
      ],
    );
  }
}
