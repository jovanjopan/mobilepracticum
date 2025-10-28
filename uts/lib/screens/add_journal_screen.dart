import 'package:flutter/material.dart';
import '../data_models/journal_entry.dart';
import '../core/db_helper.dart';
import '../network/ai_insight_service.dart';

class AddJournalScreen extends StatefulWidget {
  const AddJournalScreen({super.key});

  @override
  State<AddJournalScreen> createState() => _AddJournalScreenState();
}

class _AddJournalScreenState extends State<AddJournalScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String selectedMood = 'Happy';
  int selectedMoodScore = 5;
  bool isSaving = false;
  String aiInsight = "";

  Future<void> _saveEntry() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields.")),
      );
      return;
    }

    setState(() => isSaving = true);

    try {
      // 🧠 1. Ambil teks jurnal dan mood untuk dikirim ke Gemini
      final content = _contentController.text.trim();
      final mood = selectedMood;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Generating AI insight...')),
      );

      // 🌟 2. Panggil AI untuk membuat insight reflektif
      final insight = await AIInsightService.generateInsight(content, mood);
      aiInsight = insight;

      // 📝 3. Buat objek jurnal lengkap dengan insight
      final entry = JournalEntry(
        title: _titleController.text.trim(),
        content: content,
        mood: mood,
        moodScore: selectedMoodScore,
        date: DateTime.now().toIso8601String(),
        insight: insight,
      );

      // 💾 4. Simpan ke database
      await DBHelper.instance.insertJournal(entry);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Journal & AI Insight saved successfully!')),
      );

      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving journal: $e')),
      );
    } finally {
      setState(() => isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Journal")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Enter a title' : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: selectedMood,
                  items: ['Happy', 'Sad', 'Calm', 'Tired', 'Excited']
                      .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                      .toList(),
                  onChanged: (v) => setState(() => selectedMood = v!),
                  decoration: const InputDecoration(labelText: 'Mood'),
                ),
                const SizedBox(height: 16),
                Text("Mood Score: $selectedMoodScore"),
                Slider(
                  value: selectedMoodScore.toDouble(),
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: selectedMoodScore.toString(),
                  onChanged: (v) =>
                      setState(() => selectedMoodScore = v.toInt()),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _contentController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Your thoughts...',
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => (v == null || v.trim().isEmpty)
                      ? 'Please write something'
                      : null,
                ),
                const SizedBox(height: 24),
                Center(
                  child: ElevatedButton.icon(
                    onPressed: isSaving ? null : _saveEntry,
                    icon: const Icon(Icons.save),
                    label: Text(isSaving ? "Saving..." : "Save Journal"),
                  ),
                ),
                const SizedBox(height: 20),
                if (aiInsight.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "💬 AI Insight:\n$aiInsight",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.purpleAccent,
                        height: 1.4,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
