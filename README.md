<p align="center"><img src="icono.png" width="96" alt="NexCore"></p>

# NexCore · Transparencia

**NexCore** es un programa gratuito y en español para optimizar y diagnosticar Windows 10 y 11: monitoreo, ajustes de rendimiento, limpieza, red, juegos y periféricos. Web: **https://nexcore.tacticalopschile.cl**

El código de NexCore no es público. Este repositorio existe para que **puedas comprobar por ti mismo qué hace el programa**, sin tener que confiar a ciegas:

| Documento | Qué encuentras |
|---|---|
| [AJUSTES.md](AJUSTES.md) | Todo lo que NexCore puede cambiar en Windows: cada clave del registro, el valor que deja y qué servicios toca. Se genera automáticamente desde el programa en cada versión. |
| [ajustes.json](ajustes.json) | La misma lista en formato de datos, para revisarla con tus propias herramientas. |
| [DATOS.md](DATOS.md) | Qué datos envía el diagnóstico anónimo, qué nunca se envía y cómo apagarlo. |
| [CONEXIONES.md](CONEXIONES.md) | A qué servidores se conecta y para qué. |
| [VERSIONES.md](VERSIONES.md) | La huella SHA-256 de cada versión publicada y su análisis en VirusTotal. |
| [SEGURIDAD.md](SEGURIDAD.md) | Por qué algún antivirus puede marcarlo y cómo verificar que tu archivo es el original. |
| [verificar-nexcore.ps1](verificar-nexcore.ps1) | Script que **solo lee**: revisa que tu `.exe` sea el publicado y te muestra cada ajuste que aplicaste, con su valor de antes y el de ahora. |

## Principios

- **Tú decides.** NexCore sugiere; no aplica ajustes por su cuenta ni toca tus periféricos o preferencias sin que lo pidas.
- **Todo se deshace.** Antes de cambiar algo guarda el valor anterior (`%APPDATA%\NexCore\respaldo.json`). Lo que borra va a la Papelera o queda respaldado.
- **Nada peligroso.** No desactiva el antivirus, no edita `hosts`, no apaga IPv6 ni toca Windows Update más allá de lo que se describe en [AJUSTES.md](AJUSTES.md).
- **Diagnóstico anónimo y opcional.** Un número al azar, nunca tu nombre ni tus archivos. Se apaga en *Ajustes*.

## Verifica tu NexCore en 1 minuto

1. Descarga [`verificar-nexcore.ps1`](verificar-nexcore.ps1) y léelo (es corto y está comentado).
2. Con NexCore abierto, ejecuta en PowerShell:
   ```powershell
   powershell -ExecutionPolicy Bypass -File .\verificar-nexcore.ps1
   ```
3. Verás si tu archivo es idéntico al publicado y la lista de cambios que hizo en tu equipo. El script no cambia nada.

## Reportes y preguntas

Abre un [issue](../../issues): dudas sobre un ajuste, algo que no te cuadre o un problema con el programa. Si encuentras algo que NexCore hace y no está documentado aquí, avísanos: es un error de este repositorio y se corrige.

---
Creado por StigmacL · Un proyecto de [Tactical Ops Chile](https://tacticalopschile.cl)
