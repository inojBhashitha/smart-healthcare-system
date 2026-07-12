import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/prescription_provider.dart';
import '../../../widgets/prescription/history_card.dart';
import '../details/prescription_details_screen.dart';

class PrescriptionHistoryScreen extends StatefulWidget {
  const PrescriptionHistoryScreen({super.key});

  @override
  State<PrescriptionHistoryScreen> createState() =>
      _PrescriptionHistoryScreenState();
}

class _PrescriptionHistoryScreenState
    extends State<PrescriptionHistoryScreen> {

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  Future<void> _loadHistory() async {

    final provider =
        Provider.of<PrescriptionProvider>(
      context,
      listen: false,
    );

    await provider.loadPrescriptions();

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider =
        context.watch<PrescriptionProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Prescription History",
        ),
      ),
      body: _isLoading
          ? const Center(
              child:
                  CircularProgressIndicator(),
            )
          : provider.prescriptions.isEmpty
              ? const Center(
                  child: Text(
                    "No prescriptions found.",
                  ),
                )
              : RefreshIndicator(
                  onRefresh:
                      provider.loadPrescriptions,
                  child: ListView.builder(
                    padding:
                        const EdgeInsets.all(20),
                    itemCount:
                        provider.prescriptions.length,
                    itemBuilder:
                        (context, index) {

                      final prescription =
                          provider
                              .prescriptions[index];

                      return HistoryCard(

                        prescription:
                            prescription,

                        onTap: () async {

                          await provider
                              .loadPrescription(
                            prescription
                                .prescriptionId,
                          );

                          if (!context.mounted) {
                            return;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const PrescriptionDetailsScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
    );
  }
}