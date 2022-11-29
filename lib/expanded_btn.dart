import 'package:flutter/material.dart';

class ExpandedButton extends StatelessWidget {
  const ExpandedButton({super.key, this.child, this.onPressed, this.color});

  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) => Expanded(
        flex: 1,
        child: TextButton(
          onPressed: onPressed,
          child: child!,
        ),
      );
}

class ExpandedRow extends StatelessWidget {
  const ExpandedRow({super.key, this.children, this.crossAxisAlignment});
  final List<Widget>? children;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) => 
  Expanded(
        flex: 1,
        child: Row(
          crossAxisAlignment: crossAxisAlignment!,
          children: children!,
        ),
      );
}
