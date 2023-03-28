import 'package:flutter/material.dart';
import 'package:taktikat/utils/utils/utils.dart';

import '../../core/theme/color/color_manager.dart';

class SwipeMenu extends StatefulWidget {
  final Widget child;
  final double? offset;
  final List<Widget> menuItems;

  const SwipeMenu(
      {Key? key, required this.child, required this.menuItems, this.offset})
      : super(key: key);

  @override
  State<SwipeMenu> createState() => _SwipeMenuState();
}

class _SwipeMenuState extends State<SwipeMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    final animation = Tween(
      begin: isRTL ? const Offset(0, 0) : const Offset(0, 0),
      end: isRTL
          ? Offset(-1 * (widget.offset ?? 0.4), 0)
          : Offset(widget.offset ?? 0.4, 0),
    ).animate(
      CurveTween(curve: Curves.decelerate).animate(_controller),
    );

    return GestureDetector(onHorizontalDragUpdate: (data) {
      setState(() {
        if (isRTL) {
          _controller.value -=
              (data.primaryDelta! / (context.size!.width * 0.2));
        } else {
          _controller.value +=
              (data.primaryDelta! / (context.size!.width * 0.2));
        }
      });
    }, onHorizontalDragEnd: (data) {
      if (data.primaryVelocity! > 1500) {
        _controller.animateTo(0);
      } else if (_controller.value >= .5 || data.primaryVelocity! < -1500) {
        _controller.animateTo(1);
      } else {
        _controller.animateTo(0);
      }
    }, child: LayoutBuilder(builder: (context, constraint) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: isRTL ? Radius.zero : const Radius.circular(10),
            bottomRight: isRTL ? Radius.zero : const Radius.circular(10),
            bottomLeft: isRTL ? const Radius.circular(10) : Radius.zero,
            topLeft: isRTL ? const Radius.circular(10) : Radius.zero,
          ),
          color: ColorManager.instance.transparent,
        ),
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                double width = constraint.maxWidth * animation.value.dx;
                if (isRTL) {
                  width = constraint.maxWidth * (animation.value.dx * -1);
                }

                if (isRTL) {
                  return PositionedDirectional(
                    start: Utils.instance.isArabic() ? .0 : null,
                    end: Utils.instance.isArabic() ? null : .0,
                    top: 0,
                    bottom: 0,
                    width: width,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: ColorManager.instance.white,
                      ),
                      child: Row(
                        children: widget.menuItems.map((child) {
                          return Expanded(
                            child: child,
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
                return PositionedDirectional(
                  start: !Utils.instance.isArabic() ? .0 : null,
                  end: !Utils.instance.isArabic() ? null : .0,
                  top: 0,
                  bottom: 0,
                  width: width,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: ColorManager.instance.white,
                    ),
                    child: Row(
                      children: widget.menuItems.map((child) {
                        return Expanded(
                          child: child,
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            PositionedDirectional(
              child: SlideTransition(
                position: animation,
                child: widget.child,
              ),
            ),
          ],
        ),
      );
    }));
  }
}
