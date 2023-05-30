import 'package:flutter/material.dart';

class FormsContent extends StatefulWidget {
  @override
  _FormsContentState createState() => _FormsContentState();
}

class _FormsContentState extends State<FormsContent> {
  void click(String h) {
    print(h);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Forms Screen",
            style: TextStyle(fontSize: 48),
          ),
          SizedBox(
            height: 50,
          ),
          Card(
              child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Form Name"),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              child: const Text("Cancel"),
                              onPressed: () =>
                                  Navigator.pop(context, 'cancel')),
                          ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () =>
                                  Navigator.pop(context, 'submit')),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('form_name'),
              subtitle: Text('form_description'),
              trailing: Icon(Icons.arrow_forward),
            ),
          )),
          Card(
              child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Form Name"),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              child: const Text("Cancel"),
                              onPressed: () =>
                                  Navigator.pop(context, 'cancel')),
                          ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () =>
                                  Navigator.pop(context, 'submit')),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('form_name'),
              subtitle: Text('form_description'),
              trailing: Icon(Icons.arrow_forward),
            ),
          )),
          Card(
              child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Form Name"),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              child: const Text("Cancel"),
                              onPressed: () =>
                                  Navigator.pop(context, 'cancel')),
                          ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () =>
                                  Navigator.pop(context, 'submit')),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('form_name'),
              subtitle: Text('form_description'),
              trailing: Icon(Icons.arrow_forward),
            ),
          )),
          Card(
              child: GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    scrollable: true,
                    title: const Text("Form Name"),
                    content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Field Name",
                                icon: Icon(Icons.insert_emoticon),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              child: const Text("Cancel"),
                              onPressed: () =>
                                  Navigator.pop(context, 'cancel')),
                          ElevatedButton(
                              child: const Text("Submit"),
                              onPressed: () =>
                                  Navigator.pop(context, 'submit')),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            child: ListTile(
              leading: Icon(Icons.description),
              title: Text('form_name'),
              subtitle: Text('form_description'),
              trailing: Icon(Icons.arrow_forward),
            ),
          )),
        ],
      ),
    );
  }
}
