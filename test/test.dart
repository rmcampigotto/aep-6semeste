import 'package:flutter_test/flutter_test.dart';
import 'package:mfa_app/main.dart';

void main() {
  testWidgets('Adicionar novo token atualiza a interface', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Adicionar Novo Token'), findsOneWidget);

    await tester.tap(find.text('Adicionar Novo Token'));
    await tester.pumpAndSettle();

    expect(find.textContaining('-'), findsWidgets);
  });
}
