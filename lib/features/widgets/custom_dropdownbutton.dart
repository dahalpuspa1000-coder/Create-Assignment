import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  CustomDropdown({
    super.key,
    this.itemlist,
   this.onChanged,
    this.labelText,
    required String? Function(dynamic value) validator,
  });
  List<String>? itemlist;
  Function(dynamic)? onChanged;
  String? labelText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        items: itemlist
            ?.map((item) => DropdownMenuItem(child: Text(item), value: item))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
