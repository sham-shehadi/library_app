import 'package:flutter/material.dart';

class AddAuthor extends StatefulWidget {
  const AddAuthor({super.key});

  @override
  State<AddAuthor> createState() => _AddAuthorDialogState();
}

class _AddAuthorDialogState extends State<AddAuthor> {
  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('إضافة مؤلف', textAlign: TextAlign.center, style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold, color: Color(0xFF5E2A2B),
              ),),
            SizedBox(height: 20),
            TextField(textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              controller: nameController,
              decoration:  InputDecoration(
                labelText: 'اسم المؤلف',
                border: OutlineInputBorder(),
              ),),
             SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF5E2A2B),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 52),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {
                final name = nameController.text.trim();

                if (name.isEmpty) return;

                Navigator.pop(context, name);
              },
              child: Text('إضافة'),),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('إلغاء'),
            ),
          ],
        ),
      ),
    );
  }
}