# DecoDXLog CX8ANM — edición Cóndor Tecnológico

Versión personalizada de **DecoDXLog** para la estación CX8ANM (Uruguay).

> Basada en [DecoDXLog](https://github.com/iu8lmc/DecoDXLog) de Martino Merola **IU8LMC**
> y Salvatore Raccampo **9H1SR**. Licencia **GPL-3.0** (ver `LICENSE`). Todo el mérito
> técnico es de los autores originales.

## Qué cambia respecto al original

- Nombre visible "DecoDXLog CX8ANM" e ícono propio (cóndor CX8ANM + LOG).
- Español como idioma por defecto.
- Créditos de la edición en la ventana "Acerca de".
- Actualizador automático desactivado (para que no instale la versión oficial encima).
- Instalador con identificador propio: se puede tener junto al DecoDXLog oficial.
- El CI ya no corre en cada push (repo privado, para ahorrar minutos).

## Compilar

Actions → **Release Windows (manual MinGW)** → Run workflow (dejar `publish` sin marcar)
→ artefacto `DecoDXLog-<versión>-windows-x64-MinGW-test`.

## Traer cambios del original

```
git remote add upstream https://github.com/iu8lmc/DecoDXLog.git
git fetch upstream
git merge upstream/main
```

73 de CX8ANM — Daniel Niño
