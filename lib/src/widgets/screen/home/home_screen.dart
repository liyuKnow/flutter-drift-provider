import "package:flutter/material.dart";
import 'package:master_drift_provider/src/data/local/helper/db_helper.dart';
import 'package:master_drift_provider/src/data/local/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ReportDatabase _db;

  @override
  void initState() {
    super.initState();

    _db = ReportDatabase();
  }

  @override
  void dispose() {
    _db.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Users List"), centerTitle: true, actions: []),
      body: FutureBuilder<List<UserData>>(
        future: _db.getAllUsers(),
        builder: ((context, snapshot) {
          final List<UserData>? users = snapshot.data;

          // Loading
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          // ERROR
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (users != null) {
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: ((context, index) {
                final user = users[index];

                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.grey.shade300,
                    shape: const RoundedRectangleBorder(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${user.id}"),
                          Text(user.firstName),
                          Text(user.lastName),
                          Text(user.gender),
                          Text(user.country),
                          Text("${user.age}"),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }
          return const Center(child: Text("No Users yet!"));
        }),
      ),
    );
  }
}
