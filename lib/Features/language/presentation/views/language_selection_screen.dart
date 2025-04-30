import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:mauritania/Features/onBoarding/presentation/views/onboarding_screen.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class LanguageSelectionScreen extends StatefulWidget {
  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;

  const LanguageSelectionScreen({
    super.key,
    required this.onLanguageChanged,
    required this.currentLocale,
  });

  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  bool _isLoading = false;
  late String _selectedLanguageCode;

  @override
  void initState() {
    super.initState();
    // Initialize with the current locale
    _selectedLanguageCode = widget.currentLocale.languageCode;
  }

  void _handleLanguageSelection(String languageCode) {
    setState(() {
      _selectedLanguageCode = languageCode;
    });
  }

  void _handleSave() async {
    setState(() {
      _isLoading = true;
    });
    widget.onLanguageChanged(Locale(_selectedLanguageCode));
    // Simulate a brief delay to show the loading indicator
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
    Navigator.pushReplacement(context,  MaterialPageRoute(
      builder: (context) => OnboardingScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اختار اللغه',
          style: TextStyles.bold_20.copyWith(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _isLoading ? null : _handleSave,
        child: const Icon(Icons.save),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            children: [
              ListTile(
                title: const Text('العربية'),
                trailing: _selectedLanguageCode == 'ar'
                    ? const Icon(FluentIcons.checkmark_24_regular, color: ColorsManager.primary)
                    : null,
                onTap: _isLoading ? null : () => _handleLanguageSelection('ar'),
              ),
              ListTile(
                title: const Text('Français'),
                trailing: _selectedLanguageCode == 'fr'
                    ? const Icon(FluentIcons.checkmark_24_regular, color: ColorsManager.primary)
                    : null,
                onTap: _isLoading ? null : () => _handleLanguageSelection('fr'),
              ),
            ],
          ),
          if (_isLoading)
            Container(
              color: Colors.white.withOpacity(0.8),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      strokeWidth: 5,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'حفظ...',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
