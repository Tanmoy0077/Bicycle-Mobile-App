import 'package:flutter/material.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  List<Map<String, dynamic>> transactionHistory = [];
  double availableBalance = 100.0; // Initial balance
  bool _isLoading = true; // Flag to track whether data is being loaded

  @override
  void initState() {
    super.initState();
    _fetchTransactionHistory();
  }

  // Simulate fetching transaction history from a backend API
  Future<void> _fetchTransactionHistory() async {
    // Sample data simulating a response from a backend API
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    // Update state with fetched data
    setState(() {
      transactionHistory = [
        {
          'date': '2023-10-01',
          'amount': -50.0, // Deduction
        },
        {
          'date': '2023-09-15',
          'amount': 30.0, // Addition
        },
        {
          'date': '2023-08-20',
          'amount': -20.0, // Deduction
        },
      ];

      // Calculate available balance based on transactions
      availableBalance = 100.0; // Reset initial balance
      for (var transaction in transactionHistory) {
        availableBalance += transaction['amount'];
      }

      _isLoading = false;
      // Set flag to false after data is loaded
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        title: const Text("Card Transaction History"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Available Balance: ₹${availableBalance.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: transactionHistory.length,
                      itemBuilder: (context, index) {
                        final transaction = transactionHistory[index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text("Date: ${transaction['date']}"),
                            trailing: Text(
                              "${transaction['amount'] >= 0 ? '+' : ''}₹${transaction['amount'].abs().toStringAsFixed(2)}",
                              style: TextStyle(
                                color: transaction['amount'] < 0
                                    ? Colors.red
                                    : Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
