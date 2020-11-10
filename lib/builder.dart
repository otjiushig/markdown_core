import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:markdown_core/text_style.dart';

class MarkdownBuilder implements md.NodeVisitor {
  final _widgets = <Widget>[];
  int _level = 0;
  List<_Element> _elementList = <_Element>[];
  TextStyle _textStyle = defaultTextStyle;

  @override
  bool visitElementBefore(md.Element element) {
    _level++;
    debugPrint('visitElementBefore $_level ${element.textContent}');

    _elementList.add(_Element(
      element.tag,
      getTextStyle(
          _elementList.isNotEmpty ? _elementList.last.textStyle : _textStyle,
          element.tag),
    ));

    return true;
  }

  @override
  void visitText(md.Text text) {
    print('text ${text.text}');

    var last = _elementList.last;
    last.textSpans ??= [];

    last.textSpans.add(TextSpan(
      text: text.text,
      style: last.textStyle,
    ));
  }

  @override
  void visitElementAfter(md.Element element) {
    debugPrint('visitElementAfter $_level ${element.textContent}');
    _level--;

    if (_elementList.isEmpty) return;
    var last = _elementList.last;
    _elementList.removeLast();
    var tempWidget;
    if (kTextTags.indexOf(element.tag) != -1) {
      tempWidget = RichText(
        text: TextSpan(
          children: last.textSpans,
          style: last.textStyle,
        ),
      );
    } else if ('li' == element.tag) {
      tempWidget = _resolveToLi(last);
    } else if ('pre' == element.tag) {
      tempWidget = _resolveToPre(last);
    } else if (last.widgets != null && last.widgets.isNotEmpty) {
      if (last.widgets.length == 1) {
        tempWidget = last.widgets[0];
      } else {
        tempWidget = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: last.widgets,
        );
      }
    }

    if (_elementList.isEmpty) {
      _widgets.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
          child: tempWidget,
        ),
      );
    } else {
      _elementList.last.widgets ??= [];
      _elementList.last.widgets.add(tempWidget);
    }
  }

  List<Widget> build(
    List<md.Node> nodes, {
    TextStyle textStyle,
  }) {
    _textStyle = textStyle ?? defaultTextStyle;
    _widgets.clear();

    for (md.Node node in nodes) {
      _level = 0;
      _elementList.clear();

      node.accept(this);
    }
    return _widgets;
  }
}

class _Element {
  _Element(
    this.tag,
    this.textStyle,
  );

  final String tag;
  List<Widget> widgets;
  List<TextSpan> textSpans;
  TextStyle textStyle;
}

Widget _resolveToLi(_Element last) {
  final temp = <Widget>[];
  temp.add(Padding(
    padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
    child: Icon(
      Icons.circle,
      size: 10,
    ),
  ));
  temp.add(RichText(
    text: TextSpan(
      children: last.textSpans,
      style: last.textStyle,
    ),
  ));
  if (last.widgets != null) {
    temp.add(Container(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: last.widgets,
      ),
    ));
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: temp,
  );
}

Widget _resolveToPre(_Element last) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
    child: Container(
      color: const Color(0xffeeeeee),
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: last.widgets,
      ),
    ),
  );
}
