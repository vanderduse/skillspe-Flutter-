import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CampaignCardSkeleton extends StatelessWidget {
  final double height;

  const CampaignCardSkeleton({
    Key? key,
    this.height = 300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: const Color.fromARGB(185, 223, 223, 223),
        highlightColor: Colors.grey[100]!,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          height: height,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Add spacing between containers
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
