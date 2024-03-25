import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app_colors.dart';

class AccountDetailsWidget extends StatelessWidget {
  const AccountDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String address = '0xAA21...42eA';

    void _showWalletSelection(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16, top: 36, bottom: 16),
                  child: Text(
                    'Accounts',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text('Account 1'),
                  onTap: () {
                    // Update state to reflect the selected wallet
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.account_balance_wallet),
                  title: const Text('Account 2'),
                  onTap: () {
                    // Update state to reflect the selected wallet
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 30, right: 30),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: AppColors.blue, width: 1),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Implement adding new account or hardware wallet
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: const Text(
                          'Add account or hardware wallet',
                          style: TextStyle(
                              color: AppColors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void _showMoreOptions(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit account name'),
                  onTap: () {
                    // Implement the functionality
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.launch_rounded),
                  title: const Text('View on Etherscan'),
                  onTap: () {
                    // Implement the functionality
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.share),
                  title: const Text('Share my Public Address'),
                  onTap: () {
                    // Implement the functionality
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.vpn_key),
                  title: const Text('Show private key'),
                  onTap: () {
                    // Implement the functionality
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.darkGrey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => _showWalletSelection(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          size: 20, color: AppColors.blue),
                      SizedBox(width: 10),
                      Text('Account 1'),
                    ],
                  ),
                  Icon(Icons.expand_more, size: 20),
                ],
              ),
            ),
          ),
          const Divider(color: AppColors.darkGrey, thickness: 1, height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Clipboard.setData(ClipboardData(text: address)).then((_) {
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        transitionDuration: const Duration(milliseconds: 200),
                        barrierLabel: MaterialLocalizations.of(context)
                            .modalBarrierDismissLabel,
                        barrierColor: Colors.black45,
                        pageBuilder: (BuildContext buildContext,
                            Animation animation, Animation secondaryAnimation) {
                          return Center(
                            child: Container(
                              width: 200,
                              height: 200,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.check_circle,
                                      color: Colors.white, size: 50),
                                  SizedBox(height: 20),
                                  Text(
                                    'Address copied to clipboard',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        Navigator.of(context, rootNavigator: true)
                            .pop('dialog');
                      });
                    });
                  },
                  child: const Row(
                    children: [
                      Text('Address:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(width: 10),
                      Card(
                        color: AppColors.lightBlue,
                        shadowColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 9.0, right: 9.0, top: 2.0, bottom: 2.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(address,
                                  style: TextStyle(
                                      fontSize: 12, color: AppColors.blue)),
                              SizedBox(width: 5),
                              Icon(FontAwesomeIcons.solidCopy,
                                  size: 13, color: AppColors.blue),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _showMoreOptions(context),
                  child: const Icon(Icons.more_horiz, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
