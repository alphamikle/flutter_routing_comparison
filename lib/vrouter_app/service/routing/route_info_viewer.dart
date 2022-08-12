import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart';
import 'package:vrouter/vrouter.dart';

String prettyJson(Map<String, dynamic> json) {
  const JsonEncoder jsonEncoder = JsonEncoder.withIndent(' ');
  return jsonEncoder.convert(json);
}

class RouteInfoViewer extends StatelessWidget {
  const RouteInfoViewer({super.key});

  String generateContent(BuildContext context) => '''
# Route info

## Current route

```json
${currentRouteToJson(context)}
```

## Previous route

```json
${previousRouteToJson(context)}
```
''';

  String currentRouteToJson(BuildContext context) => prettyJson({
        'path': context.vRouter.path,
        'url': context.vRouter.url,
        'hash': context.vRouter.hash,
        'names': context.vRouter.names,
        'path_parameters': context.vRouter.pathParameters,
        'query_parameters': context.vRouter.queryParameters,
        'history_state': context.vRouter.historyState,
      });

  String previousRouteToJson(BuildContext context) => prettyJson({
        'path': context.vRouter.previousPath,
        'url': context.vRouter.previousUrl,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: MarkdownBody(
        data: generateContent(context),
        extensionSet: ExtensionSet.gitHubFlavored,
      ),
    );
  }
}
