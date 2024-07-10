import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headlineMedium: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          centerTitle: true,
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Startseite', icon: Icon(Icons.home)),
              Tab(text: 'Über mich', icon: Icon(Icons.person)),
              Tab(text: 'Lebenslauf', icon: Icon(Icons.description)),
              Tab(text: 'Fähigkeiten', icon: Icon(Icons.lightbulb)),
              Tab(text: 'Hobbys', icon: Icon(Icons.favorite)),
              Tab(text: 'Kontakt', icon: Icon(Icons.contact_mail)),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          AboutPage(),
          ResumePage(),
          SkillsPage(),
          HobbiesPage(),
          ContactPage(),
        ],
      ),
    );
  }
}

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  BackgroundContainer({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/img_1.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Willkommen zu meiner Portfolio-App!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Über mich',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey[300],
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text(
                      'Ich bin Robin, 25 Jahre alt und Student. '
                          'Motivation allein reicht nicht, denn '
                          'Disziplin ist der Schlüssel zum Erfolg.',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResumePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Lebenslauf',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Icon(Icons.school),
                title: Text('Laufendes Studium'),
                subtitle: Text('Wirtschaftsinformatik'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.work),
                title: Text('Aus- und Weiterbildung'),
                subtitle: Text('Jahrespraktikum beim Jobcenter'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.work),
                title: Text('Praktika'),
                subtitle: Text('Diverse Praktika außerhalb der Wirtschaftsinformatik'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Fähigkeiten',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: <Widget>[
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('Java')),
                Chip(label: Text('Git')),
                Chip(label: Text('PowerPoint')),
                Chip(label: Text('Excel')),
                Chip(label: Text('Word')),
                Chip(label: Text('Englisch')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HobbiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Hobbys',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            Card(
              child: ListTile(
                leading: Icon(Icons.pool),
                title: Text('Schwimmen'),
                subtitle: Text('Regelmäßig'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('Fitnessstudio'),
                subtitle: Text('Regelmäßig'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.spa),
                title: Text('Sauna'),
                subtitle: Text('Regelmäßig'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Kontakt',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie Ihren Namen ein';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(labelText: 'E-Mail'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie Ihre E-Mail-Adresse ein';
                          } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Bitte geben Sie eine gültige E-Mail-Adresse ein';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _messageController,
                        decoration: InputDecoration(labelText: 'Nachricht'),
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bitte geben Sie eine Nachricht ein';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState?.validate() == true) {
                            // Hier kann man die Logik zum Senden der Nachricht hinzufügen
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Nachricht gesendet')),
                            );
                          }
                        },
                        child: Text('Senden'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
