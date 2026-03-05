import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/enums/payment_status.dart';
import '../../domain/models/payment_transaction.dart';

abstract class PaymentRepository {
  Future<String> createTransaction(PaymentTransaction txn);
  Future<void> updateTransactionStatus({
    required String txnId,
    required PaymentStatus status,
    String? responseCode,
    String? responseMessage,
  });
}

class FirebasePaymentRepository implements PaymentRepository {
  final FirebaseFirestore firestore;

  FirebasePaymentRepository(this.firestore);

  @override
  Future<String> createTransaction(PaymentTransaction txn) async {
    final docRef = await firestore.collection('payment_transactions').add({
      'orderId': txn.transactionId,
      'amount': txn.amount,
      'status': txn.status.name.toUpperCase(),
      'responseCode': txn.responseCode,
      'responseMessage': txn.responseMessage,
      'createdAt': FieldValue.serverTimestamp(),
    });
    return docRef.id;
  }

  @override
  Future<void> updateTransactionStatus({
    required String txnId,
    required PaymentStatus status,
    String? responseCode,
    String? responseMessage,
  }) async {
    await firestore.collection('payment_transactions').doc(txnId).update({
      'status': status.name.toUpperCase(),
      'responseCode': responseCode,
      'responseMessage': responseMessage,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }
}
