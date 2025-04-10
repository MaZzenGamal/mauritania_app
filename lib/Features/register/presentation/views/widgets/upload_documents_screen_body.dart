import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/Features/botNavBar/presentation/views/botNavBar_screen.dart';
import 'package:mauritania/core/constants/unified_button.dart';
import 'package:mauritania/core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../controller/documents_cubit/documents_cubit.dart';

class UploadDocumentsScreenBody extends StatelessWidget {
  const UploadDocumentsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DocumentsCubit>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BotNavBarScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: ColorsManager.primary, // Text color
                    ),
                    child: Text('تخطي', style: TextStyles.regular_12),
                  ),
                ],
              ),
              Text(
                'قم برفع صورتك الشخصية وبطاقة الرقم القومي من أجل توثيق الهوية',
                style: TextStyles.regular_14,
              ),
              const SizedBox(height: 30),
              buildProfilePicker(context),
              const SizedBox(height: 30),
              buildNationalIdPicker(context),
              const SizedBox(height: 40),
              BlocBuilder<DocumentsCubit, DocumentsState>(
                builder: (context, state) {
                  return UnifiedButton(
                    onPressed: () {
                      if (cubit.isBothSelected) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BotNavBarScreen(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('من فضلك اختر الصورتين')),
                        );
                      }
                    },
                    title: 'تأكيد',
                    color: ColorsManager.primary,
                    disabled: !cubit.isBothSelected,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfilePicker(BuildContext context) {
    return BlocBuilder<DocumentsCubit, DocumentsState>(
      builder: (context, state) {
        final profileImage = context.read<DocumentsCubit>().profileImage;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الصورة الشخصية',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () => context.read<DocumentsCubit>().pickImage(true),
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    image: profileImage != null
                        ? DecorationImage(
                            image: FileImage(profileImage),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                  child: profileImage == null
                      ? Icon(FluentIcons.person_24_filled,
                          size: 50, color: ColorsManager.primary)
                      : null,
                ),
              ),
            ),
            if (profileImage != null) // Show reset button if image exists
              IconButton(
                icon: Icon(FluentIcons.delete_24_regular, color: Colors.red),
                onPressed: () {
                  context
                      .read<DocumentsCubit>()
                      .resetProfile(); // Reset both images
                },
              ),
          ],
        );
      },
    );
  }

  Widget buildNationalIdPicker(BuildContext context) {
    return BlocBuilder<DocumentsCubit, DocumentsState>(
      builder: (context, state) {
        final nationalIdImage = context.read<DocumentsCubit>().nationalIdImage;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('بطاقة الرقم القومي',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () => context.read<DocumentsCubit>().pickImage(false),
              child: Container(
                  height: 160,
                  width: double.infinity,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade400),
                  ),
                  child: nationalIdImage == null
                      ? Center(
                          child: Icon(FluentIcons.card_ui_24_filled,
                              size: 50, color: ColorsManager.primary))
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          // Set the border radius here
                          child: Image.file(
                            nationalIdImage,
                            fit: BoxFit.cover,
                          ),
                        )),
            ),
            if (nationalIdImage != null) // Show reset button if image exists
              IconButton(
                icon: Icon(FluentIcons.delete_24_regular, color: Colors.red),
                onPressed: () {
                  context
                      .read<DocumentsCubit>()
                      .resetNationalId(); // Reset both images
                },
              ),
          ],
        );
      },
    );
  }
}
