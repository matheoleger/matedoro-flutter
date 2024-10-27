import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:matedoro_flutter/widgets/history/history_item.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  @override
  Widget build(BuildContext context) { 

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
      body: SingleChildScrollView(
        child: Center(child: Column(children: [
          HistoryItem(),
          HistoryItem(),
          HistoryItem(),
          HistoryItem(),
        ],)),
      ),
    );
  }
}