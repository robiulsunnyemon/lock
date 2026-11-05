import 'package:flutter_test/flutter_test.dart';
import 'package:lock/main.dart';

void main() {
  testWidgets('BdAddressPicker renders division dropdown', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('বিভাগ নির্বাচন করুন (Select Division)'), findsOneWidget);
    expect(find.text('জেলা নির্বাচন করুন (Select District)'), findsOneWidget);
    expect(find.text('উপজেলা নির্বাচন করুন (Select Upazila)'), findsOneWidget);
  });
}
