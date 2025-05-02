// // import 'package:flutter/material.dart';


// // class DesktopLayout extends StatefulWidget {
// //   const DesktopLayout({super.key});

// //   @override
// //   State<DesktopLayout> createState() => _DesktopLayoutState();
// // }

// // class _DesktopLayoutState extends State<DesktopLayout>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;
// //   @override
// //   void initState() {
// //     _tabController = TabController(length: 4, vsync: this);
// //     super.initState();
// //   }

// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     Size size = MediaQuery.of(context).size;

// //     return Scaffold(
// //       appBar: const NavBar(),
// //       body: Container(
// //         height: double.infinity,
// //         width: double.infinity,
// //         decoration: Styles.gradientDecoration,
// //         child: SingleChildScrollView(
// //           child: Column(
// //             children: [
// //               Container(
// //                 margin: EdgeInsets.symmetric(vertical: size.height * 0.18),
// //                 child: Row(
// //                   mainAxisSize: MainAxisSize.min,
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Column(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         HeaderTextWidget(
// //                           size: size,
// //                         ),
// //                         const SizedBox(
// //                           height: 35,
// //                         ),
// //                         Social_large(size: size),
// //                       ],
// //                     ),
// //                     const Expanded(
// //                         child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [RotatingImageContainer()],
// //                     ))
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: size.height * 0.1,
// //               ),
// //               Container(
// //                 color: AppColors.ebony,
// //                 padding: EdgeInsets.symmetric(vertical: size.width * 0.05),
// //                 child: Column(
// //                   children: [
// //                     GradientText(
// //                       "My Quality Services",
// //                       colors: const [
// //                         AppColors.studio,
// //                         AppColors.paleSlate,
// //                       ],
// //                       style: TextStyle(
// //                           fontSize: size.width * 0.030,
// //                           fontFamily: 'Poppins',
// //                           fontWeight: FontWeight.bold),
// //                     ),
// //                     SizedBox(
// //                       height: size.height * 0.02,
// //                     ),
// //                     MyServicesWidget(size: size),
// //                   ],
// //                 ),
// //               ),
// //               Container(
// //                 width: size.width,
// //                 padding: EdgeInsets.symmetric(vertical: size.width * 0.01),
// //                 child: Column(
// //                   children: [
// //                     GradientTextWidget(
// //                       size: size,
// //                       text1: "My recent Work",
// //                     ),
// //                     // SizedBox(
// //                     //   height: size.height * 0.01,
// //                     // ),
// //                     CustomTabBar(tabController: _tabController)
// //                   ],
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: size.height,
// //                 child: CustomTabBarView(tabController: _tabController),
// //               ),
// //               SizedBox(
// //                 height: size.height * 0.10,
// //               ),
// //               Container(
// //                   height: MediaQuery.of(context).size.height * .75,
// //                   color: AppColors.ebony,
// //                   child: const ExperienceEducationScreen()),
// //               SizedBox(
// //                 height: size.width * 0.05,
// //               ),
// //               Container(
// //                 color: AppColors.revolver,
// //                 width: size.width,
// //                 height: size.height * .8,
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(8),
// //                   child: Column(
// //                     children: [
// //                       GradientTextWidget(
// //                         size: size,
// //                         text1: "My Skills",
// //                         fsize: 12,
// //                         fw: FontWeight.w300,
// //                       ),
// //                       const Skills(),
// //                       SizedBox(
// //                         height: size.height * 0.1,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               const Footer(),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }import 'dart:convert';
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:porfolio/constants/colors.dart';
// import 'package:porfolio/constants/styles.dart';
// import 'package:porfolio/screens/widgets/nav_bar.dart';
// import 'package:porfolio/screens/widgets/text_widet.dart';
// import 'package:http/http.dart' as http;

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//   runApp(const MaterialApp(home: ContactForm()));
// }

// class ContactForm extends StatefulWidget {


//   const ContactForm({super.key});

//   @override
//   State<ContactForm> createState() => _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   bool isLoading = false;
//   String statusMessage = "";

//   final TextEditingController subjectController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController messageController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     bool isSmallScreen = size.width < 900; // Check screen width

//     return Scaffold(
//       appBar: const NavBar(),
//       body: Container(
//         // height: double.infinity,
//         // width: double.infinity,
//         decoration: Styles.gradientDecoration,
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: size.width * 0.05,
//             vertical: size.height * 0.05,
//           ),
//           child: Card(
//             child: Container(
//               color: Colors.white,
//               child: Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: isSmallScreen
//                       ? SingleChildScrollView(
//                           child: ConstrainedBox(
//                             constraints: BoxConstraints(
//                               maxHeight: size.height * 0.9,
//                             ),
//                             child: Column(
//                               // Use Column when screen < 900
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: buildContent(size, isSmallScreen),
//                             ),
//                           ),
//                         )
//                       : Row(
//                           // Use Row when screen >= 900
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: buildContent(size, isSmallScreen),
//                         ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // Extracted widget function to avoid repetition
//   List<Widget> buildContent(Size size, bool isSmallScreen) {
//     return [
//       Flexible(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/images/form.png',
//               height: isSmallScreen ? size.height * .4 : null,
//             ),

//             // SizedBox(height: size.height * 0.02),
//             // Row(
//             //   mainAxisAlignment: MainAxisAlignment.center,
//             //   children: [
//             //     MyIconButton(
//             //       icon: FontAwesomeIcons.linkedin,
//             //       onPressed: () {
//             //         // widget._launchLinkedIn();
//             //       },
//             //     ),
//             //     MyIconButton(
//             //       icon: FontAwesomeIcons.github,
//             //       onPressed: () {
//             //         widget._launchGitHub();
//             //       },
//             //     ),
//             //   ],
//             // ),
//           ],
//         ),
//       ),
//       if (!isSmallScreen)
//         const SizedBox(width: 50), // Add spacing in Row layout
//       Expanded(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ContactFormWidget(
//               onSendPressed: () async {
//                 setState(() {
//                   isLoading = true;
//                   statusMessage = "";
//                 });

//                 String name = subjectController.text;
//                 String email = emailController.text;
//                 String message = messageController.text;
//                 String subject = "Contact Form Message";

//                 bool success = await SendEmail(
//                   name: name,
//                   email: email,
//                   subject: subject,
//                   message: message,
//                 );
//                 SizedBox(height: 5);

//                 setState(() {
//                   isLoading = false;
//                   if (success) {
//                     statusMessage = "Email sent successfully!";
//                   } else {
//                     statusMessage = "Failed to send email.";
//                   }
//                 });
//               },
//               subjectController: subjectController,
//               emailController: emailController,
//               messageController: messageController,
//             ),
//             if (isLoading) const CircularProgressIndicator(),
//             if (statusMessage.isNotEmpty)
//               Text(statusMessage,
//                   style: const TextStyle(color: AppColors.studio)),
//           ],
//         ),
//       ),
//     ];
//   }
// }

// class ContactFormWidget extends StatelessWidget {
//   final Future<void> Function() onSendPressed;
//   final TextEditingController subjectController;
//   final TextEditingController emailController;
//   final TextEditingController messageController;

//   const ContactFormWidget({
//     super.key,
//     required this.onSendPressed,
//     required this.subjectController,
//     required this.emailController,
//     required this.messageController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final formKey = GlobalKey<FormState>();
//     String? validationForm(String validation, String? value) {
//       if (value == null || value.isEmpty) {
//         return validation;
//       }
//       return null; // Return null if validation passes
//     }

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: size.height * 0.05),
//       child: Form(
//         key: formKey,
//         child: Column(
//           children: [
//             TextWidget(
//               sSize: size,
//               color: AppColors.ebony,
//               text: "Get in Touch",
//             ),
//             SizedBox(height: size.height * 0.01),
//             myTextFormFiled(
//                 const Icon(Icons.person), "Subject", subjectController),
//             SizedBox(height: size.height * 0.02),
//             myTextFormFiled(
//                 const Icon(Icons.email_outlined), "Email", emailController),
//             SizedBox(height: size.height * 0.02),
//             TextFormField(
//               controller: messageController,
//               keyboardType: TextInputType.multiline,
//               maxLines: null,
//               decoration: InputDecoration(
//                 hintText: "Message",
//                 border:
//                     OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
//               ),
//               autovalidateMode: AutovalidateMode.onUserInteraction,
//               validator: (value) =>
//                   validationForm("This Field is required", value),
//             ),
//             SizedBox(height: size.height * 0.02),
//             OutlinedButton(
//               style: ButtonStyle(
//                 backgroundColor: WidgetStateProperty.all(AppColors.studio),
//                 foregroundColor: WidgetStateProperty.all(Colors.white),
//                 side: WidgetStateProperty.all(
//                     const BorderSide(color: AppColors.paleSlate)),
//                 fixedSize: WidgetStateProperty.all(const Size(503, 50)),
//               ),
//               onPressed: () async {
//                 if (formKey.currentState!.validate()) {
//                   await onSendPressed();
//                   subjectController.clear();
//                   emailController.clear();
//                   messageController.clear();
//                 }
//               },
//               child: const Text("Send"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget myTextFormFiled(
//       Widget? icon, String hinttext, TextEditingController controller) {
//     return TextFormField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: icon,
//         hintText: hinttext,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//         ),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'This Field is required';
//         }
//         if (hinttext == "Email" &&
//             !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
//                 .hasMatch(value)) {
//           return 'Please enter a valid email';
//         }
//         return null;
//       },
//       autovalidateMode: AutovalidateMode.onUserInteraction,
//     );
//   }
// }

// class MyIconButton extends StatelessWidget {
//   final IconData icon;
//   final Function()? onPressed;
//   const MyIconButton({
//     super.key,
//     required this.icon,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Icon(icon),
//       onPressed: onPressed,
//       color: AppColors.studio,
//       iconSize: 24,
//     );
//   }
// }

// Future<bool> SendEmail({
//   required String name,
//   required String email,
//   required String subject,
//   required String message,
// }) async {
//   const serviceId = "service_6p3mlyg";
//   const templateId = "template_189za5h";
//   const userIdId = "2fY1BwQ1bQLCiTuK9";

//   final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

//   try {
//     final response = await http.post(
//       url,
//       headers: {
//         'origin': 'http://localhost',
//         'Content-type': 'application/json',
//       },
//       body: jsonEncode({
//         "service_id": serviceId,
//         "template_id": templateId,
//         "user_id": userIdId,
//         'template_params': {
//           'user_name': name,
//           'user_email': email,
//           'to_email': 'your-email@example.com',
//           'user_subject': subject,
//           'user_message': message,
//         },
//       }),
//     );

//     return response.statusCode == 200;
//   } catch (e) {
//     print('Error: $e');
//     return false;
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(MyApp());
// }

// class ThemeController extends GetxController {
//   RxBool isDark = false.obs;

//   void toggleTheme() {
//     isDark.value = !isDark.value;
//     Get.changeThemeMode(isDark.value ? ThemeMode.dark : ThemeMode.light);
//   }
// }

// class MyApp extends StatelessWidget {
//   final ThemeController themeController = Get.put(ThemeController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => GetMaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData.light(),
//           darkTheme: ThemeData.dark(),
//           themeMode:
//               themeController.isDark.value ? ThemeMode.dark : ThemeMode.light,
//           home: HomePage(),
//         ));
//   }
// }

// class HomePage extends StatelessWidget {
//   final ThemeController themeController = Get.find();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Get.theme.scaffoldBackgroundColor,
//       body: Center(
//         child: 
//       ),
//     );
//   }
// }
