import 'package:flutter/material.dart';

void main() {
  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatefulWidget {
  const ExpenseTrackerApp({super.key});

  @override
  ExpenseTrackerAppState createState() => ExpenseTrackerAppState();
}

class ExpenseTrackerAppState extends State<ExpenseTrackerApp> {
  final _items = <ExpenseItem>[];
  final _itemNameController = TextEditingController();
  final _itemAmountController = TextEditingController();

  void _addItem() {
    final itemName = _itemNameController.text;
    final itemAmount = double.tryParse(_itemAmountController.text) ?? 0.0;
    if (itemName.isNotEmpty && itemAmount > 0.0) {
      setState(() {
        _items.add(ExpenseItem(name: itemName, amount: itemAmount));
        _itemNameController.clear();
        _itemAmountController.clear();
      });
    }
  }

  void _clearAll() {
    setState(() {
      _items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Expense Tracker',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          backgroundColor: Colors.orange.shade300,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Item Name:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: 'Arial',
                ),
              ),
              TextField(
                controller: _itemNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter item name',
                ),
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Item Amount:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  fontFamily: 'Arial',
                ),
              ),
              TextField(
                controller: _itemAmountController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Enter item amount',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: _addItem,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Add Item',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: _clearAll,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[300],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Clear All',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${item.name}: ₨ ${item.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Center(
                child: Text(
                  'Total: ₨ ${_items.fold<double>(0.0, (sum, item) => sum + item.amount).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Expense Tracker',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 24.0,
//             ),
//           ),
//           backgroundColor: Colors.deepOrange,
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 'Item Name:',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                 ),
//               ),
//               TextField(
//                 controller: _itemNameController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   hintText: 'Enter item name',
//                 ),
//               ),
//               const SizedBox(height: 16.0),
//               const Text(
//                 'Item Amount:',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18.0,
//                 ),
//               ),
//               TextField(
//                 controller: _itemAmountController,
//                 decoration: InputDecoration(
//                   filled: true,
//                   fillColor: Colors.grey[200],
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   hintText: 'Enter item amount',
//                 ),
//                 keyboardType: TextInputType.number,
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _addItem,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepOrange,
//                       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     child: const Text('Add Item'),
//                   ),
//                   ElevatedButton(
//                     onPressed: _clearAll,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.deepOrange,
//                       padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                     ),
//                     child: const Text('Clear All'),
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _items.length,
//                   itemBuilder: (context, index) {
//                     final item = _items[index];
//                     return ListTile(
//                       title: Text('${item.name}: ₨ ${item.amount.toStringAsFixed(2)}'),
//                     );
//                   },
//                 ),
//               ),
//               Text(
//                 'Total: ₨ ${_items.fold<double>(0.0, (sum, item) => sum + item.amount).toStringAsFixed(2)}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20.0,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ExpenseItem {
  final String name;
  final double amount;

  ExpenseItem({required this.name, required this.amount});
}
