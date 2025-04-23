import 'package:flutter/material.dart';

import '../../../../../core/theme/colors.dart';

class SuccessOverlay extends StatelessWidget {
  final VoidCallback onDismiss;

  const SuccessOverlay({super.key, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1.0,
      duration: const Duration(milliseconds: 300),
      child: Container(
        color: ColorsManager.grey900.withOpacity(0.5),
        child: Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: ColorsManager.surface,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.grey900.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    color: ColorsManager.accent,
                    size: 64,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'تم نشر الإعلان بنجاح!',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.primaryDark,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'سيتم مراجعة إعلانك وسيظهر للجميع قريبًا',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: ColorsManager.grey800),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: onDismiss,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.primary,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text('حسناً'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}