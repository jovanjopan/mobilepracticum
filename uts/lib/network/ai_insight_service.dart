import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIInsightService {
  static final String _apiKey = dotenv.env['GEMINI_API_KEY'] ?? '';
  static final String _endpoint =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$_apiKey";

  static Future<String> generateInsight(String content, String mood) async {
    final prompt =
        """
Analisis isi jurnal berikut secara empatik.
User menulis dengan mood '$mood'.
Buat hanya SATU kalimat pendek (maksimal 25 kata) dalam Bahasa Indonesia.
Gunakan gaya bicara alami dan ramah, tanpa format tebal, miring, tanda bintang, atau simbol markdown lainnya.
Tulis hanya teks biasa, tanpa tanda kutip, tanpa emoji, dan tanpa paragraf tambahan. dengan isi kalimat yang:
1. Mencerminkan perasaan user, dan 
2. Memberikan saran lembut atau motivasi ringan yang singkat.

Isi jurnal:
$content
""";

    try {
      print('🛰️ [AIInsightService] Mengirim permintaan ke Gemini...');
      print('🧠 Prompt: $prompt');

      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompt},
              ],
            },
          ],
        }),
      );

      print('📡 Status Code: ${response.statusCode}');
      print('🧾 Body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        String text =
            data['candidates']?[0]?['content']?['parts']?[0]?['text'] ?? '';

        // 🧹 Bersihkan format markdown dan simbol yang tidak diinginkan
        text = text
            .replaceAll(RegExp(r'[\*\_>`#"]'), '') // hapus simbol markdown
            .replaceAll(RegExp(r'\s+'), ' ') // rapikan spasi berlebih
            .trim();

        // ✂️ Jika lebih dari satu kalimat, ambil kalimat pertama saja
        if (text.contains('.')) {
          text = text.split('.').first.trim() + '.';
        }

        return text.isEmpty
            ? "Kamu sedang mencoba memahami perasaanmu dengan baik hari ini."
            : text;
      } else {
        final message =
            jsonDecode(response.body)['error']?['message'] ?? 'Tidak diketahui';
        return "Koneksi AI gagal (${response.statusCode}): $message";
      }
    } catch (e) {
      print('❌ Exception: $e');
      return "Kesalahan koneksi: $e";
    }
  }
}
