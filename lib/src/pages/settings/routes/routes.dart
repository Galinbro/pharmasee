final Map<String, List<Map<String, String>>> _routes = <String, List<Map<String, String>>>{
    'Cuenta' : [
        {
            'ruta' : '',
            'texto': 'Profile'
        },
        {
            'ruta' : '',
            'texto': 'Phone'
        },
        {
            'ruta' : '',
            'texto': 'Password'
        },
    ],
    'General': [
        {
            'ruta' : 'pantalla-sonido',
            'texto': 'Sound and Screen'
        },
        {
            'ruta' : '',
            'texto': 'Data Usage'
        },
    ]
};

Map<String, List<Map<String, String>>> getRoutes() {
  return _routes;
}
