import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {
      
    },child: Icon(Icons.add)),
      backgroundColor: Colors.black26,
      
      body: SingleChildScrollView(
        child: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 70,
            ),
            Text('Welcom Akhil',
                style: TextStyle(color: Colors.white, fontSize: 19)),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Card(shape:  RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(45.0)),
                child: Padding(padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(children: [
                            Text('CURRENT BALANCE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),SizedBox(height: 10,),
                            Text('6000',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                            // GridView.count(crossAxisCount: 2,children: [Text('INCOME'),Text('EXPENS')],)
                            // ListTile(leading: Text('INCOME'),trailing: Text( 'EXPENSE'),),
                            // ListTile(leading: Text('₹ 5000'),trailing: Text('₹ 1000'),)
                          ]),
                        ],
                      ),SizedBox(height: 13,),
                      Row(
                        children: [
                          SizedBox(
                            width: 6,
                          ),
                          Text('INCOME',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 132,
                          ),
                          Icon(Icons.arrow_downward, color: Colors.red),
                          Text(
                            'EXPENSE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),SizedBox(height: 9,),
                      Row(
                        children: [
                          SizedBox(
                            width: 4,
                          ),
                          Text('₹ 5000', style: TextStyle(fontSize: 25)),
                          SizedBox(
                            width: 144,
                          ),
                          Text(
                            '₹ 1000',
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight:Radius.circular(15) ),
              color: Color.fromARGB(255, 255, 255, 255),),
           
              height: 440,
              child: Column(
                children: [
                  Text('TRANSACTION',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: () {
                                
                              },child: Text('view all',style: TextStyle(color: Colors.blue),)),
                            ],
                          ),
                  Expanded(
                    child: Card(elevation: 0,
                      child: ListView.builder(shrinkWrap:true ,itemCount: 5, itemBuilder: (context, index) => 
                         ClipRRect(borderRadius: BorderRadius.circular(30),
                           
                           child: Padding(
                             padding: const EdgeInsets.all(18.0),
                             child: ListTile(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),tileColor: Color.fromARGB(255, 241, 241, 241),
                              leading: Icon(
                                Icons.arrow_downward,
                                color: Colors.red,
                              ),
                              subtitle: Text('November 2'),
                              title: Text('EMI'),
                              trailing: Text('₹ 400'),
                                                 ),
                           ),
                         ),
                      ),
                      
                  ),
                    
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Category', icon: Icon(Icons.category)),
        BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings))
      ]),
    );
  }
}
