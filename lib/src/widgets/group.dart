import 'dart:convert';

import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_tex/src/models/widget_meta.dart';
import 'package:flutter_tex/src/utils/style_utils.dart';

class TeXViewGroup extends TeXViewWidget {
  /// A list of [TeXViewWidget].
  final List<TeXViewGroupItem> children;

  /// On Tap Callback when a child is tapped.
  final Function(String id)? onTap;

  /// On Tap Callback when multiple items are selected.
  final Function(List<String> ids)? onItemsSelection;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle? style;

  /// Style for selected items.
  final TeXViewStyle? selectedItemStyle;

  /// Style for normal (unselected) items.
  final TeXViewStyle? normalItemStyle;

  /// Whether the group allows single or multiple selection.
  final bool single;

  /// Selected item ID (for single selection).
  final String? selectedItemId;

  /// List of selected item IDs (for multiple selection).
  final List<String>? selectedItemIds;

  const TeXViewGroup({
    required this.children,
    required this.onTap,
    this.style,
    this.selectedItemStyle,
    this.normalItemStyle,
    this.selectedItemId, // Add selectedItemId for single selection
  })  : onItemsSelection = null,
        selectedItemIds = null,
        single = true;

  const TeXViewGroup.multipleSelection({
    required this.children,
    required this.onItemsSelection,
    this.style,
    this.selectedItemStyle,
    this.normalItemStyle,
    this.selectedItemIds,
  })  : onTap = null,
        selectedItemId = null,
        single = false;

  @override
  TeXViewWidgetMeta meta() {
    return const TeXViewWidgetMeta(
        tag: 'div', classList: 'tex-view-group', node: Node.internalChildren);
  }

  @override
  void onTapCallback(String id) {
    if (single) {
      onTap!(id); // Trigger single selection callback
    } else {
      final ids = selectedItemIds ?? [];
      if (ids.contains(id)) {
        ids.remove(id);
      } else {
        ids.add(id);
      }
      onItemsSelection!(ids); // Trigger multiple selection callback
    }
  }

  @override
  Map toJson() => {
        'meta': meta().toJson(),
        'data': children.map((child) => child.toJson()).toList(),
        'single': single,
        'style': style?.initStyle() ?? teXViewDefaultStyle,
        'selectedItemStyle':
            selectedItemStyle?.initStyle() ?? teXViewDefaultStyle,
        'normalItemStyle': normalItemStyle?.initStyle() ?? teXViewDefaultStyle,
        'selectedItemId': selectedItemId, // Include selectedItemId
        'selectedItemIds': selectedItemIds, // Include selectedItemIds
      };
}
