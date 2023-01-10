import 'package:chat_app/main.dart';
import 'package:chat_app/modules/style_manager/riverpod/theme_models.dart';
import 'package:chat_app/modules/style_manager/utils/style_manager_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final defaultThemeData = UserThemeData(
    fontFamily: 'Roboto',
    fontSizeFactor: 1,
    textColor: Colors.black87,
    brightness: Brightness.light,
    primaryColor: StyleManagerUtils().createMaterialColor(const Color(0xFFFF9800)),
    borderRadius: 20);

final changeCustomThemeStateProvider = StateProvider<UserThemeData>((ref) {
  return defaultThemeData;
});

class Listener extends Mock {
  void call(UserThemeData? previous, UserThemeData value);
}

void main() {
  group('change theme tests riverpod', () {
    test('change theme test', () {
      final container = ProviderContainer();
      addTearDown(container.dispose);
      final listener = Listener();
      final newThemeData = UserThemeData(
          fontFamily: 'Roboto',
          fontSizeFactor: 2,
          textColor: Colors.white,
          brightness: Brightness.dark,
          primaryColor: StyleManagerUtils().createMaterialColor(const Color(0xFFFF9700)),
          borderRadius: 0);

      container.listen<UserThemeData>(
        changeCustomThemeStateProvider,
        listener,
        fireImmediately: true,
      );

      verify(listener(null, defaultThemeData)).called(1);
      verifyNoMoreInteractions(listener);

      container
          .read(changeCustomThemeStateProvider.notifier)
          .update((state) => newThemeData);

      verify(listener(defaultThemeData, newThemeData)).called(1);
      verifyNoMoreInteractions(listener);
      expect(container
          .read(changeCustomThemeStateProvider.notifier).state, newThemeData);
    });
  });

  test('state is not shared between tests', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    final listener = Listener();

    container.listen<UserThemeData>(
      changeCustomThemeStateProvider,
      listener,
      fireImmediately: true,
    );

    verify(listener(null, defaultThemeData)).called(1);
    verifyNoMoreInteractions(listener);
  });
}
