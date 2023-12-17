import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class FileUploader extends StatefulWidget {
  final Function(File)? onUpload;

  const FileUploader({Key? key, this.onUpload}) : super(key: key);

  @override
  _FileUploaderState createState() => _FileUploaderState();
}

class _FileUploaderState extends State<FileUploader> {
  File? _selectedFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image, // Filter only image files
    );

    if (result != null) {
      setState(() {
        _selectedFile = File(result.files.single.path!);
      });

      if (widget.onUpload != null) {
        widget.onUpload!(_selectedFile!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickFile,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 150,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 350,
                    height: 150,
                    decoration: ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(1.00, 0.00),
                        end: Alignment(-1, 0),
                        colors: [Color(0xFFA18CD1), Color(0xFFFBC2EB)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 306,
                  top: 106,
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Icon(
                      Icons.image_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          if (_selectedFile != null)
            Image.file(
              _selectedFile!,
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }
}
