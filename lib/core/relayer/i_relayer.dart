import 'package:logger/logger.dart';
import 'package:wallet_connect/core/i_core.dart';
import 'package:wallet_connect/core/messages/types.dart';
import 'package:wallet_connect/core/publisher/types.dart';
import 'package:wallet_connect/core/relayer/types.dart';
import 'package:wallet_connect/core/subscriber/types.dart';
import 'package:wallet_connect/wc_utils/jsonrpc/provider/types.dart';
import 'package:wallet_connect/wc_utils/misc/events/events.dart';

abstract class IRelayer with IEvents {
  ICore get core;

  Logger? get logger;

  String? get relayUrl;

  String? get projectId;

  ISubscriber get subscriber;

  IPublisher get publisher;

  IMessageTracker get messages;

  IJsonRpcProvider get provider;

  String get name;

  bool get transportExplicitlyClosed;

  bool get connected;

  bool get connecting;

  Future<void> init();

  Future<void> publish({
    required String topic,
    required String message,
    RelayerPublishOptions? opts,
  });

  Future<String> subscribe({
    required String topic,
    RelayerSubscribeOptions? opts,
  });

  Future<void> unsubscribe({
    required String topic,
    RelayerUnsubscribeOptions? opts,
  });

  Future<void> transportClose();

  Future<void> transportOpen({String? relayUrl});
}