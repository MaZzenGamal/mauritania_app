import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../generated/assets.dart';

class SocialLoginSection extends StatelessWidget {
  const SocialLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                height: 0,
                endIndent: 10,
              ),
            ),
            Text(
              'أو',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            Expanded(
              child: Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                height: 0,
                indent: 10,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.iconsGoogle),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(Assets.iconsFacebook),
            ),
          ],
        ),
      ],
    );
  }
}
