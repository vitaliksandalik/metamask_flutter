import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../models/network.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  Network selectedNetwork = Network(
      name: 'Ethereum Main Network', logoPath: 'assets/logos/eth-1.png');

  void _changeNetwork(Network network) {
    setState(() {
      selectedNetwork = network;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 15.0, bottom: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Image.asset('assets/logos/metamask-1.png',
                width: 35, height: 35),
          ),
          NetworkCard(
            selectedNetwork: selectedNetwork,
            onNetworkSelected: _changeNetwork,
          ),
          const Padding(
            padding: EdgeInsets.only(right: 4.0, left: 5.0),
            child: Icon(
              Icons.qr_code_scanner,
              size: 20,
              color: AppColors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkCard extends StatelessWidget {
  const NetworkCard({
    super.key,
    required this.selectedNetwork,
    required this.onNetworkSelected,
  });

  final Network selectedNetwork;
  final Function(Network) onNetworkSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showNetworkSelection(context),
      child: Card(
        color: AppColors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        shadowColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 5.0, top: 5.0, bottom: 5.0),
          child: Row(
            children: <Widget>[
              Image.asset(selectedNetwork.logoPath, width: 20, height: 20),
              const SizedBox(width: 10),
              Text(selectedNetwork.name),
              const SizedBox(width: 5),
              const Icon(Icons.expand_more, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  void _showNetworkSelection(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Image.asset('assets/logos/eth-1.png',
                    width: 24, height: 24),
                title: const Text('Ethereum Main Network'),
                onTap: () {
                  onNetworkSelected(Network(
                      name: 'Ethereum Main Network',
                      logoPath: 'assets/logos/eth-1.png'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Image.asset('assets/logos/bnb-1.png',
                    width: 24, height: 24),
                title: const Text('Binance Smart Chain'),
                onTap: () {
                  onNetworkSelected(Network(
                      name: 'Binance Smart Chain',
                      logoPath: 'assets/logos/bnb-1.png'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
