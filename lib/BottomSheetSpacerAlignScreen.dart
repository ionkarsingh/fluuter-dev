import 'package:flutter/material.dart';

class BottomSheetSpacerAlignScreen extends StatefulWidget {
  const BottomSheetSpacerAlignScreen({super.key});

  @override
  State<BottomSheetSpacerAlignScreen> createState() =>
      _BottomSheetSpacerAlignScreenState();
}

class _BottomSheetSpacerAlignScreenState
    extends State<BottomSheetSpacerAlignScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? _sheetController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Align, Spacer, BottomSheet Demo')),
      body: Column(
        children: [
          // Using Align
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Aligned to Top Right',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ),

          // Using Spacer inside Row
          Row(
            children: [
              Icon(Icons.menu),
              Spacer(), // Takes remaining space
              Text('Centered Title'),
              Spacer(),
              Icon(Icons.search),
            ],
          ),

          SizedBox(height: 40),

          Center(
            child: ElevatedButton(
              onPressed: _showModalBottomSheet,
              child: Text('Show Modal Bottom Sheet'),
            ),
          ),

          Center(
            child: ElevatedButton(
              onPressed: _showPersistentBottomSheet,
              child: Text('Show Persistent Bottom Sheet'),
            ),
          ),
        ],
      ),
    );
  }

  // Modal Bottom Sheet
  void _showModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(16),
        height: 200,
        child: Column(
          children: [
            Text('Modal Bottom Sheet', style: TextStyle(fontSize: 18)),
            Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }

  /// Persistent Bottom Sheet using GlobalKey
  void _showPersistentBottomSheet() {
    if (_sheetController != null) {
      _sheetController!.close();
      _sheetController = null;
      return;
    }

    _sheetController = _scaffoldKey.currentState!.showBottomSheet(
      (context) => Container(
        height: 200,
        color: Colors.amber[200],
        child: Center(
          child: Text(
            'Persistent Bottom Sheet',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 10,
    );

    _sheetController!.closed.then((_) {
      _sheetController = null;
    });
  }
}
