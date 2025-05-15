import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/categoryBottomSheet.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/category_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/city_bottom_sheet.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/city_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/description_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/image_section.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/location_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/location_bottom_sheet.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/price_field.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/submit_button.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/success_overlay.dart';
import 'package:mauritania/Features/post_ad/presentation/views/widgets/title_field.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../../../generated/assets.dart';
import '../controllers/post/post_cubit.dart';

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

  bool _isSubmitting = false;
  bool _showSuccess = false;
  bool _isImageUploading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _showCategoryDialog(PostCubit cubit) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => CategoryBottomSheet(
        categories: AppConstants.categories,
        selectedCategory: cubit.selectedCategory,
        onCategorySelected: (category) {
          cubit.selectCategory(category);
          Navigator.pop(context);
        },
      ),
    );
  }

  void _showLocationDialog(PostCubit cubit) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (newContext) => BlocProvider.value(
        value: cubit,
        child: LocationBottomSheet(
          locations: AppConstants.locationsWithCities.keys.toList(),
          selectedLocation: cubit.selectedLocation,
          onLocationSelected: (location) {
            cubit.selectLocation(location);
          },
        ),
      ),
    );
  }

  void _showCityDialog(PostCubit cubit) {
    if (cubit.availableCities.isNotEmpty) {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (newContext) => BlocProvider.value(
          value: cubit,
          child: CityBottomSheet(
            cities: cubit.availableCities,
            selectedCity: cubit.selectedCity,
            onCitySelected: (city) {
              cubit.selectCity(city);
            },
          ),
        ),
      );
    }
  }

  Future<void> _addImage(PostCubit cubit) async {
    setState(() => _isImageUploading = true);
    await Future.delayed(const Duration(seconds: 1));
    cubit.addImage(Assets.imagesCar3);
    setState(() => _isImageUploading = false);
  }

  Future<void> _submitForm(PostCubit cubit) async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _isSubmitting = false;
        _showSuccess = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      setState(() => _showSuccess = false);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          final cubit = context.read<PostCubit>();
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
                            selectedCategory: cubit.selectedCategory,
                            onTap: () => _showCategoryDialog(cubit),
                          ),
                          const SizedBox(height: 24),
                          LocationField(
                            selectedLocation: cubit.selectedLocation,
                            onTap: () => _showLocationDialog(cubit),
                          ),
                          const SizedBox(height: 24),
                          CityField(
                            selectedCity: cubit.selectedCity,
                            onTap: () => _showCityDialog(cubit),
                          ),
                          const SizedBox(height: 24),
                          ImagesSection(
                            imageUrls: cubit.imageUrls,
                            onAddImage: () => _addImage(cubit),
                            onRemoveImage: (index) => cubit.removeImage(index),
                            isUploading: _isImageUploading,
                          ),
                          const SizedBox(height: 32),
                          SubmitButton(
                            isSubmitting: _isSubmitting,
                            isEnabled: _titleController.text.isNotEmpty &&
                                _descriptionController.text.isNotEmpty &&
                                _priceController.text.isNotEmpty &&
                                cubit.selectedCategory != null &&
                                cubit.selectedLocation != null &&
                                cubit.selectedCity != null &&
                                cubit.imageUrls.isNotEmpty,
                            onPressed: () => _submitForm(cubit),
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
        },
      ),
    );
  }
}
