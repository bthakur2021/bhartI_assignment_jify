
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'jify_image_provider.dart';

final imageProvider = ChangeNotifierProvider<JifyImageProvider>((ref){
  return JifyImageProvider();
});