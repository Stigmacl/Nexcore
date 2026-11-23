# Qué datos envía NexCore

NexCore tiene un **diagnóstico anónimo** que sirve para encontrar errores y saber qué ajustes funcionan en cada tipo de equipo. Está activado por defecto y **se apaga en Ajustes → «Enviar diagnóstico anónimo»**. Apagado, no se envía nada de esto.

Se envía cada 2 minutos a `https://nexcore.tacticalopschile.cl/api/registro`, por HTTPS.

## Cómo se identifica tu equipo

Con un **número al azar** que se crea la primera vez que abres NexCore. No es tu nombre, ni el nombre del equipo, ni tu cuenta de Windows, ni tu IP (el servidor no la guarda en los registros).

## Lo que se envía

| Evento | Datos |
|---|---|
| `inicio` | Modelo del equipo, procesador, cantidad de hilos, RAM (GB), tipo de disco (SSD/HDD), tarjeta de video, si es notebook, versión de Windows, si abriste como administrador, perfil elegido. |
| `puntaje` | El Puntaje NexCore y sus partes (procesador, memoria, disco, inicio). |
| `ajustes` | Qué ajustes aplicaste o deshiciste (sus identificadores de [AJUSTES.md](AJUSTES.md)). |
| `limpieza` | Cuánto espacio liberaste. |
| `dns`, `driver`, `reparar`, `desinstalar`, `revision` | El resultado de esas herramientas (cuántos, si funcionó). En «Desinstalar a fondo» solo la cantidad de elementos borrados, no los nombres. |
| `recuperar` | Cuántos archivos se revisaron, encontraron y recuperaron (de la Papelera o del disco). **Nunca los nombres ni el contenido de tus archivos.** |
| `partida`, `semana`, `bajada` | Al cerrar un juego: minutos, FPS promedio, temperaturas máximas y cuántos programas se frenaron. Cada semana: cuántas líneas tuvo tu resumen. Si el puntaje baja tras aplicar ajustes: el antes y el después. Sin nombres de archivos ni nada personal. |
| `perifericos` | Marca y modelo de mouse, teclado y audífonos (su código VID:PID), para saber qué marcas soportar. |
| `actualizacion` | Si la actualización automática funcionó. |
| `error` | El tipo de error y dónde ocurrió dentro del programa. **Antes de enviarlo se borra tu carpeta de usuario y tu nombre de usuario** de los mensajes. |

Ejemplo real de un evento `inicio`:

```json
{
  "modelo": "Acer Nitro NL16-71G",
  "cpu": "13th Gen Intel(R) Core(TM) i5-13420H",
  "hilos": 12, "ramGb": 15.7, "disco": "SSD",
  "gpu": "NVIDIA GeForce RTX 4050 Laptop GPU",
  "notebook": true,
  "windows": "11 26H2 (26300.10075) Professional",
  "admin": true, "perfil": "gamer"
}
```

## Las funciones con IA

Solo cuando **tú** aprietas un botón de IA («Análisis con IA», «Tengo lag», «Se corta el WiFi», el asistente…), NexCore envía a su servidor los datos que esa ayuda necesita: el equipo (como arriba), el puntaje y, según la función, los nombres de los programas que más consumen, los de inicio, los datos de tu WiFi (señal, canal, cortes) o tu pregunta. El servidor los pasa a Gemini, Groq u OpenRouter para generar la respuesta. La respuesta y esos datos (sin nada personal) se guardan junto al diagnóstico para mejorar las recomendaciones. **Tu nombre, tus archivos y tus contraseñas nunca se envían.**

## Lo que nunca se envía

Tu nombre, el nombre del equipo, tus archivos o su contenido, tu historial del navegador, contraseñas, tu ubicación ni tu IP (no se guarda en los registros).

## Cuánto tiempo se guarda

Los registros del diagnóstico se borran solos a los **90 días**.
