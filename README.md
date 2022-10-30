# Polygon

Linkeding [@Stiven Morelos Barahona](https://www.linkedin.com/in/stiven-morelo-barahona-61a9a11a5/)

## Patron Bloc y Clean Architecture

Utilizando el patrón bloc para el planteamiento de la lógica de la aplicación, subdividiendo de responsabilidades y creando entidades abstractas que controlan las peticiones a través de consumo de servicios con inyectados por dependencias sin librerias, mientras que clean architecture entre sus grandes bondades nos entrega una forma clara de organización de proyectos y refuerzos de principios SOLID, entre otros puntos, mejorando la legibilidad del proyecto mismo.

## Manejo de Estado

Para el control de la información y estados en la aplicación se emplea Cubit dado su gran manejo y adaptación a diferentes eventualidades, gracias si emisión de estados, basados en el principio de los Streams, para ciertos procesos se utilizó Provider, dado que el principio de responsabilidad única aplicado a este permite la accesibilidad estable y rápida en cualquier momento de la ejecución, sin crear otra entidad o romper el flujo de Stream.

## API
Para el proceso de la capa de data implemente mi propia version de la libreria del funcionamiento de [Either](https://pub.dev/packages/either_dart), esta permitiendome manejar los eventos de peticiones con sus diferentes status y contidiciones y ofreciendome el control que se necesita para realizar pruebas Unitarias o de Integracion.

## Inyeccion de dependencias

En este punto realmente decidi no enfocarme, pues realizar inyeccion de dependencia en un tema bastante simple y decidi no perder tiempo en ello para esta prueba, aunque quizas hubiera sido divertido crear un propio inyector de dependencias para este proyecto.

## Animationes y graficas

Para estas utilice la libreria fl_chart con una que otra modificacion de su capa base.

## Testing

Ha nivel de Test se desarrollaron 2 de los 3 niveles existentes:

### Unit Testing

Este lo desarrolle con la mentalidad y propósito de verificación del funcionamiento correcto de la capa de SERVICIOS/DATA y sus diferentes eventos provenientes de esta, garantizando un control de errores acorde a lo esperado por el proyecto.

### Integration Testing

El principio detrás de estas pruebas es la verificación del flujo bi-direccional de la aplicación, DATA-LOGIC-UI, esto a través de las diferentes formas de emisión de información y eventos accionados para un usuario usuario final, aunque admito que me bloquee por 30 minutos por un pequeño cambio que se realizo hace pocas versiones de Flutter y curiosamente no hay documentacion de ello jjajaja, pero bueno, igual se logro resolver.

## Persistencia de datos.

En este punto fue necesario no solo implementar local storage, sino tambien controlar el tema de la conexion del mobil que usa la app, fue un pequeño reto divertido, pero tambien logro molestarme por unos minutos, dado ciertos cambios a nivel de lectura de codigo de dart hacia c++ cuando este pierde conexion teniendo datos masivos para graficas, eran temas pequeños, pero que fue divertido aprender.

Bueno, he aqui mi prueba, la he realizado con mucho cariño, y estare atento al feedback, es algo muy importante para mi.

## Puntos extra en la prueba.
3/3 implementados.

## Configuracion de ambiente.
Flutter: 3.3.2
Visual Studio Code: Last version.



Feliz dia/tarde/noche.

