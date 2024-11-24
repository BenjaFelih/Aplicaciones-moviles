import 'package:flutter/material.dart';

class SelectableChipsRow extends StatefulWidget {
  final List<String> labels;
  final ValueChanged<int?>? onSelected;

  const SelectableChipsRow({
    super.key,
    required this.labels,
    this.onSelected,
  });

  @override
  State<SelectableChipsRow> createState() => _SelectableChipsRowState();
}

class _SelectableChipsRowState extends State<SelectableChipsRow> {
  int? _selectedChipIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.labels.asMap().entries.map((entry) {
        final index = entry.key;
        final label = entry.value;
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SelectableChip(
            label: label,
            isSelected: _selectedChipIndex == index,
            onTap: () {
              setState(() {
                _selectedChipIndex = _selectedChipIndex == index ? null : index;
              });
              if (widget.onSelected != null) {
                widget.onSelected!(_selectedChipIndex);
              }
            },
          ),
        );
      }).toList(),
    );
  }
}

class SelectableChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFE91E63)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.pink,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectableChipsRow(
              labels: const ['Todas', 'Español', 'Ingles'],
              onSelected: (index) {
                debugPrint('Selected chip index: $index');
              },
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
