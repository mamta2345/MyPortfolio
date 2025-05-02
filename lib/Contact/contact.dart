import 'package:flutter/material.dart';
import 'package:portifolio/Reusable_widget/color.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectcontroller = TextEditingController();

  final TextEditingController messageController = TextEditingController();

  Future<void> sendEmail() async {
    const serviceId = 'service_w5fj7us';
    const templateId = 'template_9t6e76a';
    const userId = 'F2y_ofMWVJFtNzO2h';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': nameController.text,
            'user_email': emailController.text,
            "to_email": "your_email@example.com",
            'user_subject': subjectcontroller.text,
            'user_message': messageController.text,
          }
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Message Sent Successfully!')),
        );
        nameController.clear();
        emailController.clear();
        subjectcontroller.clear();
        messageController.clear();
      } else {
        print('Failed to send email: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message')),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customcolor.bluLight1, // Full page color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "GET IN TOUCH",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 500) {
                    return Column(
                      children: [
                        inputField(
                            "Your Name", nameController, 15, FontWeight.bold,
                            maxline: 1),
                        SizedBox(height: 10),
                        inputField(
                            "Email ID", emailController, 15, FontWeight.bold,
                            maxline: 1),
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        Expanded(
                          child: inputField(
                              "Your Name", nameController, 15, FontWeight.bold,
                              maxline: 1),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: inputField(
                              "Email ID", emailController, 15, FontWeight.bold,
                              maxline: 1),
                        ),
                        // SizedBox(width: 10),
                        // Expanded(
                        //   child: inputField("Subject ", subjectcontroller, 15,
                        //       FontWeight.bold,
                        //       maxline: 1),
                        // ),
                      ],
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 10),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: inputField(
                  "Subject", subjectcontroller, 15, FontWeight.bold,
                  maxline: 1),
            ),
            SizedBox(height: 10),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: inputField(
                  "Your Message", messageController, 15, FontWeight.bold,
                  maxline: 5),
            ),
            SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width < 750 ? 460 : 750,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: sendEmail,
                  child: Text(
                    "Get in Touch",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 300),
              child: Divider(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputField(String text, TextEditingController controller, double size,
      FontWeight fontWeight,
      {required int maxline}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        maxLines: maxline,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.all(12),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: size,
            fontWeight: fontWeight,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
