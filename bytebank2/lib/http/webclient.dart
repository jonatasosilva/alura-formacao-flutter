import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'interceptors/logging_interceptor.dart';

Client client = HttpClientWithInterceptor.build(interceptors: [
  LoggingInterceptor(),
]);

final Uri baseUrl = Uri.http('192.168.100.5:8080', 'transactions');
