// ── Shared styled container for all dropdown states ─────────────────
import 'package:flutter/material.dart';

Widget custom_dropdown_container({required Widget child}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(12),
    ),
    child: child,
  );
}
