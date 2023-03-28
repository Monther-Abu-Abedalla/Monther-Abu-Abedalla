import 'package:flutter/material.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1, -0.3),
  end: Alignment(1, 0.3),
  tileMode: TileMode.clamp,
);

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
    this.linearGradient,
  });

  final bool isLoading;
  final Widget child;
  final LinearGradient? linearGradient;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return child;
    }

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        if (linearGradient != null) {
          return linearGradient!.createShader(bounds);
        }
        return _shimmerGradient.createShader(bounds);
      },
      child: child,
    );
  }
}
