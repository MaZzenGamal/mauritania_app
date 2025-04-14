import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AdvertisementPhotoStack extends StatefulWidget {
  const AdvertisementPhotoStack({super.key});

  @override
  State<AdvertisementPhotoStack> createState() => _AdvertisementPhotoStackState();
}

class _AdvertisementPhotoStackState extends State<AdvertisementPhotoStack> {
  bool _isFavorite = false;
  int _selectedImageIndex = 0;

  final List<String> _imageUrls = [
    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
    'https://images.unsplash.com/photo-1532298229144-0ec0c57515c7',
    'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3',
    'https://images.unsplash.com/photo-1494972308805-463bc619d34e',
    'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
  ];

  void _showFullscreenImage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 3,
                child: Center(
                  child: Image.network(
                    _imageUrls[_selectedImageIndex],
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _showFullscreenImage(context),
          child: Stack(
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    _imageUrls[_selectedImageIndex],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),

              // Back Button
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      FluentIcons.arrow_left_24_regular,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),

              // Favorite Button
              Positioned(
                top: 12,
                left: 12,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(_isFavorite ? 'تمت الإضافة إلى المفضلة' : 'تمت الإزالة من المفضلة'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: _isFavorite ? Colors.red : Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),

              // Image Counter
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${_selectedImageIndex + 1}/${_imageUrls.length}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Image Gallery Thumbnails
        const SizedBox(height: 12),
        SizedBox(
          height: 70,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _imageUrls.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedImageIndex = index;
                  });
                },
                child: Container(
                  width: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _selectedImageIndex == index
                          ? Colors.blue.shade600
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      _imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}