import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Jangan lupa import GetX
import '../viewmodel/tasbih_controller.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // Inisialisasi controller menggunakan Get.put()
  final TasbihController tasbihController = Get.put(TasbihController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 210, 145),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Ganti Text statis dengan Obx agar nilainya berubah
              Obx(
                () => Text(
                  '${tasbihController.counter.value.round()}',
                  style: const TextStyle(fontSize: 250),
                ),
              ),

              // 2. Ganti Padding statis dengan Obx dan tambahkan 'value'
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: LinearProgressIndicator(
                    value:
                        tasbihController.progress.value /
                        100, // Hubungkan value
                    backgroundColor: Colors.white54,
                    color: Colors.amberAccent.shade400,
                    minHeight: 15,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              const SizedBox(height: 75),

              // 3. Hubungkan onTap pada tombol utama
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                child: InkWell(
                  onTap: tasbihController
                      .incrementCounter, // Panggil fungsi increment
                  child: Container(
                    padding: const EdgeInsets.all(
                      30,
                    ), // Padding disarankan di sini
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Icon(Icons.fingerprint, size: 100),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // 4. Hubungkan onPressed pada FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: tasbihController.resetCounter, // Panggil fungsi reset
        backgroundColor: Colors.white,
        child: const Icon(Icons.refresh_outlined, color: Colors.black),
      ),
    );
  }
}
