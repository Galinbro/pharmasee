final Map<String, List<Map<String, String>>> _routes = <String, List<Map<String, String>>>{
    'rutas-before' : [
        {
            'ruta' : 'home',
            'icon' : 'home',
            'texto': 'Home'
        },
        {
            'ruta' : 'my-appointment',
            'icon' : 'list',
            'texto': 'Appointments'
        },
        {
            'ruta' : '',
            'icon' : 'notification',
            'texto': 'Notificaciones'
        },
        {
            'ruta' : '',
            'icon' : 'mentorias',
            'texto': 'Mas Mentorias'
        },
        {
            'ruta' : 'favoritos',
            'icon' : 'favorito',
            'texto': 'Favoritos'
        },
        {
            'ruta' : 'pagos',
            'icon' : 'pagos',
            'texto': 'Pagos'
        }
    ],
    'rutas-after': [
        {
            'ruta' : 'settings',
            'texto': 'Configuracion'
        },
        {
            'ruta' : '',
            'texto': 'Centro de ayuda'
        },
    ]
};

List<Map<String, String>> getRoutes() {
  return _routes['rutas-before'];
}
List<Map<String, String>> getRoutesAfter() {
  return _routes['rutas-after'];
}