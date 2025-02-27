# Días Festivos de Colombia en Power Query

Este proyecto contiene un script en **Lenguaje M** de Power Query que consume la API de [Calendarific](https://calendarific.com/) para obtener los días festivos de Colombia desde 2020 hasta 2027. Además, traduce los nombres de los días festivos del inglés al español usando la API de Google Translate.

## Requisitos

- Power BI Desktop o Power Query.
- Una API Key de [Calendarific](https://calendarific.com/).

## Instrucciones

1. Abre Power BI Desktop.
2. Ve a `Inicio` > `Nueva fuente` > `Consulta en blanco`.
3. En el editor de Power Query, pega el contenido del archivo `PowerQueryScript.m`.
4. Reemplaza `tu_api_key_aqui` con tu API Key de Calendarific.
5. Cierra y aplica los cambios.

## Ejemplo de salida

A continuación se muestra un ejemplo del formato de salida que genera el script:

| Fecha      | Tipo         | Descripción                                                                 | Nombre (Español)       |
|------------|--------------|-----------------------------------------------------------------------------|------------------------|
| 6/01/2020  | Observance   | Epiphany is a Christian holiday celebrated globally on January 6 each year. It commemorates two events recorded in the Bible: the three wise men’s visit to baby Jesus; and Jesus’ baptism. | El día de los tres sabios |
| 19/03/2020 | Season       | March Equinox in Peru (Lima)                                                | Equinoccio de marzo    |
| 12/04/2020 | Observance   | Easter Sunday commemorates Jesus Christ’s resurrection, according to Christian belief. | Domingo de Resurrección |
| 10/05/2020 | Observance   | Mother’s Day celebrates the achievements and efforts of mothers and mother figures. | Día de las madres      |
| 7/06/2020  | Observance   | Flag Day is a observance in Peru                                             | Día de la bandera      |
| 20/06/2020 | Season       | June Solstice in Peru (Lima)                                                | Solsticio de junio     |
| 21/06/2020 | Observance   | Father’s Day celebrates fatherhood and male parenting on different dates worldwide. | Día de los padres      |
| 24/06/2020 | Observance   | Farmer Day is a observance in Peru                                           | Día del agricultor     |
| 24/06/2020 | Observance   | Inti Raymi Day is a observance in Peru                                       | INTI RAYMI DÍA         |
| 6/08/2020  | Observance   | Battle of Junín is a observance in Peru                                      | Batalla de Junín       |
| 22/09/2020 | Season       | September Equinox in Peru (Lima)                                            | Equinoccio de septiembre |
| 24/09/2020 | Observance   | Armed Forces Day is a observance in Peru                                     | Día de las Fuerzas Armadas |
| 2/11/2020  | Observance   | All Souls’ Day falls on November 2 each year. It is a day of alms giving and prayers for the dead. | Día de todas las almas |
