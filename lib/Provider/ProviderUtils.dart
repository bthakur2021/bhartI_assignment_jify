
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'GetImageProvider.dart';

final getImageProvider = ChangeNotifierProvider<GetImageProvider>((ref){
  return GetImageProvider();
});