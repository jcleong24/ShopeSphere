import 'package:cloud_functions/cloud_functions.dart';

class StripePaymentService {
  final FirebaseFunctions functions;

  StripePaymentService(this.functions);

  Future<Map<String, dynamic>> createPaymentIntent({
    required String orderId,
    required int amountIntCents,
    String currency = 'myr',
  }) async {
    final callable = functions.httpsCallable('createPaymentIntent');

    final res = await callable.call({
      'orderId': orderId,
      'amountIntCents': amountIntCents,
      'currency': currency,
    });

    final data = Map<String, dynamic>.from(res.data as Map);
    return data;
  }
}
