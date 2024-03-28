import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PublicChallengeCardSkeleton extends StatelessWidget {
  final double height;

  const PublicChallengeCardSkeleton({
    Key? key,
    this.height = 200,
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
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Add spacing between containers
                        Container(
                          width: 200,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50, // Adjust height as needed
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 50, // Adjust height as needed
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 50,
                        margin: const EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
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
