import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/categoryBottomSheet.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/category_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/description_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/image_section.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/price_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/submit_button.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/success_overlay.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/title_field.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../generated/assets.dart';


class PostAdScreenBody extends StatefulWidget {
  const PostAdScreenBody({super.key});

  @override
  _PostAdScreenBodyState createState() => _PostAdScreenBodyState();
}

class _PostAdScreenBodyState extends State<PostAdScreenBody> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  String? _selectedCategory;
  List<String> _imageUrls = [];
  bool _isSubmitting = false;
  bool _showSuccess = false;
  bool _isImageUploading = false;

  final List<String> _categories = [
    'إلكترونيات',
    'أثاث',
    'ملابس',
    'خدمات',
    'أخرى',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _showCategoryDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => CategoryBottomSheet(
        categories: _categories,
        selectedCategory: _selectedCategory,
        onCategorySelected: (category) {
          setState(() {
            _selectedCategory = category;
          });
        },
      ),
    );
  }

  Future<void> _addImage() async {
    setState(() {
      _isImageUploading = true;
    });
    try {
      // Simulate image upload delay
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _imageUrls.add(Assets.imagesCar3);
        _isImageUploading = false;
      });
    } catch (e) {
      setState(() {
        _isImageUploading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل في رفع الصورة: $e'),
          backgroundColor: ColorsManager.accentDark,
        ),
      );
    }
  }

  void _removeImage(int index) {
    setState(() {
      _imageUrls.removeAt(index);
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      try {
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          _isSubmitting = false;
          _showSuccess = true;
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() => _showSuccess = false);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('فشل في نشر الإعلان: $e'),
            backgroundColor: ColorsManager.accentDark,
          ),
        );
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorsManager.background,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      'إنشاء إعلان جديد',
                      style: TextStyles.extraBold_24.copyWith(
                            fontWeight: FontWeight.bold,
                            color: ColorsManager.primaryDark,
                          ),
                    ),
                    const SizedBox(height: 24),
                    TitleField(controller: _titleController),
                    const SizedBox(height: 16),
                    DescriptionField(controller: _descriptionController),
                    const SizedBox(height: 16),
                    PriceField(controller: _priceController),
                    const SizedBox(height: 16),
                    CategoryField(
                      selectedCategory: _selectedCategory,
                      onTap: _showCategoryDialog,
                    ),
                    const SizedBox(height: 24),
                    ImagesSection(
                      imageUrls: _imageUrls,
                      onAddImage: _addImage,
                      onRemoveImage: _removeImage,
                      isUploading: _isImageUploading,
                    ),
                    const SizedBox(height: 32),
                    SubmitButton(
                      isSubmitting: _isSubmitting,
                      isEnabled: _titleController.text.isNotEmpty &&
                          _descriptionController.text.isNotEmpty &&
                          _priceController.text.isNotEmpty &&
                          _selectedCategory != null,
                      onPressed: _submitForm,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (_showSuccess)
          SuccessOverlay(
            onDismiss: () {
              setState(() => _showSuccess = false);
              Navigator.pop(context);
            },
          ),
      ],
    );
  }
}