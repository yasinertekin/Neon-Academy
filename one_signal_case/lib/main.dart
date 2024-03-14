import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _debugLabelString = "";
  String? _emailAddress;
  String? _smsNumber;
  String? _externalUserId;
  String? _language;
  bool _enableConsentButton = false;

  // CHANGE THIS parameter to true if you want to test GDPR privacy consent
  final bool _requireConsent = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    if (!mounted) return;

    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.consentRequired(_requireConsent);

    // NOTE: Replace with your own app ID from https://www.onesignal.com
    OneSignal.initialize("01394223-b0ac-467c-8dc8-443bb4eecb81");

    // AndroidOnly stat only
    // OneSignal.Notifications.removeNotification(1);
    // OneSignal.Notifications.removeGroupedNotifications("group5");

    OneSignal.Notifications.clearAll();

    OneSignal.User.pushSubscription.addObserver((state) {
      print(OneSignal.User.pushSubscription.optedIn);
      print(OneSignal.User.pushSubscription.id);
      print(OneSignal.User.pushSubscription.token);
      print(state.current.jsonRepresentation());
    });

    OneSignal.Notifications.addPermissionObserver((state) {
      print("Has permission $state");
    });

    OneSignal.Notifications.addClickListener((event) {
      print('NOTIFICATION CLICK LISTENER CALLED WITH EVENT: $event');
      setState(() {
        _debugLabelString =
            "Clicked notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.Notifications.addForegroundWillDisplayListener((event) {
      print(
          'NOTIFICATION WILL DISPLAY LISTENER CALLED WITH: ${event.notification.jsonRepresentation()}');

      /// Display Notification, preventDefault to not display
      event.preventDefault();

      /// Do async work

      /// notification.display() to display after preventing default
      event.notification.display();

      setState(() {
        _debugLabelString =
            "Notification received in foreground notification: \n${event.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });

    OneSignal.InAppMessages.addClickListener((event) {
      setState(() {
        _debugLabelString =
            "In App Message Clicked: \n${event.result.jsonRepresentation().replaceAll("\\n", "\n")}";
      });
    });
    OneSignal.InAppMessages.addWillDisplayListener((event) {
      print("ON WILL DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDisplayListener((event) {
      print("ON DID DISPLAY IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addWillDismissListener((event) {
      print("ON WILL DISMISS IN APP MESSAGE ${event.message.messageId}");
    });
    OneSignal.InAppMessages.addDidDismissListener((event) {
      print("ON DID DISMISS IN APP MESSAGE ${event.message.messageId}");
    });

    setState(() {
      _enableConsentButton = _requireConsent;
    });

    // Some examples of how to use In App Messaging public methods with OneSignal SDK
    oneSignalInAppMessagingTriggerExamples();

    // Some examples of how to use Outcome Events public methods with OneSignal SDK
    oneSignalOutcomeExamples();

    OneSignal.InAppMessages.paused(true);
  }

  void _handleSendTags() {
    print("Sending tags");
    OneSignal.User.addTagWithKey("test2", "val2");

    print("Sending tags array");
    var sendTags = {'test': 'value', 'test2': 'value2'};
    OneSignal.User.addTags(sendTags);
  }

  void _handleRemoveTag() {
    print("Deleting tag");
    OneSignal.User.removeTag("test2");

    print("Deleting tags array");
    OneSignal.User.removeTags(['test']);
  }

  void _handleGetTags() async {
    print("Get tags");

    var tags = await OneSignal.User.getTags();
    print(tags);
  }

  void _handlePromptForPushPermission() {
    print("Prompting for Permission");
    OneSignal.Notifications.requestPermission(true);
  }

  void _handleSetLanguage() {
    if (_language == null) return;
    print("Setting language");
    OneSignal.User.setLanguage(_language!);
  }

  void _handleSetEmail() {
    if (_emailAddress == null) return;
    print("Setting email");

    OneSignal.User.addEmail(_emailAddress!);
  }

  void _handleRemoveEmail() {
    if (_emailAddress == null) return;
    print("Remove email");

    OneSignal.User.removeEmail(_emailAddress!);
  }

  void _handleSetSMSNumber() {
    if (_smsNumber == null) return;
    print("Setting SMS Number");

    OneSignal.User.addSms(_smsNumber!);
  }

  void _handleRemoveSMSNumber() {
    if (_smsNumber == null) return;
    print("Remove smsNumber");

    OneSignal.User.removeSms(_smsNumber!);
  }

  void _handleConsent() {
    print("Setting consent to true");
    OneSignal.consentGiven(true);

    print("Setting state");
    setState(() {
      _enableConsentButton = false;
    });
  }

  void _handleSetLocationShared() {
    print("Setting location shared to true");
    OneSignal.Location.setShared(true);
  }

  void _handleLogin() {
    print("Setting external user ID");
    if (_externalUserId == null) return;
    OneSignal.login(_externalUserId!);
    OneSignal.User.addAlias("fb_id", "1341524");
  }

  void _handleLogout() {
    OneSignal.logout();
    OneSignal.User.removeAlias("fb_id");
  }

  oneSignalInAppMessagingTriggerExamples() async {
    /// Example addTrigger call for IAM
    /// This will add 1 trigger so if there are any IAM satisfying it, it
    /// will be shown to the user
    OneSignal.InAppMessages.addTrigger("trigger_1", "one");

    /// Example addTriggers call for IAM
    /// This will add 2 triggers so if there are any IAM satisfying these, they
    /// will be shown to the user
    Map<String, String> triggers = <String, String>{};
    triggers["trigger_2"] = "two";
    triggers["trigger_3"] = "three";
    OneSignal.InAppMessages.addTriggers(triggers);

    // Removes a trigger by its key so if any future IAM are pulled with
    // these triggers they will not be shown until the trigger is added back
    OneSignal.InAppMessages.removeTrigger("trigger_2");

    // Create a list and bulk remove triggers based on keys supplied
    List<String> keys = ["trigger_1", "trigger_3"];
    OneSignal.InAppMessages.removeTriggers(keys);

    // Toggle pausing (displaying or not) of IAMs
    OneSignal.InAppMessages.paused(true);
    var arePaused = await OneSignal.InAppMessages.arePaused();
    print('Notifications paused $arePaused');
  }

  oneSignalOutcomeExamples() async {
    OneSignal.Session.addOutcome("normal_1");
    OneSignal.Session.addOutcome("normal_2");

    OneSignal.Session.addUniqueOutcome("unique_1");
    OneSignal.Session.addUniqueOutcome("unique_2");

    OneSignal.Session.addOutcomeWithValue("value_1", 3.2);
    OneSignal.Session.addOutcomeWithValue("value_2", 3.9);
  }

  void _handleOptIn() {
    OneSignal.User.pushSubscription.optIn();
  }

  void _handleOptOut() {
    OneSignal.User.pushSubscription.optOut();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('OneSignal Flutter Demo'),
            backgroundColor: const Color.fromARGB(255, 212, 86, 83),
          ),
          body: Container(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Table(
                children: [
                  TableRow(children: [
                    OneSignalButton(
                        "Send Tags", _handleSendTags, !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton(
                        "Get Tags", _handleGetTags, !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton("Prompt for Push Permission",
                        _handlePromptForPushPermission, !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "Email Address",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 212, 86, 83),
                          )),
                      onChanged: (text) {
                        setState(() {
                          _emailAddress = text == "" ? null : text;
                        });
                      },
                    )
                  ]),
                  TableRow(children: [
                    Container(
                      height: 8.0,
                    )
                  ]),
                  TableRow(children: [
                    OneSignalButton(
                        "Set Email", _handleSetEmail, !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton("Logout Email", _handleRemoveEmail,
                        !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "SMS Number",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 212, 86, 83),
                          )),
                      onChanged: (text) {
                        setState(() {
                          _smsNumber = text == "" ? null : text;
                        });
                      },
                    )
                  ]),
                  TableRow(children: [
                    Container(
                      height: 8.0,
                    )
                  ]),
                  TableRow(children: [
                    OneSignalButton("Set SMS Number", _handleSetSMSNumber,
                        !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton("Remove SMS Number", _handleRemoveSMSNumber,
                        !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton("Provide GDPR Consent", _handleConsent,
                        _enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton("Set Location Shared",
                        _handleSetLocationShared, !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton(
                        "Remove Tag", _handleRemoveTag, !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "External User ID",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 212, 86, 83),
                          )),
                      onChanged: (text) {
                        setState(() {
                          _externalUserId = text == "" ? null : text;
                        });
                      },
                    )
                  ]),
                  TableRow(children: [
                    Container(
                      height: 8.0,
                    )
                  ]),
                  TableRow(children: [
                    OneSignalButton("Set External User ID", _handleLogin,
                        !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton("Remove External User ID", _handleLogout,
                        !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    TextField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                          hintText: "Language",
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 212, 86, 83),
                          )),
                      onChanged: (text) {
                        setState(() {
                          _language = text == "" ? null : text;
                        });
                      },
                    )
                  ]),
                  TableRow(children: [
                    Container(
                      height: 8.0,
                    )
                  ]),
                  TableRow(children: [
                    OneSignalButton("Set Language", _handleSetLanguage,
                        !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(_debugLabelString),
                    )
                  ]),
                  TableRow(children: [
                    OneSignalButton(
                        "Opt In", _handleOptIn, !_enableConsentButton)
                  ]),
                  TableRow(children: [
                    OneSignalButton(
                        "Opt Out", _handleOptOut, !_enableConsentButton)
                  ]),
                ],
              ),
            ),
          )),
    );
  }
}

typedef OnButtonPressed = void Function();

class OneSignalButton extends StatefulWidget {
  final String title;
  final OnButtonPressed onPressed;
  final bool enabled;

  const OneSignalButton(this.title, this.onPressed, this.enabled, {super.key});

  @override
  State<StatefulWidget> createState() => OneSignalButtonState();
}

class OneSignalButtonState extends State<OneSignalButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Table(
      children: [
        TableRow(children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              disabledForegroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 212, 86, 83),
              disabledBackgroundColor: const Color.fromARGB(180, 212, 86, 83),
              padding: const EdgeInsets.all(8.0),
            ),
            onPressed: widget.enabled ? widget.onPressed : null,
            child: Text(widget.title),
          )
        ]),
        TableRow(children: [
          Container(
            height: 8.0,
          )
        ]),
      ],
    );
  }
}
