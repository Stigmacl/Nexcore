# Lista completa de ajustes de NexCore 0.6.78

Todo lo que NexCore **puede** cambiar en Windows. Nada se aplica solo: tú eliges cada ajuste, NexCore guarda el valor anterior antes de tocar nada y todo se deshace desde **Optimización → Historial**.

Esta lista se genera automáticamente desde el programa en cada versión (`NexCore.exe --exportar-ajustes`), así que siempre coincide con lo que hace el `.exe` publicado.

**45 ajustes.** `HKCU` = solo tu usuario · `HKLM` = todo el equipo (pide administrador).

## Optimización

### Plan de energía de alto rendimiento  `energia`
El procesador no baja su velocidad para ahorrar energía.
<br>_Recomendado en: Gamer, Edición, Stream · En notebooks gasta más batería: ideal enchufado._

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### Apagar la grabación en segundo plano  `gamedvr`
La Xbox Game Bar deja de grabar los juegos todo el rato. Libera procesador y tarjeta de video.
<br>_Recomendado en: Gamer, Edición, Modo liviano, Stream_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\System\GameConfigStore` | `GameDVR_Enabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR` | `AppCaptureEnabled` | 0 |

### Que Windows no apague la tarjeta de red  `redahorro`
Evita cortes del WiFi o del cable cuando Windows intenta ahorrar energía.
<br>_Recomendado en: Gamer, Teletrabajo, Stream · Requiere reiniciar_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\NNNN` | `PnPCapabilities` | 24 |

### Activar el modo de juego  `modojuego`
Windows da prioridad al juego abierto y no instala actualizaciones mientras juegas.
<br>_Recomendado en: Gamer, Stream_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\GameBar` | `AutoGameModeEnabled` | 1 |
| `HKCU\Software\Microsoft\GameBar` | `AllowAutoGameMode` | 1 |

### Programación de GPU acelerada por hardware  `hags`
La tarjeta de video organiza su propio trabajo: menos retraso y algo más de rendimiento.
<br>_Recomendado en: Gamer, Edición, Stream · Requiere reiniciar_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers` | `HwSchMode` | 2 |

### Optimizaciones para juegos en ventana  `ventana`
Los juegos en ventana o sin bordes responden como en pantalla completa: menos retraso.
<br>_Recomendado en: Gamer, Stream · Disponible en Windows 11._

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### Prioridad para juegos y multimedia  `prioridadjuegos`
Windows deja de frenar la red y reserva menos procesador para tareas de fondo.
<br>_Recomendado en: Gamer_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile` | `NetworkThrottlingIndex` | 4294967295 (0xFFFFFFFF) |
| `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile` | `SystemResponsiveness` | 10 |

### No compartir actualizaciones con otros PCs  `p2p`
Windows deja de usar tu internet para enviar actualizaciones a otros equipos.
<br>_Recomendado en: Gamer, Teletrabajo, Modo liviano, Stream, Oficina, Edición_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization` | `DODownloadMode` | 0 |

### Quitar sugerencias y apps promocionadas  `sugerencias`
Sin anuncios en el menú Inicio ni apps que se instalan solas.
<br>_Recomendado en: Gamer, Teletrabajo, Edición, Oficina, Modo liviano, Stream_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SilentInstalledAppsEnabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SystemPaneSuggestionsEnabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SoftLandingEnabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SubscribedContent-338388Enabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SubscribedContent-338389Enabled` | 0 |

### Apps de la Tienda sin funcionar en segundo plano  `segundoplano`
Las apps de Microsoft Store dejan de correr cuando no las usas.
<br>_Recomendado en: Modo liviano · Las notificaciones de esas apps pueden llegar con atraso._

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications` | `GlobalUserDisabled` | 1 |

### Efectos visuales en modo rendimiento  `efectos`
Sin animaciones ni transparencias: las ventanas se abren más rápido en equipos lentos.
<br>_Recomendado en: Modo liviano · Requiere cerrar sesión_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects` | `VisualFXSetting` | 2 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize` | `EnableTransparency` | 0 |

### Telemetría de Windows al mínimo  `telemetria`
Windows envía menos datos de uso a Microsoft y usa menos disco en segundo plano.
<br>_Recomendado en: Oficina, Modo liviano_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection` | `AllowTelemetry` | 0 |
| `HKLM\SYSTEM\CurrentControlSet\Services\DiagTrack` | `Start` | 4 |

Servicios que se detienen y pasan a manual: `DiagTrack`

### Desactivar SysMain (precarga de programas)  `sysmain`
En equipos con disco mecánico y poca RAM suele dejar el disco al 100 %.
<br>_Recomendado en: Modo liviano · En equipos con SSD conviene dejarlo activo._

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SYSTEM\CurrentControlSet\Services\SysMain` | `Start` | 4 |

Servicios que se detienen y pasan a manual: `SysMain`

