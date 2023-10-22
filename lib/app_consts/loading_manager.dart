import 'package:flutter/material.dart';
import 'app_color.dart';



class LoadingManager extends StatelessWidget {
  const LoadingManager({super.key, required this.child, required this.isLoading});
  final Widget child;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if(isLoading)...[
          const Center(
            child: CircularProgressIndicator(
              color: AppColors.lightPrimary,
            ),
          )
        ]
      ],
    );
  }
}
