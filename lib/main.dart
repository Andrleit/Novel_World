import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  await Supabase.initialize(
    url: 'https://vdmbsbzuxoqvpccoyvnq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZkbWJzYnp1eG9xdnBjY295dm5xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI1MzgzMzUsImV4cCI6MjA3ODExNDMzNX0.DnGzavJ82zzccJ9AXn5xwx8eGeT1dFtJA87nP1HCW4o',
  );

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
// Get a reference your Supabase client
final supabase = Supabase.instance.client;
