import 'package:flutter/material.dart';

class LifecycleStatesScreen extends StatefulWidget {
  const LifecycleStatesScreen({super.key});
  @override
  State<LifecycleStatesScreen> createState() => _LifecycleStatesScreenState();
}

class _LifecycleStatesScreenState extends State<LifecycleStatesScreen> {
  @override
  void initState() {
    super.initState();
    print('🟡 initState() called');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('🟠 didChangeDependencies() called');
  }

  @override
  Widget build(BuildContext context) {
    print('🟣 build() called');
    return
    // Placeholder();
    Scaffold(
      appBar: AppBar(title: Text('Flutter Lifecycle Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              print('⚪ setState() called');
            });
          },
          child: Text('Click to setState'),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(covariant LifecycleStatesScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('🔴 didUpdateWidget() called');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('⚫ deactivate() called');
  }

  @override
  void dispose() {
    super.dispose();
    print('🔚 dispose() called');
  }

  @override
  void reassemble() {
    super.reassemble();
    print('🛠 reassemble() called (Hot Reload)');
  }
}
