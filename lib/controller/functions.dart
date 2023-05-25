import 'package:test/model/tree_model.dart';
import 'package:test/view/tree_view_model.dart';

List<TreeViewModel> createTreeData(jsonData) {
  // Map<String, TreeItem> treeMap = {};
  List<TreeViewModel> treeData = [];
  // Iterate through the JSON data and construct the tree
  for (var i in jsonData) {
    TreeModel treeModel = TreeModel.fromJson(i);
    List<String> categories = treeModel.category!.split('/');

    treeData.add(
      TreeViewModel(
          title: treeModel.name!.trim(),
          children: categories
              .map(
                (e) => TreeViewModel(title: e),
              )
              .toList()),
    );
    // Traverse the categories and create/update tree nodes

    // String currentPath = '';
    // for (var i = 0; i < categories.length; i++) {
    //   currentPath += categories[i];
    //   if (!treeMap.containsKey(currentPath)) {
    //     treeMap[currentPath] = TreeItem(title: categories[i]);
    //   }

    //   // If it's the last category, add the item as a child
    //   if (i == categories.length - 1) {
    //     TreeItem treeNode = TreeItem(title: treeItem.name!);
    //     treeMap[currentPath]!.children.add(treeNode);
    //   }

    //   currentPath += '/';
    // }
  }

  // Convert the map to a list of root tree nodes
  // List<TreeItem> treeData = treeMap.values.where((node) {
  //   return !node.title.contains('/');
  // }).toList();

  return treeData;
}
