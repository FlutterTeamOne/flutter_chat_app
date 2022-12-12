abstract class ChangeThemeEvent {
  late int index;
}

class SetTheme extends ChangeThemeEvent {
  final int index;

  SetTheme({
    required this.index,
  });
}