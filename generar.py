# Genera los documentos del repositorio de transparencia a partir de lo que exporta NexCore.
# Uso: NexCore.exe --exportar-ajustes transparencia\ajustes.json  y luego  python transparencia\generar.py
import json, pathlib, re
AQUI = pathlib.Path(__file__).parent
d = json.loads((AQUI / 'ajustes.json').read_text(encoding='utf-8'))
v = d['version']

def dword(n):
    n = n + 2**32 if n < 0 else n
    return f'{n} (0x{n:08X})' if n > 0xFFFF else str(n)

PERFILES = {'gamer': 'Gamer', 'stream': 'Stream', 'teletrabajo': 'Teletrabajo', 'creador': 'Edición', 'oficina': 'Oficina', 'basico': 'Modo liviano'}
GRUPOS = {'optimizacion': 'Optimización', 'debloat': 'Debloat (apps y funciones que sobran)'}

l = [f'# Lista completa de ajustes de NexCore {v}', '',
     'Todo lo que NexCore **puede** cambiar en Windows. Nada se aplica solo: tú eliges cada ajuste, '
     'NexCore guarda el valor anterior antes de tocar nada y todo se deshace desde **Optimización → Historial**.', '',
     'Esta lista se genera automáticamente desde el programa en cada versión (`NexCore.exe --exportar-ajustes`), '
     'así que siempre coincide con lo que hace el `.exe` publicado.', '',
     f'**{len(d["ajustes"])} ajustes.** `HKCU` = solo tu usuario · `HKLM` = todo el equipo (pide administrador).', '']
for grupo in ['optimizacion', 'debloat']:
    aj = [a for a in d['ajustes'] if a['grupo'] == grupo]
    if not aj: continue
    l += [f'## {GRUPOS[grupo]}', '']
    for a in aj:
        l.append(f'### {a["nombre"]}  `{a["id"]}`')
        l.append(a['descripcion'])
        extra = []
        if a['perfiles']: extra.append('Recomendado en: ' + ', '.join(PERFILES.get(p, p) for p in a['perfiles']))
        if a['reinicio']: extra.append(f'Requiere {a["reinicio"]}')
        if a.get('nota'): extra.append(a['nota'])
        if extra: l.append('<br>_' + ' · '.join(extra) + '_')
        l.append('')
        if a['registro']:
            l += ['| Registro | Valor | Queda en |', '|---|---|---|']
            for r in a['registro']:
                ruta = re.sub(r'(\{4d36e972-e325-11ce-bfc1-08002be10318\})\\\d{4}', r'\1\\NNNN (tu tarjeta de red)', r["ruta"])
                l.append(f'| `{r["colmena"]}\\{ruta}` | `{r["nombre"]}` | {dword(r["valor"])} |')
            l.append('')
        if a['servicios']:
            l.append('Servicios que se detienen y pasan a manual: ' + ', '.join(f'`{s}`' for s in a['servicios']))
            l.append('')
        if a['accionPropia']:
            l.append('Acción propia (no es solo un valor del registro): se describe arriba y también guarda el estado anterior para deshacer.')
            l.append('')
(AQUI / 'AJUSTES.md').write_text('\n'.join(l), encoding='utf-8')
print('AJUSTES.md', len(d['ajustes']))
