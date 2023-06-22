import 'package:chopper/chopper.dart';
import 'package:flutt_ip/api/jsonapi/routes/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../main.dart';

class LoginServerSelectPage extends StatelessWidget {
  const LoginServerSelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Login"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Text("Server Selection", style: TextStyle(fontSize: 20)),
              Text(
                  "Copy your Server URL from the browser or search the list below."),
              URLForm()
            ],
          ),
        ),
      ),
    );
  }
}

class URLForm extends StatefulWidget {
  const URLForm({
    super.key,
  });

  @override
  State<URLForm> createState() => _URLFormState();
}

class _URLFormState extends State<URLForm> {
  Future<http.Response>? valid;
  final formKey = GlobalKey<FormState>();

  Uri? toDiscovery(Uri site) {
    if (site.scheme != "https") return null;
    if (site.path.contains(".php")) {
      return site.replace(
          path: site.path.replaceFirst(
              RegExp(r"/[^/]*\.php.*"), "/jsonapi.php/v1/discovery"));
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 200,
                height: 100,
                child: TextFormField(
                    onSaved: (String? value) {
                      if (valid == null) return;
                      if (value == null) return;
                      Uri? uri = toDiscovery(Uri.parse(value));
                      if (uri == null) return;
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Testing connection...")));
                      setState(() {
                        valid = http.get(uri, headers: apiHeaders).timeout(
                            const Duration(seconds: 10), onTimeout: () {
                          return http.Response("", 408);
                        });
                        valid!.then((value) {
                          if (value.statusCode == 200) {
                            router.go("/loginAuthSelect");
                          } else {
                            valid = null;
                            if (value.statusCode == 408) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Connection timed out, check your network connection",
                                          style: TextStyle(
                                              color: Colors.redAccent))));
                            } else if (value.statusCode == 401 ||
                                value.statusCode == 403) {
                              // TODO API not enabled
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "API disabled, contact your administrator")));
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Unknown error, is the URL correct?")));
                            }
                          }
                        });
                      });
                    },
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "URL"))),
            ElevatedButton(
                onPressed: () {
                  formKey.currentState!.save();
                },
                child: const Text("Next"))
          ],
        ),
      ),
    );
  }
}

class LoginAuthSelectPage extends StatefulWidget {
  const LoginAuthSelectPage({super.key});

  @override
  State<LoginAuthSelectPage> createState() => _LoginAuthSelectPageState();
}

class _LoginAuthSelectPageState extends State<LoginAuthSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Login"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              Text("Login Method", style: TextStyle(fontSize: 20)),
              Text(
                  "Copy your Server URL from the browser or search the list below."),
            ],
          ),
        ),
      ),
    );
  }
}
