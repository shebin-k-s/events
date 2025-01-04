import 'package:flutter/material.dart';

class CustomSnackbar extends StatelessWidget {
  final String message;
  final VoidCallback onClose;
  final Color color;
  final IconData icon;

  const CustomSnackbar({
    super.key,
    required this.message,
    required this.onClose,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: color,
                fontSize: 15,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.close,
              color: Colors.black54,
              size: 24,
            ),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}

void showTopSnackBar(
    BuildContext context, String message, Color color, IconData icon) {
  final overlayState = Overlay.of(context);
  late final OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 60,
      left: 16,
      right: 16,
      child: Material(
        color: Colors.transparent,
        child: CustomSnackbar(
          message: message,
          color: color,
          icon: icon,
          onClose: () {
            overlayEntry.remove();
          },
        ),
      ),
    ),
  );

  overlayState.insert(overlayEntry);

  // Auto-dismiss after 4 seconds
  Future.delayed(const Duration(seconds: 4), () {
    if (overlayEntry.mounted) {
      overlayEntry.remove();
    }
  });
}
