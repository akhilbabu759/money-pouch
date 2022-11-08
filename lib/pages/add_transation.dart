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
              Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 241, 241, 241),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 241, 241),
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(20.0)),
                        hintText: 'Amount',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 241, 241, 241)),
                            borderRadius: BorderRadius.circular(20.0)),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 241, 241, 241)),
                          borderRadius: BorderRadius.circular(25.7),
                        )),
                  )),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  tileColor: const Color.fromARGB(255, 241, 241, 241),
                  title: const Text('Catogory',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_drop_down),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  tileColor: const Color.fromARGB(255, 241, 241, 241),
                  title: const Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.date_range),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    tileColor: const Color.fromARGB(255, 241, 241, 241),
                    title: Center(
                        child: const Text(
                      'Save',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    // onTap: () =>
                    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text("SAVED"),
                    //     ))),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
