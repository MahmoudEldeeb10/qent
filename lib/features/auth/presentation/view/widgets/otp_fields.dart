import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class otp_fields extends StatefulWidget {
  final Function(String) onCompleted; // يتفعل لما اليوزر يكمل الـ 4 أرقام

  const otp_fields({super.key, required this.onCompleted});

  @override
  State<otp_fields> createState() => _otp_fieldsState();
}

class _otp_fieldsState extends State<otp_fields> {
  final List<TextEditingController> _controllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in _controllers) c.dispose();
    for (var f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1) {
      // روح للـ field الجاي
      if (index < 3) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }

    // كل مرة حرف يتكتب اجمع الـ 4 أرقام وابعتهم
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == 4) {
      widget.onCompleted(otp);
    }
  }

  void _onKeyEvent(KeyEvent event, int index) {
    // لو Backspace والـ field فاضي، ارجع للـ field السابق
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < 4; i++) ...[
          SizedBox(
            height: 68,
            width: 64,
            child: KeyboardListener(
              focusNode: FocusNode(),
              onKeyEvent: (event) => _onKeyEvent(event, i),
              child: TextFormField(
                controller: _controllers[i],
                focusNode: _focusNodes[i],
                onChanged: (value) => _onChanged(value, i),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(1),
                ],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (i < 3) const SizedBox(width: 16),
        ],
      ],
    );
  }
}