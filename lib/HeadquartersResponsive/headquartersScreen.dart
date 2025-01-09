import 'package:flutter/material.dart';
import 'package:kairos_fronted/HeadquartersResponsive/utils.dart';

class HeadquartersScreen extends StatefulWidget {
  const HeadquartersScreen({super.key});

  @override
  State<HeadquartersScreen> createState() => _HeadquartersScreenState();
}

class _HeadquartersScreenState extends State<HeadquartersScreen> {
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Stack(
        children: [
          BackgroundImage(),
          SafeArea(
            child: Column(
              children: [
                LogoHeader(),
                SectionTitle(title: 'Sedes'),
                SizedBox(height: 20),
                Expanded(child: HeadquartersGrid()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Image.asset(
        'assets/images/logo.png',
        height: 100,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'MohrRounded',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HeadquartersGrid extends StatelessWidget {
  const HeadquartersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = _getCrossAxisCount(constraints.maxWidth);
        final cardHeightPercentage =
            _getCardHeightPercentage(constraints.maxWidth);
        final cardHeight = constraints.maxHeight * cardHeightPercentage;

        return GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: cardHeight,
          ),
          itemCount: headquarters.length,
          itemBuilder: (context, index) {
            final data = headquarters[index];
            return HeadquartersCard(
              title: data['title']!,
              address: data['address']!,
              status: data['status']!,
              cardHeight: cardHeight,
            );
          },
        );
      },
    );
  }

  int _getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 1200) return 2;
    if (width < 1400) return 3;
    return 4;
  }

  double _getCardHeightPercentage(double width) {
    if (width < 400) return 0.55;
    if (width < 600) return 0.45;
    if (width < 800) return 0.35;
    if (width < 1200) return 0.3;
    if (width < 1600) return 0.48;
    return 0.3;
  }
}

class HeadquartersCard extends StatelessWidget {
  final String title;
  final String address;
  final String status;
  final double cardHeight;

  const HeadquartersCard({
    required this.title,
    required this.address,
    required this.status,
    required this.cardHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = status == 'Operativo'
        ? MyAppColor.green30Color
        : MyAppColor.yellow30Color;
    final borderColor = status == 'Operativo'
        ? MyAppColor.primarygreenColor
        : MyAppColor.primaryOrangeColor;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(
          color: Color.fromARGB(151, 67, 67, 67),
          width: 0.5,
        ),
      ),
      elevation: 6,
      color: MyAppColor.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardHeader(title: title),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddressRow(address: address),
                const SizedBox(height: 16),
                StatusBadge(
                    status: status,
                    color: statusColor,
                    borderColor: borderColor),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyAppColor.pink80Color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 6.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Ingresar',
                            style: TextStyle(
                              color: MyAppColor.whiteColor,
                              fontFamily: 'MohrRoundedAlt',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: MyAppColor.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardHeader extends StatelessWidget {
  final String title;
  const CardHeader({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyAppColor.pink10Color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: 'MohrRoundedAlt',
          fontWeight: FontWeight.w600,
          color: MyAppColor.blackColor,
        ),
      ),
    );
  }
}

class AddressRow extends StatelessWidget {
  final String address;
  const AddressRow({required this.address, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.location_on, color: MyAppColor.primaryFucsiaColor),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            address,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'MohrRoundedAlt',
            ),
          ),
        ),
      ],
    );
  }
}

class StatusBadge extends StatelessWidget {
  final String status;
  final Color color;
  final Color borderColor;

  const StatusBadge({
    required this.status,
    required this.color,
    required this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Text(
        status,
        style: const TextStyle(
          fontSize: 14,
          color: MyAppColor.blackColor,
          fontFamily: 'MohrRoundedAlt',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

const List<Map<String, String>> headquarters = [
  {
    "title": "Sidecom - Kairos",
    "address": "Urb.Bellamar Mz.A Lt.45 - Nuevo Chimbote",
    "status": "Operativo",
  },
  {
    "title": "Ovalo de la Familia - Kairos",
    "address": "Urb.Bellamar Mz.A Lt.45 - Nuevo Chimbote",
    "status": "Inoperativo",
  },
];
