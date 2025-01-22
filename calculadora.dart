import 'package:calculadora_1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App functionality test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verificar se a mensagem inicial está sendo exibida.
    expect(find.text('Bem-vindo à Calculadora!'), findsOneWidget);
    expect(find.text('Aproveite para fazer seus cálculos!'), findsNothing);

    // Tap no botão personalizado e disparar o frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verificar se a mensagem muda após clicar no botão.
    expect(find.text('Bem-vindo à Calculadora!'), findsNothing);
    expect(find.text('Aproveite para fazer seus cálculos!'), findsOneWidget);

    // Verificar a interação do FloatingActionButton.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verificar se uma SnackBar aparece.
    expect(find.text('Botão Flutuante Pressionado!'), findsOneWidget);

    // Verificar o funcionamento do widget Calculadora.
    await tester.enterText(find.byKey(const Key('input1')), '5');
    await tester.enterText(find.byKey(const Key('input2')), '10');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Calcular'));
    await tester.pump();

    // Verificar se o SnackBar de "Cálculo realizado!" aparece.
    expect(find.text('Cálculo realizado!'), findsOneWidget);
  });
}