### Desactivar el indexado de búsqueda  `indexado`
Windows deja de recorrer el disco para indexar archivos.
<br>_Recomendado en: Modo liviano · La búsqueda del menú Inicio y de Outlook será más lenta._

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SYSTEM\CurrentControlSet\Services\WSearch` | `Start` | 4 |

Servicios que se detienen y pasan a manual: `WSearch`

### Que Windows no baje el volumen en llamadas  `ducking`
Al hablar por Discord, Teams o Zoom, el juego y la música siguen con su volumen normal.
<br>_Recomendado en: Teletrabajo, Stream, Gamer_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Multimedia\Audio` | `UserDuckingPreference` | 3 |

### Búsqueda del menú Inicio sin resultados de internet  `busquedaweb`
La búsqueda muestra solo tus programas y archivos: responde más rápido y sin publicidad.
<br>_Recomendado en: Oficina, Teletrabajo, Modo liviano · Requiere cerrar sesión_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Policies\Microsoft\Windows\Explorer` | `DisableSearchBoxSuggestions` | 1 |

### Programas de inicio sin espera  `inicioapps`
Windows abre tus programas de inicio apenas entras, sin la pausa de unos segundos.
<br>_Recomendado en: Oficina, Teletrabajo_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize` | `StartupDelayInMSec` | 0 |

### Sin registrar la fecha de último acceso  `ultimoacceso`
Windows deja de escribir en el disco cada vez que abres un archivo o una carpeta. En discos mecánicos las carpetas abren más rápido.
<br>_Requiere reiniciar · Algunos programas de respaldo usan esa fecha; la de modificación se sigue guardando._

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SYSTEM\CurrentControlSet\Control\FileSystem` | `NtfsDisableLastAccessUpdate` | 2147483649 (0x80000001) |

### Inicio rápido de Windows  `iniciorapido`
Al apagar, Windows guarda su núcleo y arranca en menos tiempo. Con disco mecánico el arranque se acorta bastante.
<br>_Recomendado en: Modo liviano, Oficina · Si usas otro sistema en el mismo equipo (doble arranque), déjalo apagado._

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power` | `HiberbootEnabled` | 1 |

### Retrasar servicios de programas al iniciar  `serviciosretrasados`
1 servicio de programas (actualizadores y ayudantes) parten unos 2 minutos después de entrar, cuando el escritorio ya está listo: Acer Device Management Framework.
<br>_Recomendado en: Modo liviano, Oficina, Teletrabajo · Requiere reiniciar · Nunca toca servicios de Windows, antivirus, audio, Bluetooth, touchpad, VPN, acceso remoto ni temperatura._

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### DNS más rápido (automático)  `dnsrapido`
Mide Cloudflare, Google, Quad9 y OpenDNS contra el DNS de tu proveedor y deja el que responde más rápido. Las páginas, juegos y apps encuentran sus servidores antes. Si el tuyo ya es el más rápido, no cambia nada.
<br>_Recomendado en: Gamer, Stream, Teletrabajo, Edición, Oficina, Modo liviano · Solo cambia la conexión activa. No toca equipos de empresa, VPN ni redes con DNS propio (Pi-hole)._

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### Mouse sin aceleración  `mouse`
Apaga «Mejorar la precisión del puntero»: el cursor y la mira se mueven siempre lo mismo para el mismo gesto. Más puntería en juegos de disparos.
<br>_Recomendado en: Gamer, Stream · Al principio el mouse puede sentirse más lento; ajusta la sensibilidad en el juego o en el software del mouse._

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### Mantener activos los dispositivos USB  `usb`
Windows deja de apagar audífonos, micrófonos, cámaras, capturadoras y discos USB para ahorrar energía. Evita cortes en llamadas, transmisiones y exportaciones.
<br>_Recomendado en: Teletrabajo, Stream, Edición_

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### WiFi sin ahorro de energía  `wifiahorro`
El adaptador inalámbrico trabaja a máximo rendimiento: menos saltos de ping y cortes en llamadas.
<br>_Recomendado en: Teletrabajo, Stream, Gamer_

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### «Finalizar tarea» en la barra de tareas  `finalizartarea`
Clic derecho en un programa de la barra → «Finalizar tarea». Cierra un juego colgado sin abrir el Administrador de tareas.
<br>_Recomendado en: Gamer, Stream, Edición_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings` | `TaskbarEndTask` | 1 |

### Sin el aviso de Teclas especiales  `teclasespeciales`
Apretar Shift cinco veces en un juego ya no saca al escritorio con el aviso de Teclas especiales.
<br>_Recomendado en: Gamer, Stream · Requiere cerrar sesión_

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### Mostrar las extensiones de los archivos  `extensiones`
Ves si un archivo es .exe aunque se llame «mod.pdf». Ayuda a no abrir programas disfrazados.
<br>_Recomendado en: Oficina, Teletrabajo, Gamer_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `HideFileExt` | 0 |

### Windows Update no reinicia con tu sesión abierta  `noreiniciowu`
Las actualizaciones se instalan igual, pero el equipo espera a que tú lo reinicies: no se reinicia en medio de una partida o un trabajo.
<br>_Recomendado en: Gamer, Stream, Teletrabajo, Edición, Oficina, Modo liviano_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU` | `NoAutoRebootWithLoggedOnUsers` | 1 |

