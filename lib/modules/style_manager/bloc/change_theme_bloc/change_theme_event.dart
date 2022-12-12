abstract class ChangeThemeEvent {
  late int index;
}

class LightThemeDeepPurpleEvent extends ChangeThemeEvent {
  late int index;
  LightThemeDeepPurpleEvent({
   required this.index,
});
}

class LightThemeLightBlueEvent extends ChangeThemeEvent {
  late int index;
  LightThemeLightBlueEvent({
    required this.index,
  });
}

class LightThemeOrangeEvent extends ChangeThemeEvent {
  late int index;
  LightThemeOrangeEvent({
    required this.index,
  });
}

class DarkThemeDeepPurpleEvent extends ChangeThemeEvent {
  late int index;
  DarkThemeDeepPurpleEvent({
    required this.index,
  });
}

class DarkThemeLightBlueEvent extends ChangeThemeEvent {
  late int index;
  DarkThemeLightBlueEvent({
    required this.index,
  });
}

class DarkThemeOrangeEvent extends ChangeThemeEvent {
  late int index;
  DarkThemeOrangeEvent({
    required this.index,
  });
}
