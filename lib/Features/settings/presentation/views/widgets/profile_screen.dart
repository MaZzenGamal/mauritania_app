import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mauritania/Features/settings/presentation/views/widgets/smart_field.dart';
import 'package:mauritania/core/constants/unified_button.dart';

import '../../../../../core/theme/colors.dart';
import '../../controller/profile_cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController(text: ' محمد احمد');
  final emailController = TextEditingController(text: 'exemple@gmail.com');
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  Future<void> _changeProfilePicture() async {}

  void _save(ProfileCubit cubit) {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('تم حفظ التعديلات بنجاح'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: ColorsManager.primary50,
        ),
      );
      cubit.saveProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = ColorsManager.primary50;
    final cardDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: ColorsManager.primary50.withOpacity(0.1),
          blurRadius: 15,
          spreadRadius: 1,
          offset: const Offset(0, 5),
        )
      ],
    );

    return BlocProvider(
      create: (_) => ProfileCubit(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          final cubit = context.read<ProfileCubit>();
          final isEditing = state is ProfileEditing;

          return Scaffold(
            backgroundColor: ColorsManager.primary10,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              centerTitle: true,
              title: Text(
                'الملف الشخصي',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(isEditing ? Icons.close : Icons.edit),
                  onPressed: cubit.toggleEdit,
                  color: primaryColor,
                ),
              ],
              iconTheme: IconThemeData(color: primaryColor),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: isEditing ? _changeProfilePicture : null,
                      child: Animate(
                        effects: [
                          FadeEffect(duration: 300.ms),
                          ScaleEffect(
                              begin: Offset(.98, .98), curve: Curves.easeOut),
                        ],
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: primaryColor.withOpacity(0.3),
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey.shade200,
                                child: const Icon(FluentIcons.person_24_filled,
                                    size: 60, color: Colors.white),
                              ),
                            ),
                            if (isEditing)
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(FluentIcons.camera_24_filled,
                                    size: 20, color: Colors.white),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Animate(
                      effects: [
                        FadeEffect(duration: 400.ms),
                        SlideEffect(
                            begin: const Offset(0, 10),
                            curve: Curves.easeOutQuart),
                      ],
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: cardDecoration,
                        child: Column(
                          children: [
                            SmartField(
                              controller: nameController,
                              label: 'الاسم الكامل',
                              icon: FluentIcons.person_24_regular,
                              enabled: isEditing,
                            ),
                            const SizedBox(height: 16),
                            SmartField(
                              controller: emailController,
                              label: 'البريد الإلكتروني',
                              icon: FluentIcons.mail_24_regular,
                              keyboardType: TextInputType.emailAddress,
                              enabled: isEditing,
                            ),
                            const SizedBox(height: 16),
                            SmartField(
                              controller: phoneController,
                              label: 'رقم الهاتف',
                              icon: FluentIcons.phone_24_regular,
                              keyboardType: TextInputType.phone,
                              enabled: isEditing,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Animate(
                      effects: [
                        FadeEffect(duration: 500.ms),
                        SlideEffect(
                            begin: const Offset(0, 10),
                            curve: Curves.easeOutQuart),
                      ],
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: cardDecoration,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(FluentIcons.alert_24_regular,
                                        color: primaryColor),
                                    const SizedBox(width: 12),
                                    Text('الاشعارات',
                                        style: theme.textTheme.bodyLarge),
                                  ],
                                ),
                                Switch(
                                  value: true,
                                  onChanged: isEditing
                                      ? (_) => cubit.toggleNotifications()
                                      : null,
                                  activeColor: primaryColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(FluentIcons.lock_closed_24_regular,
                                        color: primaryColor),
                                    const SizedBox(width: 12),
                                    Text('تغيير كلمة المرور',
                                        style: theme.textTheme.bodyLarge),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward_ios,
                                      size: 16),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    if (isEditing)
                      Animate(
                        effects: [
                          FadeEffect(duration: 600.ms),
                          ScaleEffect(
                              begin: Offset(0, 10), curve: Curves.elasticOut),
                        ],
                        child: UnifiedButton(
                            onPressed: () {},
                            title: 'حفظ التعديلات',
                            color: primaryColor),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
