class MenuItem {
  MenuItem({
    required this.icon,
    required this.title,
    this.route='',
    this.hasAlertPopup=false,
  });

  final String icon;
  final String title;
  final String route;
  final bool hasAlertPopup;
}

