import 'package:flutter/foundation.dart';

import './api_keys.dart';

enum Endpoint {
  cases,
  casesSuspect,
  casesConfirmed,
  deaths,
  recovered,
}

class API {
  final String apiKey;

  API({
    @required this.apiKey,
  });

  factory API.sandbox() => API(apiKey: APIKeys.ncovSandboxkey);

  static final String host = "ncov2019-admin.firebaseapp.com";

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        path: 'token',
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: '',
        host: '',
        path: _path[endpoint],
      );

  static Map<Endpoint, String> _path = {
    Endpoint.cases: 'case',
    Endpoint.casesConfirmed: 'casesConfirmed',
    Endpoint.casesSuspect: 'casesSuspect',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}
