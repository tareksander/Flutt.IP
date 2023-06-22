import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../main.dart';
import 'dart:async';
import '../settings.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(AppLocalizations.of(context)!.welcomeHeading),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(20),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Text(AppLocalizations.of(context)!.welcomeNotice),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: !kDebugMode
                        ? TimedButton(
                            duration: 15,
                            child: Text(AppLocalizations.of(context)!
                                .welcomeUnderstand),
                            onPressed: () => router.go("/introduction2"),
                          )
                        : ElevatedButton(
                            onPressed: () => router.go("/introduction2"),
                            child: Text(AppLocalizations.of(context)!
                                .welcomeUnderstand)),
                  ),
                )
              ])),
        ));
  }
}

class WelcomePage2 extends StatelessWidget {
  const WelcomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.welcomeLoginHeading),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "${AppLocalizations.of(context)!.loginMethods}\n",
                        style: const TextStyle(fontSize: 20),
                      ),
                      TextSpan(
                          text: AppLocalizations.of(context)!.welcomeLoginText),
                      TextSpan(
                          text:
                              "• ${AppLocalizations.of(context)!.authUsernamePassword}: ",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text.rich(
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .authUsernamePasswordDesc),
                          ),
                        ),
                      ),
                      TextSpan(
                          text:
                              "• ${AppLocalizations.of(context)!.authUsernamePasswordUnsaved}: ",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text.rich(
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .authUsernamePasswordUnsavedDesc),
                          ),
                        ),
                      ),
                      TextSpan(
                          text:
                              "• ${AppLocalizations.of(context)!.authCookie}: ",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text.rich(
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .authCookieDesc),
                          ),
                        ),
                      ),
                      TextSpan(
                          text:
                              "• ${AppLocalizations.of(context)!.authOAuth}: ",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text.rich(
                            TextSpan(
                                text: AppLocalizations.of(context)!
                                    .authOAuthDesc),
                          ),
                        ),
                      ),
                      TextSpan(
                        text:
                            "${AppLocalizations.of(context)!.accountManagement}\n",
                        style: const TextStyle(fontSize: 20),
                      ),
                      TextSpan(
                        text:
                            AppLocalizations.of(context)!.accountManagementText,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: Center(
                    child: ElevatedButton(
                      child: Text(AppLocalizations.of(context)!.next),
                      onPressed: () => router.go("/introduction3"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimedButtonState extends State<TimedButton> {
  Timer? t;
  int remaining = 0;

  @override
  void initState() {
    super.initState();
    remaining = widget.duration;
    t = Timer.periodic(const Duration(seconds: 1), _callback);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _callback(Timer t) {
    setState(() {
      if (remaining > 0) {
        remaining--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: remaining == 0 ? widget.onPressed : () {},
      child: remaining == 0 ? widget.child : Text(remaining.toString()),
    );
  }
}

class TimedButton extends StatefulWidget {
  final int duration;
  final void Function() onPressed;
  final Widget child;

  const TimedButton(
      {super.key,
      this.duration = 5,
      required this.onPressed,
      required this.child});

  @override
  State<StatefulWidget> createState() {
    return _TimedButtonState();
  }
}

class WelcomePage3 extends ConsumerWidget {
  const WelcomePage3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var theme = ref.watch(themeProvider);
    themeChanged(newt) => {ref.read(themeProvider.notifier).setTheme(newt!)};
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(AppLocalizations.of(context)!.appSettingsHeading),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!.themeText,
                      style: const TextStyle(fontSize: 18),
                    )),
                theme.when(
                    data: (t) => Column(
                          children: [
                            RadioListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.themeNative),
                                value: AppTheme.native,
                                groupValue: t,
                                onChanged: themeChanged),
                            RadioListTile(
                                title: Text(AppLocalizations.of(context)!
                                    .themeMaterial),
                                value: AppTheme.material,
                                groupValue: t,
                                onChanged: themeChanged),
                            RadioListTile(
                                title: Text(AppLocalizations.of(context)!
                                    .themeCupertino),
                                value: AppTheme.cupertino,
                                groupValue: t,
                                onChanged: themeChanged),
                            RadioListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.themeMacOS),
                                value: AppTheme.macos,
                                groupValue: t,
                                onChanged: themeChanged),
                            RadioListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.themeFluent),
                                value: AppTheme.fluent,
                                groupValue: t,
                                onChanged: themeChanged),
                            RadioListTile(
                                title: Text(
                                    AppLocalizations.of(context)!.themeStudip),
                                value: AppTheme.studip,
                                groupValue: t,
                                onChanged: themeChanged),
                          ],
                        ),
                    error: (_, t) => const SizedBox.shrink(),
                    loading: () => const SizedBox.shrink()),
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.next),
                  onPressed: () => router.go("/introduction4"),
                ),
              ])),
        ));
  }
}

class WelcomePage4 extends StatelessWidget {
  const WelcomePage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(AppLocalizations.of(context)!.navigationHeading),
        ),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(children: [
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.next),
                  onPressed: () => router.go("/loginAuthSelect"),
                ),
              ])),
        ));
  }
}
