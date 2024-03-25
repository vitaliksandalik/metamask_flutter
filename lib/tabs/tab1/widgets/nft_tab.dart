import 'package:flutter/material.dart';
import '../../../app_colors.dart';

class NFTTab extends StatelessWidget {
  const NFTTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Don't see your NFT?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Import NFTs",
              style: TextStyle(
                fontSize: 18,
                color: AppColors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
