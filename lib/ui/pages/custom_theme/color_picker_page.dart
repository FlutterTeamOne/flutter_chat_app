import 'package:chat_app/main.dart';
import 'package:chat_app/modules/style_manager/riverpod/theme_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modules/style_manager/riverpod/riverpod_providers.dart';
import '../../widgets/custom_theme/color_indicator.dart';
import '../../widgets/custom_theme/color_tools.dart';
import '../../widgets/custom_theme/flex_color_picker.dart';

class ColorPickerPage extends ConsumerStatefulWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ColorPickerPage> createState() => _ColorPickerPageState();
}

class _ColorPickerPageState extends ConsumerState<ColorPickerPage> {
  late Color screenPickerColor; // Color for picker shown in Card on the screen.
  late Color dialogPickerColor; // Color for picker in dialog using onChanged
  late Color dialogSelectColor; // Color for picker using color select dialog.
  late bool isDark;
  static const List<String> fontFamilyList = <String>[
    'Roboto',
    'SeymourOne-Regular',
    'Lato-Regular'
  ];

  // Define some custom colors for the custom picker segment.
  // The 'guide' color values are from
  // https://material.io/design/color/the-color-system.html#color-theme-creation
  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  // Make a custom ColorSwatch to name map from the above custom colors.
  final Map<ColorSwatch<Object>, String> colorsNameMap =
      <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  @override
  void initState() {
    screenPickerColor = ref.read(changeCustomThemeStateProvider).primaryColor!;
    dialogPickerColor = ref.read(changeCustomThemeStateProvider).primaryColor!;
    dialogSelectColor = const Color(0xFFA239CA);
    isDark =
        ref.read(changeCustomThemeStateProvider).brightness == Brightness.dark
            ? true
            : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(changeCustomThemeStateProvider);
    String? fontFamilyValue = state.fontFamily;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Custom theme'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        children: <Widget>[
          const SizedBox(height: 16),
          // Pick color in a dialog.
          ListTile(
            title: const Text('Click this color to modify it in a dialog. '
                'The color is modified while dialog is open, but returns '
                'to previous value if dialog is cancelled'),
            subtitle: Text(
              // ignore: lines_longer_than_80_chars
              '${ColorTools.materialNameAndCode(dialogPickerColor, colorSwatchNameMap: colorsNameMap)} '
              'aka ${ColorTools.nameThatColor(dialogPickerColor)}',
            ),
            trailing: ColorIndicator(
              width: 44,
              height: 44,
              borderRadius: 4,
              color: dialogPickerColor,
              onSelectFocus: false,
              onSelect: () async {
                // Store current color before we open the dialog.
                final Color colorBeforeDialog = dialogPickerColor;
                // Wait for the picker to close, if dialog was dismissed,
                // then restore the color we had before it was opened.
                if (!(await colorPickerDialog(state, context, ref))) {
                  setState(() {
                    dialogPickerColor = colorBeforeDialog;
                  });
                }
              },
            ),
          ),

          // Show the selected color.
          ListTile(
            title: const Text('Select color below to change this color'),
            subtitle:
                Text('${ColorTools.materialNameAndCode(screenPickerColor)} '
                    'aka ${ColorTools.nameThatColor(screenPickerColor)}'),
            trailing: ColorIndicator(
              width: 44,
              height: 44,
              borderRadius: 22,
              color: screenPickerColor,
            ),
          ),

          // Show the color picker in sized box in a raised card.
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Card(
                elevation: 2,
                child: ColorPicker(
                  // Use the screenPickerColor as start color.
                  color: screenPickerColor,

                  /// Update the screenPickerColor using the callback.
                  onColorChanged: (Color color) {
                    setState(() => screenPickerColor = color);
                    ref
                        .read(changeCustomThemeStateProvider.notifier)
                        .update((state) => UserThemeData(
                              brightness: state.brightness,
                              borderRadius: state.borderRadius,
                              fontSizeFactor: state.fontSizeFactor,
                              fontFamily: state.fontFamily,
                              textColor: state.textColor,
                              primaryColor: color,
                            ));
                    print(color);
                  },
                  width: 44,
                  height: 44,
                  borderRadius: 22,
                  heading: Text(
                    'Select color',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  subheading: Text(
                    'Select color shade',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            ),
          ),

          /// Theme mode toggle
          SwitchListTile(
            title: const Text('Turn ON for dark mode'),
            subtitle: const Text('Turn OFF for light mode'),
            value: isDark,
            onChanged: (bool value) {
              setState(() {
                isDark = value;
              });
              late var brightness = value ? Brightness.dark : Brightness.light;
              ref
                  .read(changeCustomThemeStateProvider.notifier)
                  .update((state) => UserThemeData(
                        brightness: brightness,
                        borderRadius: state.borderRadius,
                        fontSizeFactor: state.fontSizeFactor,
                        fontFamily: state.fontFamily,
                        textColor: brightness == Brightness.light
                            ? Colors.black87
                            : Colors.white,
                        primaryColor: state.primaryColor,
                      ));
              // initState();
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Rounded border button
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(changeCustomThemeStateProvider.notifier)
                        .update((state) => UserThemeData(
                              brightness: state.brightness,
                              borderRadius: 20,
                              fontSizeFactor: state.fontSizeFactor,
                              fontFamily: state.fontFamily,
                              textColor: state.textColor,
                              primaryColor: state.primaryColor,
                            ));
                  },
                  child: const Text('Rounded border')),
              const SizedBox(
                width: 8,
              ),

              /// Squared border button
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(changeCustomThemeStateProvider.notifier)
                        .update((state) => UserThemeData(
                              brightness: state.brightness,
                              borderRadius: 0,
                              fontSizeFactor: state.fontSizeFactor,
                              fontFamily: state.fontFamily,
                              textColor: state.textColor,
                              primaryColor: state.primaryColor,
                            ));
                  },
                  child: const Text('Squared border')),
              const SizedBox(
                width: 8,
              ),

              /// Normal text size button
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(changeCustomThemeStateProvider.notifier)
                        .update((state) => UserThemeData(
                              brightness: state.brightness,
                              borderRadius: state.borderRadius,
                              fontSizeFactor: 1,
                              fontFamily: state.fontFamily,
                              textColor: state.textColor,
                              primaryColor: state.primaryColor,
                            ));
                  },
                  child: const Text('Normal text size')),
              const SizedBox(
                width: 8,
              ),

              /// Big text size button
              ElevatedButton(
                  onPressed: () {
                    ref
                        .read(changeCustomThemeStateProvider.notifier)
                        .update((state) => UserThemeData(
                              brightness: state.brightness,
                              borderRadius: state.borderRadius,
                              fontSizeFactor: 1.1,
                              fontFamily: state.fontFamily,
                              textColor: state.textColor,
                              primaryColor: state.primaryColor,
                            ));
                  },
                  child: const Text('Big text size')),

              /// Font family change
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton<String>(
                    value: fontFamilyValue,
                    items: fontFamilyList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text('$value font'),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        fontFamilyValue = value!;
                      });
                      ref
                          .read(changeCustomThemeStateProvider.notifier)
                          .update((state) => UserThemeData(
                                brightness: state.brightness,
                                borderRadius: state.borderRadius,
                                fontSizeFactor: state.fontSizeFactor,
                                fontFamily: value,
                                textColor: state.textColor,
                                primaryColor: state.primaryColor,
                              ));
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Color picker dialog
  Future<bool> colorPickerDialog(state, context, ref) async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) {
        setState(() => dialogPickerColor = color);
        ref
            .read(changeCustomThemeStateProvider.notifier)
            .update((state) => UserThemeData(
                  brightness: state.brightness,
                  borderRadius: state.borderRadius,
                  fontSizeFactor: state.fontSizeFactor,
                  fontFamily: state.fontFamily,
                  textColor: state.textColor,
                  primaryColor: color,
                ));
        print(color);
      },
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorNameTextStyle: Theme.of(context).textTheme.bodySmall,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyMedium,
      colorCodePrefixStyle: Theme.of(context).textTheme.bodySmall,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      actionsPadding: const EdgeInsets.all(16),
      constraints:
          const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }
}
