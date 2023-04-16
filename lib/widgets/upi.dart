import 'package:upi_india/upi_india.dart';
UpiIndia _upiIndia = UpiIndia();

UpiApp app = UpiApp.paytm;
Future<UpiResponse> initiateTransaction(UpiApp app,String upiid ,String name) async {
  return _upiIndia.startTransaction(
    app: app,
    receiverUpiId: upiid,
    receiverName: name,
    transactionRefId: 'TestingUpiIndiaPlugin',
    transactionNote: '',
    amount: 1.00,
  );
}
