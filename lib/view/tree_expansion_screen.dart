import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/controller/functions.dart';
import 'package:test/theme/colors.dart';
import 'package:test/view/tree_view_model.dart';

class TreeExpansionScreen extends StatefulWidget {
  const TreeExpansionScreen({super.key});

  @override
  State<TreeExpansionScreen> createState() => _TreeExpansionScreenState();
}

class _TreeExpansionScreenState extends State<TreeExpansionScreen> {
  List<TreeViewModel> treeData = [];

  @override
  void initState() {
    super.initState();
    _loadLocalJson().then((jsonData) {
      List<dynamic> parsedJson = jsonDecode(jsonData);
      setState(() {
        treeData = createTreeData(parsedJson);
      });
    });
  }

  Future<String> _loadLocalJson() async {
    return await rootBundle.loadString('assets/response.json');
  }

  void toggleItem(TreeViewModel item) {
    setState(() {
      item.isChecked = !item.isChecked;

      if (item.isChecked) {
        if (item.children.isNotEmpty) {
          for (var child in item.children) {
            child.isChecked = true;
          }
        }
      } else {
        if (item.children.isNotEmpty) {
          for (var child in item.children) {
            child.isChecked = false;
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text('Tree Expansion Example')),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: AppColors.green,
                  width: double.infinity,
                  height: 250,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: ListView(
                children: treeData.map((item) {
                  return ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: const EdgeInsets.all(0),
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        item.isExpanded = !isExpanded;
                        // item.isChecked = !item.isChecked;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return CheckboxListTile(
                            activeColor: AppColors.purple,
                            title: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColors.green,
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    item.title[0],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                Text(
                                  "  ${item.title}",
                                  style: const TextStyle(fontSize: 13),
                                )
                              ],
                            ),
                            value: item.isChecked,
                            onChanged: (bool? value) {
                              toggleItem(item);
                            },
                          );
                        },
                        body: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            children: item.children.map((child) {
                              return CheckboxListTile(
                                activeColor: AppColors.purple,
                                title: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: AppColors.green,
                                      foregroundColor: Colors.white,
                                      child: Text(
                                        child.title[0],
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    Text(
                                      "  ${child.title}",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                value: child.isChecked,
                                onChanged: (bool? value) {
                                  toggleItem(child);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        isExpanded: item.isExpanded,
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
