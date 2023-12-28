import 'package:flutter/material.dart';

class SelectableCheckboxGroup extends StatefulWidget {
  final String label;
  final List<String> options;
  final List<int>? controller;
  final bool multiselect;
  final String? Function(List<int?>?)? validator;

  SelectableCheckboxGroup({
    required this.label,
    required this.options,
    this.controller,
    this.multiselect = false,
    this.validator,
  });

  @override
  _SelectableCheckboxGroupState createState() =>
      _SelectableCheckboxGroupState(controller);
}

class _SelectableCheckboxGroupState extends State<SelectableCheckboxGroup> {
  List<int>? _selectedOptions;

  _SelectableCheckboxGroupState(List<int>? controller)
      : _selectedOptions = controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
              ),
              const SizedBox(height: 12),
              Column(
                children: List.generate(
                  widget.options.length,
                  (index) =>
                      buildSelectableOption(widget.options[index], index),
                ),
              ),
              if (widget.validator != null)
                Text(
                  widget.validator!(_selectedOptions) ?? '',
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSelectableOption(String label, int index) {
    final bool isSelected =
        _selectedOptions != null && _selectedOptions!.contains(index);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.multiselect) {
            if (_selectedOptions == null) {
              _selectedOptions = [index];
            } else {
              if (_selectedOptions!.contains(index)) {
                _selectedOptions!.remove(index);
              } else {
                _selectedOptions!.add(index);
              }
            }
          } else {
            _selectedOptions = [index];
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: const Color(0xffD0D1DA)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(label),
            ),
            const SizedBox(width: 20),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    isSelected ? Theme.of(context).primaryColor : Colors.white,
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
