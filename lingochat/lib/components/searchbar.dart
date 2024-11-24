import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final SearchController controller;
  final void Function(String)? onItemSelected;

  const CustomSearchBar({
    super.key,
    required this.controller,
    this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
          trailing: const <Widget>[],
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              if (onItemSelected != null) {
                onItemSelected!(item);
              }
              controller.closeView(item);
            },
          );
        });
      },
    );
  }
}
