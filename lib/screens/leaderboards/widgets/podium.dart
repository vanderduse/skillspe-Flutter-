import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Podium extends StatelessWidget {
  const Podium({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildRank(context, 2, 3),
        _buildRank(context, 1, 3),
        _buildRank(context, 3, 3),
      ],
    );
  }

  Widget _buildRank(BuildContext context, int rank, int totalRanks) {
    return Container(
        padding: EdgeInsets.only(top: rank == 1 ? 0 : 60),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: rank == 1 ? 216 : 156,
              width: (MediaQuery.of(context).size.width - 96) / totalRanks,
              padding: EdgeInsets.only(bottom: 75),
              margin: EdgeInsets.only(top: 30),
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.00, 1.00),
                  end: Alignment(0, -1),
                  colors: [Color(0xFF301555), Color(0xFF8F5BD7)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 64,
                height: 64,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 64,
                        height: 64,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.00, 0.00),
                            end: Alignment(-1, 0),
                            colors: [
                              Color(0xFFB8CBB8),
                              Color(0xFFB8CBB8),
                              Color(0xFFB465DA),
                              Color(0xFFCF6CC9),
                              Color(0xFFEE609C),
                              Color(0xFFEE609C)
                            ],
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 2,
                      top: 2,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/60x60"),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                          shadows: [
                            BoxShadow(
                              color: Color(0x1E000000),
                              blurRadius: 7.50,
                              offset: Offset(0, 3.75),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 45,
              child: Container(
                child: SvgPicture.asset(
                    "assets/illustrations/${rank == 1 ? "gold.svg" : rank == 2 ? "silver.svg" : "copper.svg"}"),
              ),
            ),
            Positioned(
              top: 85,
              child: Column(
                children: [
                  Container(
                    child: Text(
                      "Ruben\nCarder",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '100',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Color(
                          0xFFFFAA00,
                        ),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
