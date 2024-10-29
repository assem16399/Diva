import 'dart:async';

import 'package:diva/core/di/dependency_injection.dart';
import 'package:event_bus/event_bus.dart';

mixin EventBusMixin {
  StreamSubscription<T> listenEvent<T>(void Function(T) onData,
      {Function? onError}) {
    return getIt<EventBus>().on<T>().listen(onData, onError: onError);
  }

  void shareEvent<S>(S event) => getIt<EventBus>().fire(event);
}
