import 'package:flutter/material.dart';

import 'advertisement_details_body.dart';

class AdvertisementDetails extends StatelessWidget {
  const AdvertisementDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: AdvertisementDetailsBody()),
    );
  }
}
