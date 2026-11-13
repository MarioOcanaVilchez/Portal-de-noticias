# 📰 Portal de Noticias (Flutter)

Aplicación multiplataforma desarrollada con **Flutter** y **Dart** para consultar noticias en tiempo real en español utilizando la API de [GNews](https://gnews.io/).

---

## ✨ Características principales

- **Filtrado por categorías:** Navegación horizontal entre distintas secciones (*Globales, España, Sucesos, Deportes, Tecnología, Ciencia, Entretenimiento y Salud*).
- **Búsqueda por texto libre:** Buscador integrado para localizar artículos por palabras clave.
- **Caché en memoria por categoría:** Evita peticiones redundantes al cambiar entre pestañas ya consultadas.
- **Diseño adaptable:** Interfaz limpia con indicadores de carga y tarjetas detalladas por noticia.

---

## 🚀 Configuración y ejecución

1. **Clonar el repositorio:**
   ```bash
   git clone https://github.com/MarioOcanaVilchez/Portal-de-noticias.git
   cd Portal-de-noticias
   ```

2. **Instalar dependencias:**
   ```bash
   flutter pub get
   ```

3. **Ejecutar inyectando tu API Key de GNews (`GNEWS_API_KEY`):**
   ```bash
   flutter run --dart-define=GNEWS_API_KEY=tu_api_key_aqui
   ```

---

## 🧩 Estructura de la interfaz y Widgets utilizados

### Componentes principales
- **`AppBar`**: Barra superior con el título centrado de la aplicación.
- **`SingleChildScrollView`**: Permite el desplazamiento tanto horizontal en la barra de categorías (`scrollDirection: Axis.horizontal`) como vertical en el listado de artículos.
- **`Row` / `Column`**: Organización estructural del menú de categorías, las tarjetas de noticias y sus metadatos.
- **`Container` y `SizedBox`**: Contenedores para almacenar y dimensionar cada tarjeta (`width` y `height`) y definir el espaciado entre elementos.
- **`ElevatedButton`**: Botones interactivos del selector de categorías.
- **`TextField`**: Campo de búsqueda para filtrar noticias por texto.
- **`Expanded`**: Ajuste dinámico del área de listado para ocupar el espacio disponible en pantalla.
- **`CircularProgressIndicator`**: Indicador visual durante la carga asíncrona de datos.

### Estructura de cada tarjeta de noticia
Cada artículo se presenta en una columna estructurada con:
1. **Imagen destacada** de la noticia.
2. **Título** principal en negrita.
3. **Subtítulo / Descripción** en peso medio.
4. **Resumen del contenido** truncado limpiamente.
5. **Pie de tarjeta (`Row` con `spaceBetween`)** que muestra la fecha de publicación y el medio de origen.
