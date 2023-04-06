import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final double height;
  final String imageUrl;
  final String avatarUrl;
  final String bigText;
  final String smallText;

  const StoreCard({
    super.key,
    this.height = 250,
    this.imageUrl = 'https://via.placeholder.com/500x100',
    this.avatarUrl = 'https://via.placeholder.com/50x50',
    this.bigText = 'BIG TEXT',
    this.smallText = 'Small Text',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 5),
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(55),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: 500,
                height: 100,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    avatarUrl,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bigText,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      smallText,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