### Pantallazo azul con detalles  `pantallazodetalle`
Si Windows se cae, el pantallazo azul muestra el código y el archivo culpable. Sirve para encontrar el driver que falla.
<br>_Recomendado en: Gamer, Edición_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SYSTEM\CurrentControlSet\Control\CrashControl` | `DisplayParameters` | 1 |

### Windows Update no cambia tus drivers  `driversvideowu`
Windows deja de reemplazar el driver de video (u otros) que instalaste tú. Útil si un driver nuevo te dio problemas.
<br>_Los drivers quedan a tu cargo: NexCore te avisa en «Descargas» cuando hay versión nueva._

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate` | `ExcludeWUDriversInQualityUpdate` | 1 |

### WiFi a máximo rendimiento (enchufado)  `wifimaximo`
El plan de energía deja de bajar la potencia de la tarjeta WiFi: menos cortes y menos ping irregular.
<br>_Recomendado en: Gamer, Stream, Teletrabajo_

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### Sin suspensión selectiva de USB (enchufado)  `usbsuspension`
Windows deja de apagar los puertos USB sin uso: evita que el mouse, el teclado o los audífonos se desconecten un segundo.
<br>_Recomendado en: Gamer, Stream_

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

### Sin ahorro de energía en PCI Express (enchufado)  `pcieahorro`
La tarjeta de video y la WiFi no entran en ahorro entre cuadros: menos tirones y micro cortes.
<br>_Recomendado en: Gamer_

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.

## Debloat (apps y funciones que sobran)

### Widgets y noticias de la barra de tareas  `widgets`
Quita el panel de noticias, clima y anuncios, que se carga en segundo plano.
<br>_Requiere cerrar sesión_

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Policies\Microsoft\Dsh` | `AllowNewsAndInterests` | 0 |

### Copilot de Windows  `copilot`
Desactiva el asistente Copilot integrado en Windows.
<br>_Requiere cerrar sesión_

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot` | `TurnOffWindowsCopilot` | 1 |

### Recall (capturas de pantalla con IA)  `recall`
Windows deja de guardar capturas de lo que haces para buscarlas con IA. Ahorra disco y protege tu privacidad.

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Policies\Microsoft\Windows\WindowsAI` | `DisableAIDataAnalysis` | 1 |

### ID de publicidad  `publicidad`
Las apps dejan de usar un identificador para mostrarte anuncios personalizados.

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo` | `Enabled` | 0 |

### Apps recomendadas en el menú Inicio  `inicio-recomendaciones`
El menú Inicio deja de promocionar apps de la Tienda.

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced` | `Start_IrisRecommendations` | 0 |

### Sugerencias en Configuración y al iniciar  `consejos`
Sin contenido sugerido en Configuración ni la pantalla de «terminemos de configurar tu equipo».

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SubscribedContent-338393Enabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SubscribedContent-353694Enabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SubscribedContent-353696Enabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SubscribedContent-310093Enabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement` | `ScoobeSystemSettingEnabled` | 0 |

### Anuncios en la pantalla de bloqueo  `bloqueo-anuncios`
Quita datos curiosos, consejos y promociones de la pantalla de bloqueo.

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `RotatingLockScreenOverlayEnabled` | 0 |
| `HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager` | `SubscribedContent-338387Enabled` | 0 |

### Edge abierto en segundo plano  `edge-fondo`
Edge deja de cargarse al iniciar Windows y de seguir abierto al cerrarlo. Libera memoria si no lo usas.

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Policies\Microsoft\Edge` | `StartupBoostEnabled` | 0 |
| `HKLM\SOFTWARE\Policies\Microsoft\Edge` | `BackgroundModeEnabled` | 0 |

### Historial de actividad  `actividad`
Windows deja de registrar los programas y archivos que abres.

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Policies\Microsoft\Windows\System` | `PublishUserActivities` | 0 |
| `HKLM\SOFTWARE\Policies\Microsoft\Windows\System` | `UploadUserActivities` | 0 |

### Apps del fabricante que se instalan solas  `appsfabricante`
Al conectar un mouse, teclado o audífono, Windows ya no descarga por su cuenta el programa de la marca.

| Registro | Valor | Queda en |
|---|---|---|
| `HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata` | `PreventDeviceMetadataFromNetwork` | 1 |

### Click to Do (IA de Windows)  `clicktodo`
Apaga «Click to Do», que analiza lo que hay en tu pantalla en los equipos Copilot+.

| Registro | Valor | Queda en |
|---|---|---|
| `HKCU\Software\Policies\Microsoft\Windows\WindowsAI` | `DisableClickToDo` | 1 |

### Telemetría de PowerShell 7  `telemetriapowershell`
PowerShell 7 deja de enviar datos de uso a Microsoft.

Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.
