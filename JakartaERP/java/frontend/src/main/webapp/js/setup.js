function makeRandomTile(id) {
    return {
        'name':      'widget_000' + id,
        'thumbnail': '',
        'content':   '',
        'url':       'tiles/ajax_content.html',
        'size':      '2x2',
        'theme':     'red'
    };
}

var tiles1 = [
{
    'name'        : 'Conceptos',
    'thumbnail'   : 'pantallas/img/melonhtml5.png',
    'content'     : 'Concepto Presupuesto',
    'size'        : '4x2',
    'theme'       : 'white',
    'link'         : 'pantallas/index/index-conceptos.zul',
},
{
    'name'        : 'Determinaciones Electricas',
    'thumbnail'   : 'pantallas/img/melonhtml5.png',
    'content'     : 'Determinaciones Electricas',
    'link'         : 'pantallas/index/index-determinacion.zul?l=LaboratorioElectrico',
    'size'        : '4x2',
    'theme'       : 'white'
},
{
	'name'        : 'Determinaciones Quimicas',
	'thumbnail'   : 'pantallas/img/widget_scroll.png',
	'content'     : 'Determinaciones Quimicas',
	'link'         : 'pantallas/index/index-determinacion.zul?l=LaboratorioQuimico',
	'size'        : '4x2',
	'theme'       : 'red',
},
{
    'name'        : 'Cotizador',
    'thumbnail'   : 'pantallas/img/widget_notification.png',
    'content'     : 'Cotizador',
    'link'         : 'pantallas/index/index-cotizador.zul',
    'size'        : '2x2',
    'theme'       : 'darkblue',
},
{
	'name'        : 'Modelo de Cotizador',
	'thumbnail'   : 'pantallas/img/widget_notification.png',
	'content'     : 'Modelo de Cotizador',
	'link'         : 'pantallas/index/index-modeloCotizador.zul',
	'size'        : '2x2',
	'theme'       : 'darkblue',
},
{
    'name'        : 'presupuesto',
    'thumbnail'   : 'pantallas/img/widget_dialog.png',
    'content'     : 'Presupuesto',
    'link'         : 'pantallas/index/index-presupuesto.zul',
    'size'        : '2x2',
    'theme'       : 'blue',
},
{
	'name'        : 'Pedido',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Pedido',
	'link'         : 'pantallas/index/index-pedido.zul',
	'size'        : '2x2',
	'theme'       : 'orange',
}
];

var tiles2 = [makeRandomTile(21), makeRandomTile(22), makeRandomTile(23), makeRandomTile(24), makeRandomTile(25), makeRandomTile(26)];
var tiles3 = [makeRandomTile(31), makeRandomTile(32), makeRandomTile(33), makeRandomTile(34), makeRandomTile(35), makeRandomTile(36), makeRandomTile(33), makeRandomTile(34), makeRandomTile(35), makeRandomTile(36)];

Metro.HTML.addContainer({'size':'full', 'tiles':tiles1});
Metro.HTML.addContainer({'size':'half', 'tiles':tiles2});
Metro.HTML.addContainer({'size':'half', 'tiles':tiles3});