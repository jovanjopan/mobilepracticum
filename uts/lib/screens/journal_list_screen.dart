import 'package:flutter/material.dart';
import '../core/db_helper.dart';
import '../data_models/journal_entry.dart';
import 'add_journal_screen.dart';
import 'journal_detail_screen.dart';

class JournalListScreen extends StatefulWidget {
  const JournalListScreen({super.key});

  @override
  State<JournalListScreen> createState() => _JournalListScreenState();
}

class _JournalListScreenState extends State<JournalListScreen> {
  List<JournalEntry> journals = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadJournals();
  }

  Future<void> _loadJournals() async {
    setState(() => isLoading = true);
    final list = await DBHelper.instance.getAllJournals();
    await Future.delayed(const Duration(milliseconds: 300)); // animasi kecil
    setState(() {
      journals = list;
      isLoading = false;
    });
  }

  String _getMoodEmoji(String mood) {
    switch (mood) {
      case 'Happy':
        return '😊';
      case 'Sad':
        return '😢';
      case 'Calm':
        return '😌';
      case 'Tired':
        return '😴';
      case 'Excited':
        return '🤩';
      default:
        return '🙂';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("My Journals"), centerTitle: true),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddJournalScreen()),
          );

          if (result == true) _loadJournals();
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Entry"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : journals.isEmpty
          ? const Center(
              child: Text(
                "✨ No journals yet.\nStart writing your first reflection!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : RefreshIndicator(
              onRefresh: _loadJournals,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                itemCount: journals.length,
                itemBuilder: (context, index) {
                  final j = journals[index];
                  final emoji = _getMoodEmoji(j.mood);
                  final formattedDate = j.date
                      .split('T')
                      .first
                      .replaceAll('-', '/');

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => JournalDetailScreen(entry: j),
                        ),
                      );
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: theme.colorScheme.primary.withOpacity(0.2),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Mood & Date Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    emoji,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    j.mood,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                formattedDate,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),

                          // Title
                          Text(
                            j.title.isEmpty ? "(No Title)" : j.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),

                          // Content preview
                          Text(
                            j.content.length > 100
                                ? '${j.content.substring(0, 100)}...'
                                : j.content,
                            style: const TextStyle(
                              color: Colors.white70,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // AI Insight snippet
                          if (j.insight != null && j.insight!.trim().isNotEmpty)
                            Text(
                              '💬 ${j.insight!.length > 80 ? j.insight!.substring(0, 80) + "..." : j.insight!}',
                              style: TextStyle(
                                fontSize: 14,
                                color: theme.colorScheme.secondary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
