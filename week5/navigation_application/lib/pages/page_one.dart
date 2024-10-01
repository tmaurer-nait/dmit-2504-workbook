import 'package:flutter/material.dart';
import 'package:navigation_application/pages/page_two.dart';

// class PageOne extends StatelessWidget {
//   const PageOne({super.key});

//   // This is not using named routes
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(),
//   //     body: Column(
//   //       children: [
//   //         const Text('Page One'),
//   //         ElevatedButton(
//   //             onPressed: () {
//   //               Navigator.of(context)
//   //                   .push(MaterialPageRoute(builder: (context) {
//   //                 return const PageTwo();
//   //               }));
//   //             },
//   //             child: const Text("Go to Page Two"))
//   //       ],
//   //     ),
//   //   );
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           const Text('Page One'),
//           ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pushNamed('/page-two');
//               },
//               child: const Text("Go to Page Two"))
//         ],
//       ),
//     );
//   }
// }

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  late String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text('Page One'),
          ElevatedButton(
              onPressed: () async {
                String returnValue = await Navigator.of(context)
                    .pushNamed('/page-two') as String;

                setState(() {
                  data = returnValue;
                });
              },
              child: const Text("Go to Page Two")),
          data != '' ? Text('Recieved "$data"') : const Text('Awaiting Data')
        ],
      ),
    );
  }
}
