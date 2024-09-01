import 'package:flutter/material.dart';

class ShopBagWithMessage extends StatefulWidget {
  final void Function()? onPressed;
  final int count;

  const ShopBagWithMessage({
    super.key,
    required this.onPressed,
    required this.count,
  });

  @override
  State<ShopBagWithMessage> createState() => _ShopBagWithMessageState();
}

class _ShopBagWithMessageState extends State<ShopBagWithMessage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: widget.onPressed,
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        if (widget.count > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              height: 18,
              width: 18,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "${widget.count}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
