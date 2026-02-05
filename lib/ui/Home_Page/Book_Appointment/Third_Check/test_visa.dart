// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class TestVisaWebView extends StatefulWidget {
//   const TestVisaWebView({super.key});
//
//   @override
//   State<TestVisaWebView> createState() => _TestVisaWebViewState();
// }
//
// class _TestVisaWebViewState extends State<TestVisaWebView> {
//   late final WebViewController controller;
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageStarted: (_) {
//             setState(() => isLoading = true);
//           },
//           onPageFinished: (_) {
//             setState(() => isLoading = false);
//           },
//           onNavigationRequest: (request) {
//             // يخلي كل الروابط تفتح جوه الـ WebView
//             return NavigationDecision.navigate;
//           },
//         ),
//       )
//       ..loadRequest(
//         Uri.parse(
//           'https://buy.stripe.com/test_8x2eVc6Q8gWocZI95GaEE00',
//         ),
//       );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () async {
//               if (await controller.canGoBack()) {
//                 controller.goBack();
//               }
//             },
//           ),
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               controller.reload();
//             },
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           WebViewWidget(controller: controller),
//           if (isLoading)
//             const Center(child: CircularProgressIndicator()),
//         ],
//       ),
//     );
//   }
// }