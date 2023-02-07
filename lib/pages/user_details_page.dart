import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theek_karo/models/user.dart';
import 'package:theek_karo/pages/dashboard_page.dart';
import 'package:theek_karo/providers.dart';

class UserDetailsPage extends ConsumerStatefulWidget {
  const UserDetailsPage({super.key});

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends ConsumerState<UserDetailsPage> {
  @override
  String userId = "";
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technician Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: _userDetails(ref),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      userId = arguments["userId"];
      print(userId);
    }
    super.didChangeDependencies();
  }

  Widget _userDetails(WidgetRef ref) {
    final details = ref.watch(userDetailsProvider(user));
    return details.when(
        data: (model) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _userDetailsUI(model!),
            ],
          );
        },
        error: (_, __) => const Center(child: Text("Error")),
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }

  Widget _userDetailsUI(User model) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.fullName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
