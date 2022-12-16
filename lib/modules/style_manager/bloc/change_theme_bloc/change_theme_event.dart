abstract class ChangeThemeEvent {
}

class SetThemeEvent extends ChangeThemeEvent {
  final int index;
  SetThemeEvent({
    required this.index,
  });
}
