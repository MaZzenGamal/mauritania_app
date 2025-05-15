import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/advertisement_photo_stack.dart';
import 'package:mauritania/Features/home/presentation/view/widgets/seller_info_section.dart';
import 'package:mauritania/core/constants/unified_button.dart';


import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../chat/presentation/views/chat_screen.dart';

class AdvertisementDetailsBody extends StatelessWidget {
  const AdvertisementDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AdvertisementPhotoStack(),
          const SizedBox(height: 24),
          advertisementHeader(context),
          const SizedBox(height: 24),
          const ExpandableDescription(),
          const SizedBox(height: 28),
          const SellerInfoSection(),
          const SizedBox(height: 32),
          actionButtons(context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

Column advertisementHeader(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              'اسم المنتج - ماركة المنتج',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Semantics(
                label: 'مشاركة الإعلان',
                child: InkWell(
                  onTap: () {
                    // Share.share(
                    //   'تحقق من هذا الإعلان: اسم المنتج - ماركة المنتج، السعر: 300 أوقية. الوصف: المنتج بحالة ممتازة، جديد تمامًا، وتم استخدامه مرة واحدة فقط. متاح للتوصيل داخل المدينة.',
                    //   subject: 'إعلان: اسم المنتج - ماركة المنتج',
                    // );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: ColorsManager.primary10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      FluentIcons.share_24_filled,
                      color: ColorsManager.primary,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green.shade100),
                ),
                child: Text(
                  '300 أوقية',
                  style: TextStyles.bold_18.copyWith(
                    color: Colors.green.shade800,
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class ExpandableDescription extends StatefulWidget {
  const ExpandableDescription({super.key});

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            const Icon(
              FluentIcons.text_description_24_filled,
              size: 20,
              color: ColorsManager.primary,
            ),
            const SizedBox(width: 8),
            Text(
              'الوصف',
              style: TextStyles.bold_18.copyWith(color: ColorsManager.primary),
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المنتج بحالة ممتازة، جديد تمامًا، وتم استخدامه مرة واحدة فقط. متاح للتوصيل داخل المدينة.المنتج بحالة ممتازة، جديد تمامًا، وتم استخدامه مرة واحدة فقط. متاح للتوصيل داخل المدينة.المنتج بحالة ممتازة، جديد تمامًا، وتم استخدامه مرة واحدة فقط. متاح للتوصيل داخل المدينة.المنتج بحالة ممتازة، جديد تمامًا، وتم استخدامه مرة واحدة فقط. متاح للتوصيل داخل المدينة.',
                style: TextStyles.medium_15.copyWith(
                  color: Colors.grey.shade800,
                  height: 1.5,
                ),
                maxLines: _isExpanded ? null : 3,
                overflow: _isExpanded ? null : TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Text(
                    _isExpanded ? 'عرض أقل' : 'عرض المزيد',
                    style: TextStyle(
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

Row actionButtons(context) {
  return Row(
    children: [
      Expanded(
        child: UnifiedButton(
          onPressed: () {},
          title: 'اتصال',
          icon: FluentIcons.call_24_filled,
        ),
      ),
      const SizedBox(width: 12),
      Expanded(
        child: UnifiedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const ChatScreen();
            }));
          },
          title: 'محادثه',
          icon: FluentIcons.chat_24_filled,
        ),
      ),
    ],
  );
}