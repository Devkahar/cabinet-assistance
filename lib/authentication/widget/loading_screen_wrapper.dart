import 'package:cabinet_assistant/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  LoadingScreen(
      {Key? key, required this.child, required this.displayLoading,required this.displayError, })
      : super(key: key);
  final Widget child;
  final bool displayLoading;
  bool displayError;

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  void reSetHandle(){
    setState((){
      widget.displayError = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        if (widget.displayLoading)
          const Material(
            color: Color.fromRGBO(0, 0, 0, 0.85),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
         if(widget.displayError)
           GestureDetector(
            onTap: () {
             reSetHandle();
            },
            child: Material(
              color: const Color.fromRGBO(0, 0, 0, 0.85),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: Container(
                    width: 300.w,
                    height: 301.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.h),
                    ),
                    // padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Lottie.asset(
                              'assets/lottie/something-went-wrong.json',
                              fit: BoxFit.contain),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
