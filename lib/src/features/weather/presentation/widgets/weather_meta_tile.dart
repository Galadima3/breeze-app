import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherMetaTile extends StatelessWidget {
  const WeatherMetaTile({
    super.key,
    required this.svgPath,
    required this.labelText,
    required this.mainData,
  });

  final String svgPath;
  final String labelText;
  final String mainData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
       
        decoration: BoxDecoration(
          color: const Color(0xFF2E2D2D),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                labelText,
                style: const TextStyle(fontSize: 18.5),
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 37.5,
                    width: 37.5,
                    child: SvgPicture.asset(
                      svgPath,
                      // ignore: deprecated_member_use
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 7.85,
                  ),
                  Text(
                    mainData,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}