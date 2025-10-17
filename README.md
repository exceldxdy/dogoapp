# DogoApp

Esta aplicación muestra información sobre nuestros mejores amigos ¡Los perros!

## Cómo ejecutar

- Descargar el repositorio completo.
- Abrirlo usando cualquier IDE (de preferencia IntelliJ).
- En la terminal del IDE escribir el comando 'flutter build "plataforma_a_compilar"'.
- Buscar el archivo creado.

## Proceso de desarrollo

El proceso de desarrollo de este programa fue complicado.
Mis conocimientos acerca de Dart y de Flutter eran muy básicos,
por lo tanto, rápidamente mis habilidades se vieron sobrepasadas por el reto.
No obstante, me propuse continuar, pues a fin de cuentas siempre se puede saber más.

Mi primera aproximación para atacar el problema fue intentar hacer todo en un archivo único,
pero eso resultó ser mala idea, el código creció muy deprisa y era difícil navegar por él.
Entonces decidí seguir las buenas prácticas de desarrollo y separar primero las partes lógicas
de las partes de interfaz gráfica. Pero el código aún era muy grande,
por lo que separé la interfaz en partes más pequeñas y fáciles de describir,
de este modo terminé dividiendo la interfaz en 3 piezas principales: esqueleto de la app,
esqueletos de página y componentes principales.
Me topé con bastantes bugs y errores durante el desarrollo. Principalmente,
al inicio, ya que no sabía cómo usar las clases Future y FutureBuilder,
lo que provocó que no pudiera obtener la información de la API correctamente.

Hay un bug sin resolver cuando se ejecuta la versión web de la app.
Este consiste en que el programa no carga las imágenes correctamente,
sin embargo, la solución a este bug implica hacer cambios en la configuración
del servidor que aloja la API, por lo que es irreparable.
