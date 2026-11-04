# portal_noticias

## Widgets usados

### AppBar

Widget usado para ponerle un titulo a la app

### Center

Widget usado para centrar el contenido

### SingleChildScrollView

Widget usado para el scroll tanto vertical en las noticias como horizontal para el menú con scrollDirection: Axis.horizontal

### Row / Column

Widgets usados para posicionar el contenido row del menu y column las noticias y el contenido de una noticia

### SizedBox

Widget usado para dejar un espacio en blanco entre dos widgets

### ElevatedButton 

Widgets usado para los botones del menú

### Container

Widget usado para almazenar un widget y darle unas dimensiones width y heigth

### TextField 

Widget usado para crear un campo de texto el cual sirve para buscar noticias

### Expanded

Widget usado para que un widget se expanda hasta ocupar su máxima medida

### CircularProgressIndicator 

Widget usado para generar un logo de carga

## Layout de la vista

### vista general

El layout de la vista se conforma de un menú en la parte superior con scroll horizontal para seleccionar el tipo de noticia que quieres,
debajo un buscador para buscar noticias por texto y debajo o el logo de carga si esta cargando noticias o las noticias cargadas con scroll vertical

### Noticia

Una noticia se conforma de una columna con uma imagen, un titulo en negrita y grande, un subtitulo un poco mas grande que el contenido y en seminegrita, un contenido mas pequeño y una fila con dos textos con spaceBetween la fecha y el medio del que proviene la noticia