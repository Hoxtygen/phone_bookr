class MenuItem {
  String title;
  String value;
  MenuItem({this.title, this.value});

  static List<MenuItem> menuitems = [
    MenuItem(title: "Add to favorites", value:"favourite"),
    MenuItem(title: "Share Contact", value:"share"),
    MenuItem(title: "Delete", value: "delete"),
    MenuItem(title: "Edit", value: "edit"),
    MenuItem(title: "Copy", value: "copy"),
  ];
}
