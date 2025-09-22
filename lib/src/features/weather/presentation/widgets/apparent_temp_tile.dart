import 'package:breeze/src/features/weather/model/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApparentTempTile extends StatelessWidget {
  const ApparentTempTile({
    super.key,
    required this.essex,
  });

  final Datum essex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      //width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF2E2D2D),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Feels like',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              children: [
                SizedBox(
                  height: 45,
                  width: 45,
                  child: SvgPicture.asset(
                    'assets/temp.svg',
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text('${essex.appTemp.toStringAsFixed(0)}\u00B0C',
                
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
