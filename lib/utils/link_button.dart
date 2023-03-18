import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  const LinkButton(
      {Key? key,
      required this.urlLabel,
      required this.url,
      required this.text_color,
      required this.size,
      })
      : super(key: key);

  final String urlLabel;
  final String url;
  final Color text_color;
  final double size;

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.compact,
        minimumSize: const Size(0, 0),
        textStyle: TextStyle(color: Colors.yellow),
      ),
      onPressed: () {
        _launchUrl(url);
      },
      child: Text(
        urlLabel,
        style: GoogleFonts.inter(fontSize: height * size, color: text_color),
      ),
    );
  }
}
