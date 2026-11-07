import 'package:flutter_test/flutter_test.dart';
import 'package:lock/main.dart';

void main() {
  testWidgets('BdAddressPicker renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(BdAddressPicker), findsOneWidget);
  });
}
