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
              
//menues.add(MenuOV.newInstance("Visor de Planificación", "index/visor-agenda.zul", "small"));
	
{
	'name'        : 'Plantilla',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Plantilla',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/index/plantilla.zul'
},
{
	'name'        : 'Laboratorio',
	'thumbnail'   : 'pantallas/img/labs.png',
	'content'     : 'Laboratorio',
	'size'        : '4x2',
	'theme'       : 'grey',
	'link'         : 'pantallas/index/index-laboratorio.zul',
},
{
	'name'        : 'Equipo',
	'thumbnail'   : 'pantallas/img/widget_tag.png',
	'content'     : 'Equipo',
	'size'        : '4x2',
	'theme'       : 'grey',
	'link'         : 'pantallas/index/index-equipo.zul',
},
{
    'name'        : 'Determinaciones Electricas',
    'thumbnail'   : 'pantallas/img/widget_tooltip.png',
    'content'     : 'Determinaciones Electricas',
    'link'         : 'pantallas/index/index-determinacion.zul?l=LaboratorioElectrico',
    'size'        : '2x2',
    'theme'       : 'grey'
},
{
	'name'        : 'Determinaciones Quimicas',
	'thumbnail'   : 'pantallas/img/widget_scroll.png',
	'content'     : 'Determinaciones Quimicas',
	'link'         : 'pantallas/index/index-determinacion.zul?l=LaboratorioQuimico',
	'size'        : '2x2',
	'theme'       : 'grey',
},
{
	'name'        : 'Cotizacion',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Cotizacion',
	'link'         : 'pantallas/index/index-cotizacion.zul',
	'size'        : '4x2',
	'theme'       : 'orange',
},
{
	'name'        : 'Modelo de Cotizador',
	'thumbnail'   : 'pantallas/img/modeloCotizador.png',
	'content'     : 'Modelo de Cotizador',
	'link'         : 'pantallas/index/index-modeloCotizador.zul',
	'size'        : '2x2',
	'theme'       : 'darkblue',
},
{
    'name'        : 'Conceptos',
    'thumbnail'   : 'pantallas/img/melonhtml5.png',
    'content'     : 'Concepto Presupuesto',
    'size'        : '2x2',
    'theme'       : 'darkblue',
    'link'         : 'pantallas/index/index-conceptos.zul',
},
{
    'name'        : 'Cotizador',
    'thumbnail'   : 'pantallas/img/cotizador.png',
    'content'     : 'Cotizador',
    'link'         : 'pantallas/index/index-cotizador.zul',
    'size'        : '4x2',
    'theme'       : 'darkblue',
},
{
    'name'        : 'presupuesto',
    'thumbnail'   : 'pantallas/img/presupuesto.png',
    'content'     : 'Presupuesto',
    'link'         : 'pantallas/index/index-presupuesto.zul',
    'size'        : '4x2',
    'theme'       : 'blue',
},
{
	'name'        : 'Pedido',
	'thumbnail'   : 'pantallas/img/order.png',
	'content'     : 'Pedido',
	'link'         : 'pantallas/index/index-pedido.zul',
	'size'        : '4x2',
	'theme'       : 'red',
},
{
	'name'        : 'Planificacion de Pedido',
	'thumbnail'   : 'pantallas/img/calendar_tasks.png',
	'content'     : 'Planificacion de Pedido',
	'link'         : 'pantallas/index/index-agenda.zul',
	'size'        : '4x2',
	'theme'       : 'red',
},
{
	'name'        : 'Tareas por Sector',
	'thumbnail'   : 'pantallas/img/planificacion.png',
	'content'     : 'Visor de Tareas por Sector',
	'link'        : 'pantallas/index/index-vista-agenda-sector.zul',
	'size'        : '2x2',
	'theme'       : 'red',
},
{
	'name'        : 'Tareas por Pedido',
	'thumbnail'   : 'pantallas/img/planificacion.png',
	'content'     : 'Visor de Tareas por Pedido',
	'link'        : 'pantallas/index/index-vista-agenda-pedido.zul',
	'size'        : '2x2',
	'theme'       : 'red',
}

];

var tiles2 = [
{
	'name'        : 'Sector',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Sector',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/generic/genericList.zul?metadata=guardarSector-sector',
},
{
	'name'        : 'Tarea',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Tarea',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/generic/genericList.zul?metadata=guardarTareaSimple-tarea',
},
{
	'name'        : 'Unidad de Medida',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Unidad de Medida',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/generic/genericList.zul?metadata=guardarUnidadMedida-unidadMedida',
},
{
	'name'        : 'Idioma',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Idioma',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/generic/genericList.zul?metadata=guardarIdioma-idioma',
},
{
	'name'        : 'Moneda',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Moneda',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/generic/genericList.zul?metadata=guardarMoneda-moneda',
},
{
	'name'        : 'Pais',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Pais',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/generic/genericList.zul?metadata=guardarPais-pais',
},
{
	'name'        : 'Documentacion',
	'thumbnail'   : 'pantallas/img/widget_dialog.png',
	'content'     : 'Documentacion',
	'size'        : '2x2',
	'theme'       : 'green',
	'link'         : 'pantallas/generic/genericList.zul?metadata=guardarDocumentacion-documentacion',
}

];

//var tiles3 = [makeRandomTile(31), makeRandomTile(32), makeRandomTile(33), makeRandomTile(34), makeRandomTile(35), makeRandomTile(36), makeRandomTile(33), makeRandomTile(34), makeRandomTile(35), makeRandomTile(36)];

Metro.HTML.addContainer({'size':'full', 'tiles':tiles1});
Metro.HTML.addContainer({'size':'half', 'tiles':tiles2});
//Metro.HTML.addContainer({'size':'half', 'tiles':tiles3});
