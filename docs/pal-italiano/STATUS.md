# TOMBI! PAL Italiano — Stato del progetto

Ultimo aggiornamento: 21 ottobre 2026

## Obiettivo

Adattare TombaRecomp alla versione europea PAL di TOMBI!,
con particolare attenzione al supporto italiano.

- Repository: https://github.com/roccordx/TombaRecomp
- Branch: feature/tombi-pal-italiano
- Upstream: https://github.com/mstan/TombaRecomp

## Identificazione del gioco

- Titolo: TOMBI! (Europa, PAL)
- Serial: SCES-01330
- Eseguibile: SCES_013.30
- Revisione testata: Rev 1
- Entry point: 0x8001E1F4
- Load address: 0x80010000
- Text size: 0x0009E800
- Stack base: 0x801FFFF0

## Componenti verificati

- Configurazione PAL separata dalla versione USA.
- Generazione del codice C PAL completata.
- Compilazione Linux completata con codice di uscita 0.
- Eseguibile TOMBI__Recompiled_PAL prodotto (circa 22 MB).
- Backend OpenBIOS collegato.
- Backend SCPH-1001 collegato.
- BIOS SCPH-1001 selezionato correttamente dal runtime.
- Riconoscimento del disco PAL SCES-01330.
- Rilevamento della modalità video PAL a 50 Hz.
- Avvio del runtime in modalità headless.

## Ultimo test

Data: 21 ottobre 2026.

Ambiente: Linux Debian 12 in container Docker su QNAP.

BIOS: SCPH-1001, dump locale fornito dall'utente.

Risultato:

- Caricamento BIOS confermato.
- Selezione image=SCPH-1001 confermata.
- bios_backend=HLE (LLE fallback).
- bios_boot=HLE (shell skipped).
- PC iniziale riportato: 0xBFC00000.
- Test terminato dopo 30 secondi con exit code 124 (timeout).

Il timeout non dimostra il corretto avvio del gioco.

## Da verificare

- Raggiungimento dell'entry point PAL 0x8001E1F4.
- Esecuzione effettiva del codice del gioco.
- Intro e sequenze FMV.
- Menu principale e testi italiani.
- Audio.
- Controller.
- Salvataggio e caricamento.
- Gameplay.
- Compatibilità delle mod con la versione PAL.

## Problemi e limitazioni note

- Il runtime segnala che la toolchain TCC non è disponibile
  nella directory overlay_toolchain della build.
- Le lacune degli overlay utilizzano il fallback dell'interprete.
- Il raggiungimento del codice del gioco non è ancora dimostrato.
- Le modifiche locali del submodule psxrecomp richiedono
  un audit separato prima della pubblicazione.

## Materiali da non pubblicare

- ROM e immagini disco del gioco.
- Eseguibile originale SCES_013.30.
- BIOS PlayStation proprietari.
- Codice generato dalla ROM o dal BIOS proprietario.
- Memory card e salvataggi.
- Cache e catture derivate dal gioco.

## Prossimi obiettivi

1. Documentare la procedura di build riproducibile.
2. Preparare uno script di rigenerazione PAL.
3. Documentare la configurazione dei backend BIOS.
4. Verificare l'esecuzione dell'entry point PAL.
5. Validare intro, menu e gameplay.
6. Pubblicare gli aggiornamenti sicuri su GitHub.
