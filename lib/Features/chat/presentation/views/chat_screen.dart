import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mauritania/Features/chat/presentation/views/chat_screen_body.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool _isFavorited = false; // Tracks favorite status

  // Show confirmation dialog for critical actions
  Future<bool?> _showConfirmationDialog(BuildContext context, String action) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          action,
          style: TextStyles.bold_16.copyWith(color: ColorsManager.grey900),
          textDirection: TextDirection.rtl,
        ),
        content: Text(
          'هل أنت متأكد من $action؟',
          style: TextStyles.regular_14.copyWith(color: ColorsManager.grey600),
          textDirection: TextDirection.rtl,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              'إلغاء',
              style:
                  TextStyles.regular_14.copyWith(color: ColorsManager.grey600),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'تأكيد',
              style:
                  TextStyles.regular_14.copyWith(color: ColorsManager.primary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('محادثة'),
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyles.bold_20.copyWith(
            color: ColorsManager.grey900,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          actions: [
            PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                color: ColorsManager.primary,
                semanticLabel: 'المزيد من الخيارات',
              ),
              tooltip: 'الخيارات',
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              offset: const Offset(0, 40),
              // Position menu below icon
              onSelected: (value) async {
                switch (value) {
                  case 'block':
                    final confirmed =
                        await _showConfirmationDialog(context, 'حظر المستخدم');
                    if (confirmed == true) {
                      // TODO: Implement block user functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'تم حظر المستخدم',
                            style: TextStyles.regular_14
                                .copyWith(color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                          backgroundColor: ColorsManager.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }
                    break;
                  case 'delete':
                    final confirmed =
                        await _showConfirmationDialog(context, 'حذف الدردشة');
                    if (confirmed == true) {
                      // TODO: Implement delete chat functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'تم حذف الدردشة',
                            style: TextStyles.regular_14
                                .copyWith(color: Colors.white),
                            textDirection: TextDirection.rtl,
                          ),
                          backgroundColor: ColorsManager.primary,
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    }
                    break;
                  case 'favorite':
                    setState(() {
                      _isFavorited = !_isFavorited;
                    });
                    // TODO: Implement add/remove favorite functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          _isFavorited
                              ? 'تمت إضافة المحادثة إلى المفضلة'
                              : 'تمت إزالة المحادثة من المفضلة',
                          style: TextStyles.regular_14
                              .copyWith(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                        backgroundColor: ColorsManager.primary,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                    break;
                  case 'support':
                    // TODO: Implement contact support functionality
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'جاري التواصل مع الدعم',
                          style: TextStyles.regular_14
                              .copyWith(color: Colors.white),
                          textDirection: TextDirection.rtl,
                        ),
                        backgroundColor: ColorsManager.primary,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'block',
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(FluentIcons.presence_blocked_24_regular,
                          color: ColorsManager.primary70, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'حظر المستخدم',
                        style: TextStyles.regular_14.copyWith(
                          color: ColorsManager.grey900,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(FluentIcons.delete_24_filled,
                          color: ColorsManager.primary70, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'حذف الدردشة',
                        style: TextStyles.regular_14.copyWith(
                          color: ColorsManager.grey900,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'favorite',
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(
                        _isFavorited
                            ? FluentIcons.star_24_regular
                            : FluentIcons.star_24_filled,
                        color: ColorsManager.primary70,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isFavorited ? 'إزالة من المفضلة' : 'إضافة إلى المفضلة',
                        style: TextStyles.regular_14.copyWith(
                          color: ColorsManager.grey900,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'support',
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Icon(FluentIcons.person_support_24_regular,
                          color: ColorsManager.primary70, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'التواصل مع الدعم',
                        style: TextStyles.regular_14.copyWith(
                          color: ColorsManager.grey900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: ColorsManager.grey100,
        body: const SafeArea(
          child: ChatScreenBody(),
        ),
      ),
    );
  }
}
