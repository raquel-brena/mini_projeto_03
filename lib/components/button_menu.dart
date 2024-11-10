import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  const ButtonMenu({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });

  final String title;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var _color = Theme.of(context).colorScheme;
    return TextButton(
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: _color.onSurface, size: 20),
                const SizedBox(width: 10),
                Text(title.toUpperCase(),
                    style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: _color.onSurface,
              size: 12,
            ),
          ],
        ));
  }
}
