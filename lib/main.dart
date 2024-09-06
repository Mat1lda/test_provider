import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyModel>(
      create: (context) => MyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App of Provider')),
          backgroundColor: Colors.grey,
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                color: Colors.green[200],
                child: Consumer<MyModel>(
                  builder:
                      (BuildContext context, MyModel mymodel, Widget? child) {
                    return ElevatedButton(
                      child: Text('Do something'),
                      onPressed: () {
                        mymodel.doSomething();
                      },
                    );
                  },
                ),
                // child: Consumer<MyModel>(
                //   builder: (context, mymodel, child) {
                //     return ElevatedButton(
                //       child: Text('Do something'),
                //       onPressed: () {
                //         mymodel.doSomething();
                //       },
                //     );
                //   },
                // ),
              ),
              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>(
                  builder: (context, mymodel, child) {
                    return Text(mymodel.text);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyModel with ChangeNotifier{
  String text = "Hello";

  void doSomething() {
    if(text == 'World')
      text = "Hello";
    else{
      text = "World";
    }
    notifyListeners();
  }
}
