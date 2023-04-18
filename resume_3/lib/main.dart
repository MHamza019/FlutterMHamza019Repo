import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Widget buildSkillBar(String skill, double level) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            skill,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
                color: Colors.green
            ),
          ),
          SizedBox(height: 8.0),
          LinearProgressIndicator(
            value: level,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.teal,
            alignment: Alignment.center,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 16.0),
                          const Center(
                            child:CircleAvatar(
                              backgroundColor: Colors.lightBlue,
                              radius: 110,
                              child: CircleAvatar(
                                radius: 100,
                                backgroundImage:
                                NetworkImage('https://i.ibb.co/WsXDzwT/Untitled-1.jpg'),

                              ),
                            )
                          ),
                          SizedBox(height: 16.0),
                          Center(
                            child: Text(
                              'Muhammad Hamza',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'PERSONAL INFORMATION',
                            style: TextStyle(
                                color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,

                            ),
                          ),
                          SizedBox(height: 8.0),
                          Divider(),
                          SizedBox(height: 8.0),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),),
                            color: Colors.white,
                            elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text('Email'),
                                subtitle: Text('Hamzacoin78@gmail.com'),
                              leading: Icon(Icons.email),

                            ),
                            ),
                          ),

                          SizedBox(height: 8.0),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),),
                            color: Colors.white,
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text('Phone'),
                              subtitle: Text('+923149731505'),
                              leading: Icon(Icons.phone),
                            ),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),),
                            color: Colors.white,
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text('Address'),
                              subtitle: Text('Burewala, Pakistan'),
                              leading: Icon(Icons.location_on),
                            ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'EDUCATION',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Divider(),
                          SizedBox(height: 8.0),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),),
                            color: Colors.white,
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                            child: ListTile(
                              title: Text(
                                  'Bachelors in Computer Sciences'),
                              subtitle: Text('COMSATS University Islamabad, Vehari Campus'),
                              trailing: Text('Graduated in Jan 2024'),
                            ),
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'WORK EXPERIENCE',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                                color: Colors.white
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Divider(),
                          SizedBox(height: 8.0),
                          Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),),
                              color: Colors.white,
                              elevation: 8,
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                              child: Column(children: <Widget>[
                                ListTile(
                                  title: Text('Software Engineer'),
                                  subtitle: Text('ABC Company'),
                                  trailing: Text('June 2020 - Present'),
                                ),
                              ]),),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'SKILLS',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                               color: Colors.white
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Divider(),
                          SizedBox(height: 8.0),
                          buildSkillBar('Web Development', 0.9),
                          SizedBox(height: 8.0),
                          buildSkillBar('Graphic Designing', 0.8),
                          SizedBox(height: 8.0),
                          buildSkillBar('Android Development', 0.9),
                          SizedBox(height: 8.0),
                          Divider(),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),),
                              elevation: 8,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(Icons.games),
                                Text('Gaming'),
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(Icons.movie),
                                Text('Watching movies'),
                                SizedBox(
                                  width: 50,
                                ),
                                Icon(Icons.book),
                                Text('Reading Books'),
                                SizedBox(
                                  width: 50,
                                ),
                              ],
                            ),
                              ),
                          ),
                        ])))));
  }
}
