abstract class ChangeThemeEvent {
  late int index;
}

class SetThemeEvent extends ChangeThemeEvent {
  final int index;
  SetThemeEvent({
    required this.index,
  });
}