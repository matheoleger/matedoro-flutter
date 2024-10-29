import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:matedoro_flutter/providers/pomodoro.provider.dart';
import 'package:matedoro_flutter/widgets/history/history_item_widget.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  Future<List<HistoryItemWidget>> getHistoryItemsWidgets(PomodoroProvider pomodoroProvider) async {
    var historyItems = await pomodoroProvider.getHistory();

    return historyItems.map((item) => HistoryItemWidget(historyItem: item,)).toList();
  }

  @override
  Widget build(BuildContext context) { 
    final pomodoroProvider = Provider.of<PomodoroProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("H I S T O R Y"),
        titleTextStyle: TextStyle(fontSize: 18, color: Colors.black),
        centerTitle: true,
        leading: IconButton( 
          icon: Icon(LucideIcons.chevronLeft), 
          onPressed: () => Navigator.pop(context) 
        ),
      ),
      body: FutureBuilder<List<HistoryItemWidget>>(
        future: getHistoryItemsWidgets(pomodoroProvider),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('The history is empty...'));
          } else {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: snapshot.data!,
                ),
              ),
            );
          }
        },
      )
    );
  }
}