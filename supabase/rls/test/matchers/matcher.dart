import 'package:supabase/supabase.dart';
import 'package:test/test.dart';

enum RlsErrorDetailsType {
  forbidden._('Forbidden'),
  unauthorized._('Unauthorized'),
  ;

  const RlsErrorDetailsType._(this.value);

  final String value;
}

Matcher throwsRlsError(String tableName, RlsErrorDetailsType detailsType) {
  return throwsA(
    isA<PostgrestException>()
        .having(
          (e) => e.message,
          'message',
          'new row violates row-level security policy for table "$tableName"',
        )
        .having(
          (e) => int.parse(e.code!),
          'code',
          42501,
        )
        .having(
          (e) => e.details,
          'details',
          detailsType.value,
        ),
  );
}
