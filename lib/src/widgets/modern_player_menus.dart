import 'package:flutter/material.dart';
import 'package:modern_player/modern_player.dart';

class ModernPlayerMenus {
  void showQualityOptions(BuildContext context,
      {required Color menuColor,
      required ModernPlayerVideoData currentData,
      required List<ModernPlayerVideoData> allData,
      required Function(ModernPlayerVideoData videoData) onChangedQuality}) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: menuColor,
      constraints: const BoxConstraints(maxWidth: 400),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...allData.map(
                (e) => InkWell(
                  onTap: () {
                    if (e.label != currentData.label) {
                      Navigator.pop(context);
                      onChangedQuality.call(e);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        if (e.label == currentData.label)
                          const SizedBox(
                            width: 15,
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                            ),
                          ),
                        SizedBox(
                          width: e.label == currentData.label ? 20 : 35,
                        ),
                        Text(
                          e.label,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  void showPlabackSpeedOptions(BuildContext context,
      {required Color menuColor,
      required String text,
      required double currentSpeed,
      required List<double> allSpeeds,
      required Function(double selectedSpeed) onChnagedSpeed}) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: true,
      backgroundColor: menuColor,
      constraints: const BoxConstraints(maxWidth: 400),
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...allSpeeds.map(
                (e) => InkWell(
                  onTap: () {
                    if (e != currentSpeed) {
                      Navigator.pop(context);
                      onChnagedSpeed.call(e);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        if (e == currentSpeed)
                          const SizedBox(
                            width: 15,
                            child: Icon(
                              Icons.check_rounded,
                              color: Colors.white,
                            ),
                          ),
                        SizedBox(
                          width: e == currentSpeed ? 20 : 35,
                        ),
                        Text(
                          e == 1 ? text : "${e.toStringAsFixed(2)}x",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
