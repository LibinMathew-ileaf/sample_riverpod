
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_riverpod/model/interest_response.dart';

import '../apiServices.dart';

final userDataProvider = FutureProvider<List<Interests>>((ref) async {
  return ref.read(apiProvider).getInterests();
});
