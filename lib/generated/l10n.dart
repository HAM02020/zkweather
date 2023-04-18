// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `zkweather`
  String get title {
    return Intl.message(
      'zkweather',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `notifications`
  String get notifications {
    return Intl.message(
      'notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `library`
  String get library {
    return Intl.message(
      'library',
      name: 'library',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get message {
    return Intl.message(
      'message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `person`
  String get person {
    return Intl.message(
      'person',
      name: 'person',
      desc: '',
      args: [],
    );
  }

  /// `Beijing`
  String get beijing {
    return Intl.message(
      'Beijing',
      name: 'beijing',
      desc: '',
      args: [],
    );
  }

  /// `Shanghai`
  String get shanghai {
    return Intl.message(
      'Shanghai',
      name: 'shanghai',
      desc: '',
      args: [],
    );
  }

  /// `Dalian`
  String get dalian {
    return Intl.message(
      'Dalian',
      name: 'dalian',
      desc: '',
      args: [],
    );
  }

  /// `Chongqing`
  String get chongqing {
    return Intl.message(
      'Chongqing',
      name: 'chongqing',
      desc: '',
      args: [],
    );
  }

  /// `Hangzhou`
  String get hangzhou {
    return Intl.message(
      'Hangzhou',
      name: 'hangzhou',
      desc: '',
      args: [],
    );
  }

  /// `Guangzhou`
  String get guangzhou {
    return Intl.message(
      'Guangzhou',
      name: 'guangzhou',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get word_city {
    return Intl.message(
      '',
      name: 'word_city',
      desc: '',
      args: [],
    );
  }

  /// `H:`
  String get high {
    return Intl.message(
      'H:',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `L:`
  String get low {
    return Intl.message(
      'L:',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get windScale {
    return Intl.message(
      '',
      name: 'windScale',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
