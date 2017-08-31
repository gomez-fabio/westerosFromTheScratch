# westerosFromTheScratch. Creo que me sobra el "The" :-\
## Práctica del módulo Fundamentos IOS. V Bootcamp.

###Parte obligatoria

Crea la clase Season que representa una temporada. Debe de tener un número > 0 de episodios, un nombre y fecha de lanzamiento (ver Date). Cada episodio está representado por una instancia de Episode. Cada Episode tiene un título y una fecha de emisión.Todo episodio tiene una referencia a la Season de la que es parte. ¡Mucho cuidado con crear referencias circulares! Mírate weak en la parte opcional. La referencia que tiene Episode a Season ha de ser weak.

1. Implementa los siguientes protocolos en Episode y Season con sus correspondientes tests:
* a. CustomStringConvertible
* b. Equatable
* c. Hashable* d. Comparable2. Crea una propiedad calculada en tu Repository.local llamada seasons (similar a houses). Devuelve las primeras 6 temporadas, ordenadas, con sus episodios (2 por temporada, no hace falta ponerlos todos :­).3. Crea una función en tu Repository.local llamada seasons(filteredBy:) ­> [Season] que acepta una clausura (similar a lo que hicimos para houses) y te permite recibir un [Season] filtrado.4. Crea un SeasonsViewController (tabla, ya sea usando la técnica genérica descrita más arriba o repitiendo el código). Al hacer clic sobre una celda, se debe de hacer un push de un SeasonViewController.5. Haz lo equivalente para EpisodesViewController y EpisodeViewController6. Nueva Interfaz:

* a. Crea a un HousesViewController empaquetado dentro de un NavigationController.* b. Crea un SeasonsViewController empaquetado dentro de un NavigationViewController
* c. Mete a ambos dentro de un UITabBarController ~~empaquetado dentro de un NavigationController.~~* d. Usa éste como rootViewController de tu App. Asegúrate de poder cambiar de uno a otro y poder navegar de House a Person y de Season a Episode.

###Parte opcional
1. Implementación con genéricos para todas las vistas que usan UITableView, listado de Houses, listado de Seasons, listado de Episodes, listado de Members

###Extras
* Personalizada la interfaz con colores e imagenes tabbar
* Scroll view en los xib de housevc, episodevc
* Autolayout en todos los xib