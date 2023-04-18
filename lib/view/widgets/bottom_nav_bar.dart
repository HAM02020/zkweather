import 'dart:ui';

import 'package:flutter/material.dart';

enum BlurEffectStyle {
  /// 跟随系统
  auto,
  light,
  dark
}

class BlurNavbarItem {
  final Widget? icon;
  final String? title;

  BlurNavbarItem({
    this.icon,
    this.title,
  }) : assert(icon != null);
}

class ZKBottomNavBar extends StatefulWidget {
  const ZKBottomNavBar(
      {Key? key,
      required this.onTap,
      this.style = BlurEffectStyle.auto,
      this.selectedColor,
      this.borderRadius = 24,
      required this.items,
      this.currentIndex = 0,
      this.fontSize = 10,
      this.iconSize = 40})
      : assert(items.length > 1 && items.length <= 5, '至少2个，至多5个'),
        assert(currentIndex >= 0 && currentIndex < items.length),
        super(key: key);

  /// 模糊效果
  final BlurEffectStyle style;
  final Color? selectedColor;
  final double borderRadius;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BlurNavbarItem> items;
  final double fontSize;
  final double iconSize;

  @override
  State<StatefulWidget> createState() => _ZKBottomNavBarState();
}

class _ZKBottomNavBarState extends State<ZKBottomNavBar>
    with SingleTickerProviderStateMixin {
  double barHeight = 50;
  var radius = const Radius.circular(40);
  double borderWidth = 1;

  BlurEffectStyle get style => widget.style;
  double get borderRadius => widget.borderRadius;
  List<BlurNavbarItem> get items => widget.items;
  int get selectedIndex => widget.currentIndex;
  double get iconSize => widget.iconSize;
  double get fontSize => widget.fontSize;
  Color? get selectedColor => widget.selectedColor;

  int _previousIndex = 0;
  late final AnimationController _animation = AnimationController(
      duration: const Duration(milliseconds: 350), vsync: this);

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const borderWidth = .7;
    final itemWidth =
        (MediaQuery.of(context).size.width - borderWidth * 2) / items.length;

    final sColor = selectedColor ?? Theme.of(context).primaryColor;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final double barHeight = 50 + bottomPadding;

    final radius = Radius.circular(borderRadius);

    return Container(
      height: barHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
          ),
          border: Border.all(
              color: Colors.grey.withOpacity(0.35),
              width: borderWidth,
              strokeAlign: BorderSide.strokeAlignOutside)),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        child: Stack(
          children: [
            Backdrop(
                color: sColor,
                width: itemWidth,
                height: barHeight,
                selectedIndex: selectedIndex,
                previousIndex: _previousIndex,
                controller: _animation),
            Container(
              color: Colors.grey.withOpacity(0.2),
            ),
            BackdropFilter(
              blendMode: BlendMode.src,
              filter: ImageFilter.blur(sigmaX: 26, sigmaY: 26),
              child: Container(
                width: double.infinity,
                color: (() {
                  final lightColor = Colors.white.withOpacity(.2);
                  final darkColor = Colors.black.withOpacity(.2);
                  switch (style) {
                    case BlurEffectStyle.auto:
                      return MediaQuery.of(context).platformBrightness ==
                              Brightness.light
                          ? lightColor
                          : darkColor;
                    case BlurEffectStyle.light:
                      return lightColor;
                    case BlurEffectStyle.dark:
                      return darkColor;
                  }
                }()),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: items
                        .asMap()
                        .map(
                          (idx, item) => MapEntry(
                              idx, _itemBuilder(context, idx, item, itemWidth)),
                        )
                        .values
                        .toList()),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onTap(int index) {
    if (selectedIndex == index || _animation.isAnimating) {
      return;
    }

    widget.onTap(index);
    _animation.forward(from: 0.0);
    _previousIndex = selectedIndex;
  }

  Widget _itemBuilder(
      BuildContext context, int index, BlurNavbarItem item, double width) {
    return GestureDetector(
      onTap: () => _onTap(index),
      child: Container(
        width: width,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: iconSize,
              height: iconSize,
              alignment: Alignment.bottomCenter,
              child: item.icon!,
            ),
            const SizedBox(height: 3),
            Text(
              item.title ?? "",
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(
                  fontSize: fontSize,
                  color: (() {
                    const lightColor = Colors.white;
                    const darkColor = Colors.black87;
                    switch (style) {
                      case BlurEffectStyle.auto:
                        return MediaQuery.of(context).platformBrightness ==
                                Brightness.dark
                            ? lightColor
                            : darkColor;
                      case BlurEffectStyle.light:
                        return darkColor;
                      case BlurEffectStyle.dark:
                        return lightColor;
                    }
                  })(),
                  shadows: const [
                    Shadow(
                      blurRadius: 15.0,
                      offset: Offset.zero,
                      color: Colors.black26,
                    ),
                  ]),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

class Backdrop extends StatefulWidget {
  const Backdrop(
      {Key? key,
      required this.color,
      required this.width,
      required this.height,
      required this.selectedIndex,
      required this.previousIndex,
      required this.controller})
      : super(key: key);

  final Color color;
  final double width;
  final double height;
  final int selectedIndex;
  final int previousIndex;
  final AnimationController controller;

  @override
  State<Backdrop> createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> {
  double get _translateX => Tween<double>(
          begin: widget.previousIndex * widget.width,
          end: widget.selectedIndex * widget.width)
      .animate(
        CurvedAnimation(
          parent: widget.controller,
          curve: Curves.easeInOutBack,
        ),
      )
      .value;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: widget.controller,
        builder: (ctx, child) => Container(
              width: widget.width,
              height: widget.height,
              transformAlignment: Alignment.center,
              transform: Matrix4.translationValues(_translateX, 0, 0),
              decoration:
                  BoxDecoration(color: widget.color, shape: BoxShape.circle),
            ));
  }
}
