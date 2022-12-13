abstract class ChangeThemeEvent {
  // late int elementIndex;
}

class SetThemeEvent extends ChangeThemeEvent {
  final int index;
  SetThemeEvent({
    required this.index,
  });
}