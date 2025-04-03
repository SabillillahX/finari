import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final String label;
  final bool hasError; // New property to indicate error state
  final String? errorText; // New property for error message

  const CustomTextField({
    required this.controller,
    required this.hint,
    required this.label,
    this.isPassword = false,
    this.hasError = false, // Default to no error
    this.errorText,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = true;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Gold color for focused state, red for error state
    Color goldColor = Color(0xFFD4AF37);
    Color errorColor = Colors.red;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label above the TextField
        Text(
          widget.label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width * 0.03,
            color:
                widget.hasError
                    ? errorColor
                    : (_isFocused ? goldColor : Colors.black),
          ),
        ),
        SizedBox(height: 5),
        // TextField with focus detection and error state
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? _isObscured : false,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: widget.hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: widget.hasError ? errorColor : goldColor,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: widget.hasError ? errorColor : Colors.grey,
                width: widget.hasError ? 2.0 : 1.0,
              ),
            ),
            // Show error text below field if provided
            errorText: widget.hasError ? widget.errorText : null,
            errorStyle: TextStyle(color: errorColor),
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility_off : Icons.visibility,
                        color: widget.hasError ? errorColor : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
