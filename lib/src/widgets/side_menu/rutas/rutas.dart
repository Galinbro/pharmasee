final Map<String, List<Map<String, String>>> _routes =
    <String, List<Map<String, String>>>{
  'rutas-before': [
    {'ruta': 'home', 'icon': 'home', 'texto': 'Home'},
    {'ruta': 'prescriptions', 'icon': 'list', 'texto': 'Prescriptions'},
    {'ruta': 'my-calendar', 'icon': 'calendar', 'texto': 'Calendar'},
    {'ruta': 'tracker', 'icon': 'notification', 'texto': 'Tracker'},
    // {'ruta': 'prescriptions-list', 'icon': 'pagos', 'texto': 'Prescriptions'},
  ],
  'rutas-after': [
    {'ruta': 'settings', 'texto': 'Settings'},
    {'ruta': '', 'texto': 'Help center'},
  ]
};

List<Map<String, String>> getRoutes() {
  return _routes['rutas-before'];
}

List<Map<String, String>> getRoutesAfter() {
  return _routes['rutas-after'];
}
