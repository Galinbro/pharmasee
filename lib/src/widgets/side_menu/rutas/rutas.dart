final Map<String, List<Map<String, String>>> _routes =
    <String, List<Map<String, String>>>{
  'rutas-before': [
    {'ruta': 'home', 'icon': 'home', 'texto': 'Home'},
    {'ruta': 'prescriptions', 'icon': 'list', 'texto': 'Prescriptions'},
    {'ruta': 'my-calendar', 'icon': 'notification', 'texto': 'Calendar'},
    {'ruta': 'tracker', 'icon': 'mentorias', 'texto': 'Tracker'},
    {'ruta': 'favoritos', 'icon': 'favorito', 'texto': 'Favoritos'},
    {'ruta': 'pagos', 'icon': 'pagos', 'texto': 'Pagos'},
    // {'ruta': 'prescriptions-list', 'icon': 'pagos', 'texto': 'Prescriptions'},
  ],
  'rutas-after': [
    {'ruta': 'settings', 'texto': 'Configuracion'},
    {'ruta': '', 'texto': 'Centro de ayuda'},
  ]
};

List<Map<String, String>> getRoutes() {
  return _routes['rutas-before'];
}

List<Map<String, String>> getRoutesAfter() {
  return _routes['rutas-after'];
}
