import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:master_drift_provider/src/data/local/helper/db_helper.dart';
import 'package:master_drift_provider/src/data/local/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Users List"), centerTitle: true, actions: []),
      body: FutureBuilder<List<UserData>>(
        future: Provider.of<ReportDatabase>(context).getAllUsers(),
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

                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/edit_user',
                        arguments: user.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      color: Colors.grey.shade300,
                      shape: const RoundedRectangleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${user.id}"),
                                Text("First Name : ${user.firstName}"),
                                Text("Last Name : ${user.lastName}"),
                                Text("Updated : ${user.completed}".toString()),
                                Text("Gender :${user.gender}"),
                                Text("Country : ${user.country}"),
                                Text("Age : ${user.age}"),
                              ],
                            ),
                            const Icon(Icons.qr_code_2_outlined)
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            );
          }
          return const Center(child: Text("No Records yet!"));
        }),
      ),
    );
  }
}
