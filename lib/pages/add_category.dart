import 'package:flutter/material.dart';


class AddTransation extends StatefulWidget {
  const AddTransation({super.key});

  @override
  State<AddTransation> createState() => _AddTransationState();
}

class _AddTransationState extends State<AddTransation> {
  dynamic hi = 'p';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(78.0), // here the desired height
        child: AppBar(
            backgroundColor: Color.fromARGB(213, 20, 27, 38),
            title: Text(
              'Add Transation',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 29,
                  ),
                  Text('INCOME'),
                  Expanded(
                    child: RadioListTile(
                        value: 'p',
                        groupValue: hi,
                        onChanged: ((value) {
                          setState(() {
                            hi = value;
                          });
                        })),
                  ),
                  Text('EXPENSE'),
                  Expanded(
                    child: RadioListTile(
                        value: 'd',
                        groupValue: hi,
                        onChanged: ((value) {
                          setState(() {
                            hi = value;
                          });
                        })),
                  )
                ],
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
