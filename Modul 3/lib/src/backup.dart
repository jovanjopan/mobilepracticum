// import 'package:flutter/material.dart';

// void main(){
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp ({super.key});


// @override
// Widget build(BuildContext context) {
//   return MaterialApp(
//     title: 'Alligment',
//     home: Scaffold(
//       appBar: AppBar(
//         title: const Text("Alligment"),
        
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
//           children: [
//             Text("Malang", style: TextStyle(fontSize: 50),) ,
//             SizedBox(height: 50),
//             Text("50\u00B0C", style: TextStyle(fontSize: 100),) ,
//             SizedBox(height: 40),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

//                   children: [
                    
//                   cuacaHarian
//                   (day: 'Minggu', 
//                   icon: Icons.sunny, 
//                   temperature: '20\u00B0C'),

//                   cuacaHarian(day: 'Senin', 
//                   icon: Icons.cloudy_snowing, 
//                   temperature: '23\u00B0C'),

//                   cuacaHarian(day:'Selasa', 
//                   icon: Icons.cloud, 
//                   temperature: '22\u00B0C'),

//                   ],

                
                
              
//             )
            
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }

// class KotakBiruJempol extends StatelessWidget {
//   const KotakBiruJempol({super.key});
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       width: 100,
//       height: 100,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         border: Border.all(color: Colors.black, width: 2),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Icon(
//         Icons.thumb_up,
//         color: Colors.white,
//         size: 40,
//       ),
    
//     );
//   }
// }

// class KotakBiruJempolKecil extends StatelessWidget {
//   const KotakBiruJempolKecil({super.key});
//   @override
//   Widget build(BuildContext context){
//     return Container(
//       width: 75,
//       height: 75,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         border: Border.all(color: Colors.black, width: 2),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Icon(
//         Icons.thumb_up,
//         color: Colors.white,
//         size: 40,
//       ),
    
//     );
//   }
// }

// class cuacaHarian extends StatelessWidget {
//   final String day;
//   final IconData icon;
//   final String temperature;

//   const cuacaHarian
// ({
//     super.key,
//     required this.day,
//     required this.icon,
//     required this.temperature,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           day,
//           style: const TextStyle(fontSize: 16, color: Colors.black54),
//         ),
//         const SizedBox(height: 8),
//         Icon(
//           icon,
//           color: Colors.black87,
//           size: 32,
//         ),
//         const SizedBox(height: 8),
//         Text(
//           temperature,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
// }