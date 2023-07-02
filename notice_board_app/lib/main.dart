import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notice Board App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            ElevatedButton(onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  final User user1 = (await _auth.signInWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ))
                      .user!;
                  if (user1 != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(user1)));
                  }
                } catch (e) {
                  print(e);
                }
              }
            },

              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final User user1;

  HomePage(this.user1);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final TextEditingController _noticeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
        _db.collection('notices').orderBy('timestamp', descending: true).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder:
                (BuildContext context, int index) {
              DocumentSnapshot notice = snapshot.data!.docs[index];
              return ListTile(
                title:
                Text(notice['content']),
                subtitle:
                Text(notice['timestamp'].toDate().toString()),
                trailing:
                widget.user1.email == notice['email']
                    ? IconButton(
                  icon:
                  Icon(Icons.delete),
                  onPressed:
                      () async {
                    await notice.reference.delete();
                  },
                )
                    : null,
              );
            },
          );
        },
      ),
      floatingActionButton:
      widget.user1.email == 'admin@example.com'
          ? FloatingActionButton(
        onPressed:
            () async {
          await showDialog(
            context:
            context,
            builder:
                (BuildContext context) {
              return AlertDialog(
                content:
                TextField(
                  controller:
                  _noticeController,
                  decoration:
                  InputDecoration(labelText: 'Notice'),
                ),
                actions:
                <Widget>[
                  TextButton(onPressed: () async {
                    await _db.collection('notices').add({
                      'content': _noticeController.text,
                      'timestamp': DateTime.now(),
                      'email': widget.user1.email,
                    });
                    Navigator.pop(context);
                  },

                    child:
                    Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child:
        Icon(Icons.add),
      )
          : null,
    );
  }
}
