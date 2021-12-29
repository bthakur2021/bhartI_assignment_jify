
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'image_provider.dart';

final imageProvider = ChangeNotifierProvider<ImageProvider>((ref){
  return ImageProvider();
});