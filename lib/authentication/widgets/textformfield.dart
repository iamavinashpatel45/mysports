import 'package:flutter/material.dart';

class textformfield extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hint;
  final bool pass;
  final IconData iconData;

  const textformfield({
    required this.textEditingController,
    this.textInputType = TextInputType.name,
    required this.hint,
    this.pass = false,
    required this.iconData,
  });

  @override
  State<textformfield> createState() => _textformfieldState();
}

class _textformfieldState extends State<textformfield> {
  bool _visibility = false;
  bool _pass = false;

  @override
  void initState() {
    _pass = widget.pass;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _pass,
      controller: widget.textEditingController,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        suffixIcon: widget.pass
            ? InkWell(
                onTap: () {
                  setState(() {
                    _visibility = !_visibility;
                    _pass = !_pass;
                  });
                },
                child: Icon(
                  _visibility ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).primaryColor,
                ),
              )
            : Container(
                width: 0,
              ),
        //focusColor: Colors.grey,
        //fillColor: Colors.grey,
        hintText: widget.hint,
        labelText: widget.hint,
        labelStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        prefixIcon: Icon(
          widget.iconData,
          color: Theme.of(context).primaryColor,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
