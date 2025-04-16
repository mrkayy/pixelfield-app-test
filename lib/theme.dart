import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

AppColors get themeColor => AppColors();

final class CustomThemeData {
  CustomThemeData._internal();

  static final CustomThemeData _instance = CustomThemeData._internal();

  factory CustomThemeData() {
    return _instance;
  }

  // Getter for the ThemeData
  ThemeData get themeData => _buildThemeData();

  // Build the ThemeData
  ThemeData _buildThemeData() {
    // Defined ColorScheme
    final ColorScheme colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: const Color(0xFFD49A00), // Gold for buttons, accents
      onPrimary: const Color(0xFF1A2A3A), // Dark background for text on buttons
      secondary: const Color(0xFF14202C), // Darker teal for cards
      onSecondary: const Color(0xFFFFFFFF), // White text on secondary
      surface: const Color(0xFF1A2A3A), // Main background
      onSurface: const Color(0xFFFFFFFF), // White text on background
      error: Colors.redAccent,
      onError: Colors.white,
      primaryContainer: const Color(0xFFF5C518), // Gold for containers
      onPrimaryContainer: const Color(0xFF1A2A3A), // Dark text on gold
      secondaryContainer: const Color(0xFF14202C),
      onSecondaryContainer: const Color(0xFFFFFFFF),
      onSurfaceVariant: const Color(0xFFFFFFFF),
      outline: const Color(0xFFF5C518), // Gold for borders
    );

    final TextTheme textTheme = TextTheme(
      displayLarge: GoogleFonts.lato(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFFFFF), // Gold for headings
      ),
      displayMedium: GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: const Color(0xFFFFFFFF),
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: const Color(0xFFFFFFFF), // White for body text
      ),
      bodyMedium: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: const Color(0xFFFFFFFF),
      ),
      labelSmall: GoogleFonts.roboto(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: const Color(0xFFFFFFFF),
      ),
    );

    final ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFF1A3A21), // Dark text/icon on button
        backgroundColor: const Color(0xFFF5C518), // Gold background
        minimumSize: Size(343.w, 56.h),
        textStyle: GoogleFonts.ebGaramond(
          fontSize: 16,
          letterSpacing: 0.1.sp,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        elevation: 2, // Slight elevation
      ),
    );

    final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF14202C), // Darker teal for input background
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: Color(0xFFF5C518), // Gold border
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFF5C518), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFF5C518), width: 2),
      ),
      labelStyle: GoogleFonts.roboto(
        fontSize: 14,
        color: const Color(0xFFFFFFFF),
      ),
      hintStyle: GoogleFonts.roboto(
        fontSize: 14,
        color: const Color(0xFFBBBBBB), // Light gray for hints
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    );

    return ThemeData(
      textTheme: textTheme,
      colorScheme: colorScheme,
      elevatedButtonTheme: elevatedButtonTheme,
      inputDecorationTheme: inputDecorationTheme,
      scaffoldBackgroundColor: const Color(0xFF0B1519), // Dark background
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1A2A3A),
        foregroundColor: const Color(0xFFFFFFFF),
        titleTextStyle: GoogleFonts.lato(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: const Color(0xFFF5C518),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFFF5C518), // Gold icons
      ),
    );
  }
}

class AppColors {
  Color get primary => Color(0xFFD49A00);
  Color get secondary => Color(0xFFFFB901);
  Color get white => Color(0xFFFFFFFF);
  Color get grey1 => Color(0xFFE7E9EA);
  Color get grey2 => Color(0xFFB8BDBF);
  Color get grey3 => Color(0xFF899194);
  Color get greyBlack1 => Color(0xFF122329);
  Color get greyBlack2 => Color(0xFF0E1C21);
  Color get greyBlack3 => Color(0xFF0B1519);
  Color get transparent => Colors.transparent;
  // Color get p => Color(0xFFF5C518);
  // Color get p => Color(0xFF1A2A3A);
  // Color get p => Color(0xFF14202C);
  // Color get p => Color(0xFFFFFFFF);
  // Color get p => Color(0xFFFFFFFF);
  // Color get p => Color(0xFFF5C518);
}
