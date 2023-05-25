class TreeViewModel {
  String title;
  bool isChecked;
  bool isExpanded;
  List<TreeViewModel> children;

  TreeViewModel(
      {required this.title,
      this.isChecked = false,
      this.isExpanded = false,
      this.children = const []});
}
