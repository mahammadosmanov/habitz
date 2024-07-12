import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.pageCount,
    required this.currentPage,
    this.circleWidthAndHeight = 12,
    this.innerCircleColor = whiteColor,
    this.outerCircleColor = blackColor,
  });

  final int pageCount;
  final double currentPage;
  final int circleWidthAndHeight;
  final Color innerCircleColor;
  final Color outerCircleColor;
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) {
          return Row(
            children: [
              Container(
                width: circleWidthAndHeight.h,
                height: circleWidthAndHeight.h,
                decoration: BoxDecoration(
                  color: outerCircleColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Container(
                    width: (circleWidthAndHeight / 2).h,
                    height: (circleWidthAndHeight / 2).h,
                    decoration: BoxDecoration(
                      color: innerCircleColor.withOpacity(
                        indicatorOpacity(
                          index,
                          currentPage,
                        ),
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
            ],
          );
        },
      ),
    );
  }

  double indicatorOpacity(
    int index,
    double currentPage,
  ) {
    return (currentPage - index).abs() > 1
        ? 0
        : 1 - (currentPage - index).abs();
  }
}
