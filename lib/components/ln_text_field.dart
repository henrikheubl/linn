import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LnTextField extends StatefulWidget {
  final String text;
  final TextInputType keyboardType;

  const LnTextField(
      {this.text = '', this.keyboardType = TextInputType.name, Key? key})
      : super(key: key);

  @override
  _LnTextFieldState createState() => _LnTextFieldState();
}

class _LnTextFieldState extends State<LnTextField> {
  FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  void _clearTextField() {
    _controller.clear();
    setState(() {});
  }

  @override
  void initState() {
    _focus.addListener(() {
      setState(() {});
    });
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Stack(
        //   children: [
        TextField(
      controller: _controller,
      keyboardType: widget.keyboardType,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      focusNode: _focus,
      textAlign:
          // _focus.hasFocus ? TextAlign.left :
          TextAlign.center,
      autofocus: false,
      enableInteractiveSelection: true,
      cursorColor: cursorColor,
      cursorWidth: 2.0,
      cursorRadius: const Radius.circular(2.0),
      decoration: InputDecoration(
        hintText: _focus.hasFocus ? '' : widget.text,
        hintStyle: TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600, color: fontColor),
        contentPadding: _controller.text.isEmpty
            ? EdgeInsets.all(18)
            : EdgeInsets.fromLTRB(
                _controller.text.length < 20
                    ? 58 - _controller.text.length.toDouble() * 2
                    : 18,
                18,
                18,
                18),
        filled: true,
        fillColor: _focus.hasFocus ? Colors.white : textFieldColor,
        suffixIcon: (_controller.text.length != 0 && _focus.hasFocus)
            ? IconButton(
                padding: EdgeInsets.all(0),
                icon: const Icon(CupertinoIcons.xmark_circle_fill),
                color: textFieldColor,
                onPressed: _clearTextField,
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      //   Container(
      //     alignment: Alignment.centerRight,
      //     child: IconButton(
      //       onPressed: _clearTextField,
      //       icon: const Icon(CupertinoIcons.xmark_circle_fill),
      //       color: Colors.red,
      //     ),
      //   )
      // ],
      // )
    );
  }
}
