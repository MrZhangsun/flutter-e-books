import 'package:flutter/material.dart';

class VolumeBar extends StatefulWidget {
  final double progress;
  final IconData icon;
  final Function(double) volume;

  const VolumeBar(
      {super.key,
      required this.icon,
      required this.progress,
      required this.volume});

  @override
  State<VolumeBar> createState() => _VolumeBarState();
}

class _VolumeBarState extends State<VolumeBar> {
  late double position;

  @override
  void initState() {
    super.initState();
    // ⚠️ 在这里不要使用 MediaQuery 进行初始化
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // 这里可以安全地使用 MediaQuery
    double sw = MediaQuery.of(context).size.width;
    position = sw * widget.progress;
  }

  void updatePosition(details, BoxConstraints constraints) {
    setState(() {
      position = details.localPosition.dx.clamp(0.0, constraints.maxWidth);
    });

    widget.volume(position);
  }

  @override
  Widget build(BuildContext context) {
    double pointRadius = 6;
    double barHeight = 5;
    double topOffset = (pointRadius * 2 - barHeight) / 2;
    return LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            updatePosition(details, constraints);
          },
          onTapDown: (details) {
            updatePosition(details, constraints);
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: double.infinity,
                height: barHeight,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.1)),
              ),
              Container(
                width: position,
                height: barHeight,
                decoration: const BoxDecoration(color: Colors.blue),
              ),
              Positioned(
                left: position - pointRadius,
                top: -topOffset,
                child: Container(
                  width: 2 * pointRadius,
                  height: 2 * pointRadius,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                ),
              ),
              // Positioned.fill 会将 Row 填充到 Stack 的整个区域，而 Row 会在父容器中使用可用的所有宽度。
              Positioned.fill(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      widget.icon,
                      size: 14,
                    ),
                    Icon(
                      widget.icon,
                      size: 24,
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      );
    });
  }
}
