import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:flutter_tex/src/views/tex_view_mobile.dart'
    if (dart.library.html) 'package:flutter_tex/src/views/tex_view_web.dart';

///A Flutter Widget to render Mathematics / Maths, Physics and Chemistry, Statistics / Stats Equations based on LaTeX with full HTML and JavaScript support.
class TeXView extends StatefulWidget {
  /// A list of TeXViewChild.
  final TeXViewWidget child;

  /// Style TeXView Widget with [TeXViewStyle].
  final TeXViewStyle? style;

  /// TeXView height (Only for Web)
  //final double? height;

  /// Register fonts.
  final List<TeXViewFont>? fonts;

  /// Render Engine to render TeX.
  final TeXViewRenderingEngine? renderingEngine;

  /// Gesture recognizers forwarded to the native [WebViewWidget].
  ///
  /// Defaults to an empty set, which means the WebView only handles pointer
  /// events for gestures that no other recognizer claimed. That is fine when
  /// the TeXView has a bounded height and owns its own scrolling, but when it
  /// is placed inside a Flutter scrollable (so the WebView is laid out at full
  /// content height) the scroll view contests every pan and horizontal
  /// scrolling inside wide content — tables, long equations — stutters or is
  /// cancelled mid-drag.
  ///
  /// In that case pass a horizontal drag recognizer so the WebView claims
  /// horizontal pans while vertical drags still reach the scroll view:
  ///
  /// ```dart
  /// TeXView(
  ///   gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
  ///     Factory<HorizontalDragGestureRecognizer>(
  ///       () => HorizontalDragGestureRecognizer(),
  ///     ),
  ///   },
  ///   child: ...,
  /// )
  /// ```
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  /// Show a loading widget before rendering completes.
  final Widget Function(BuildContext context)? loadingWidgetBuilder;

  /// Callback when TEX rendering finishes.
  final Function(double height)? onRenderFinished;

  const TeXView({
    super.key,
    required this.child,
    this.fonts,
    // this.height = 500,
    this.style,
    this.loadingWidgetBuilder,
    this.onRenderFinished,
    this.renderingEngine,
    this.gestureRecognizers = const <Factory<OneSequenceGestureRecognizer>>{},
  });

  @override
  TeXViewState createState() => TeXViewState();
}
