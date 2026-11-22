# A qué se conecta NexCore

Todas las conexiones son por HTTPS. NexCore no abre puertos ni acepta conexiones entrantes.

| Servidor | Para qué | Cuándo |
|---|---|---|
| `nexcore.tacticalopschile.cl` | Buscar actualizaciones (`version.json`), diagnóstico anónimo, funciones con IA, reportes y catálogo de periféricos. | Al abrir y cada pocos minutos (el diagnóstico se puede apagar). |
| `downloader.tacticalopschile.cl` | Descargar la versión nueva de NexCore (verificada con su SHA-256 antes de instalarse). | Solo cuando hay actualización. |
| `speed.cloudflare.com` | Prueba de velocidad de internet. | Solo cuando la usas. |
| `stat.ripe.net` | Saber qué operador tiene tu IP pública (para el informe de red). | Solo en la prueba de internet. |
| Servidores de juegos y DNS públicos (1.1.1.1, 8.8.8.8, 9.9.9.9, OpenDNS) | Medir ping y elegir el DNS más rápido. | Solo cuando usas esas funciones. |
| Páginas oficiales de NVIDIA, AMD, Intel, Realtek y fabricantes de periféricos | Descargar drivers y programas oficiales (se instalan solo si la firma digital es del fabricante). | Solo cuando lo eliges en Descargas. |
| `winget` (Microsoft) | Actualizar tus programas instalados. | Solo cuando lo eliges. |

NexCore **no** usa servidores de publicidad ni de rastreo.
