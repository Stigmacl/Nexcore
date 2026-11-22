# Antivirus y seguridad

## ¿Por qué un antivirus puede marcar NexCore?

Algunos antivirus (por ejemplo VBA32, o el escudo de comportamiento de Avast como `IDP.Generic`) marcan NexCore como sospechoso. Es un **falso positivo**: no detectan un virus conocido, sino comportamientos que también tienen los programas de optimización legítimos:

- Se ejecuta como administrador y cambia ajustes de Windows (registro, servicios, plan de energía).
- Se actualiza solo: descarga su versión nueva y se reemplaza.
- Trae dentro un instalador de driver (PawnIO, firmado) para leer las temperaturas.
- Todavía no tiene firma digital de código, y cada versión es un archivo nuevo sin historial.

En VirusTotal, más de 60 antivirus lo analizan como limpio. Revisa el análisis de cada versión en [VERSIONES.md](VERSIONES.md).

## Cómo comprobar que tu archivo es el original

1. Calcula la huella de tu archivo en PowerShell:
   ```powershell
   Get-FileHash .\NexCore.exe -Algorithm SHA256
   ```
2. Compárala con la de [VERSIONES.md](VERSIONES.md) o con `https://nexcore.tacticalopschile.cl/version.json`.
3. O usa [verificar-nexcore.ps1](verificar-nexcore.ps1), que lo hace por ti.

Si la huella no coincide, **no lo uses** y descárgalo de nuevo desde https://nexcore.tacticalopschile.cl.

## Si tu antivirus lo bloqueó

Restáuralo desde la cuarentena del antivirus y agrégalo como excepción. Si quieres ayudar, repórtalo como falso positivo al fabricante de tu antivirus: así deja de pasarle a otros.

## Reportar un problema de seguridad

Si crees haber encontrado un problema de seguridad real en NexCore, abre un [issue](../../issues) sin detalles sensibles y te contactamos.
