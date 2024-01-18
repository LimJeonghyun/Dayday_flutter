import 'package:dayday_flutter/src/widget/image_button.dart';
import 'package:flutter/material.dart';

class FeedCreate extends StatefulWidget {
  const FeedCreate({super.key});

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String title = _titleController.text;
      final String price = _priceController.text;
      final String content = _contentController.text;
      // 회원가입 로직 추가
      // 회원가입 성공 시, 다음 화면으로 이동 혹은 처리
    }
  }

  var inputDecoration = InputDecoration(border: OutlineInputBorder());
  TextStyle labelTextStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('내 물건 팔기')),
      body: Form(
        child: ListView(
          children: [
            Row(
              children: [ImageButton()],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('제목', style: labelTextStyle),
                TextFormField(
                    controller: _titleController, decoration: inputDecoration),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('가격', style: labelTextStyle),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: inputDecoration,
                  controller: _priceController,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('내용', style: labelTextStyle),
                TextFormField(
                  maxLines: 5,
                  decoration: inputDecoration,
                  controller: _contentController,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF7E36),
              ),
              child: const Text(
                '작성 완료',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
