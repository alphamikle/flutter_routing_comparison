import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/src/match.dart';
import 'package:markdown/markdown.dart';
import 'package:navigator_comparison/main.dart';
import 'package:vrouter/vrouter.dart';

String prettyJson(Map<String, dynamic> json) {
  const JsonEncoder jsonEncoder = JsonEncoder.withIndent(' ');
  return jsonEncoder.convert(json);
}

class CommonRouteViewer extends StatelessWidget {
  const CommonRouteViewer({super.key});

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

  String currentRouteToJson(BuildContext context) {
    if (kWithGoRouter) {
      final GoRouter router = GoRouter.of(context);
      return prettyJson({
        'location': router.location,
        'extra': router.routerDelegate.currentConfiguration.extra,
        'name': router.routerDelegate.currentConfiguration.last.route.name,
        'error': router.routerDelegate.currentConfiguration.error,
        'subloc': router.routerDelegate.currentConfiguration.last.subloc,
        'query_params': router.routerDelegate.currentConfiguration.last.queryParams,
        'full_path': router.routerDelegate.currentConfiguration.last.fullpath,
        'full_uri_string': router.routerDelegate.currentConfiguration.last.fullUriString,
        'decoded_params': router.routerDelegate.currentConfiguration.last.decodedParams,
        'query_parameters': router.routerDelegate.currentConfiguration.location.queryParameters,
        'can_pop': router.routerDelegate.currentConfiguration.canPop(),
      });
    }
    final InitializedVRouterSailor router = context.vRouter;
    return prettyJson({
      'path': router.path,
      'url': router.url,
      'hash': router.hash,
      'names': router.names,
      'path_parameters': router.pathParameters,
      'query_parameters': router.queryParameters,
      'history_state': router.historyState,
      'history_can_back': router.historyCanBack(),
    });
  }

  String previousRouteToJson(BuildContext context) {
    if (kWithGoRouter) {
      final GoRouter router = GoRouter.of(context);
      final List<RouteMatch> matches = router.routerDelegate.currentConfiguration.matches;
      return prettyJson({
        'matches': matches
            .map((RouteMatch match) => <String, dynamic>{
                  'name': match.route.name,
                  'path': match.route.path,
                  'full_uri_string': match.fullUriString,
                  'full_path': match.fullpath,
                  'query_params': match.queryParams,
                  'subloc': match.subloc,
                  'decoded_params': match.decodedParams,
                  'extra': match.extra,
                })
            .toList(),
      });
    }
    final InitializedVRouterSailor router = context.vRouter;
    return prettyJson({
      'path': router.previousPath,
      'url': router.previousUrl,
    });
  }

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
