import 'package:flutter/material.dart';
import '../../../authors/domain/entities/author.dart';
class AddBook extends StatefulWidget {
  final List<Author> authors;

  const AddBook({
    super.key,
    required this.authors,
  });

  @override
  State<AddBook> createState() => _AddBookDialogState();
}

class _AddBookDialogState extends State<AddBook> {
  final titleController = TextEditingController();
  final yearController = TextEditingController();
  String? selectedAuthorId;

  @override
  void dispose() {
    titleController.dispose();
    yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('إضافة كتاب'),
               SizedBox(height: 16),
              TextField(
                controller: titleController,
                decoration:  InputDecoration(labelText: 'عنوان الكتاب', border: OutlineInputBorder(),),),
               SizedBox(height: 16),
              TextField(controller: yearController,
                keyboardType: TextInputType.number,
                decoration:  InputDecoration(
                  labelText: 'سنة النشر',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'اختاري المؤلف', border: OutlineInputBorder(),
                ),
                items: widget.authors.map((author) {
                  return DropdownMenuItem<String>(value: author.id,
                    child: Text(author.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedAuthorId = value;
                  });
                },
              ),
               SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF5E2A2B),
                  foregroundColor: Colors.white,
                  minimumSize:  Size(double.infinity, 52),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  final title = titleController.text.trim();
                  final year = int.tryParse(yearController.text.trim());
                  final authorId = selectedAuthorId;

                  if (title.isEmpty || year == null||  authorId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('أدخلي العنوان وسنة صحيحة واختاري المؤلف'),),
                    );
                    return;
                  }

                  Navigator.pop(
                    context,
                    (
                    title: title,
                    publishedYear: year,
                    authorId: authorId,
                    ),
                  );
                },
                child:Text('إضافة'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}