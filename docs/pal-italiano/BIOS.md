# TOMBI! PAL Italiano — Configurazione BIOS

Ultimo aggiornamento: 21 ottobre 2026.

## Obiettivo

Documentare il supporto BIOS utilizzato durante
la compilazione e i test del runtime PAL.

## BIOS utilizzato

- Modello: Sony PlayStation SCPH-1001.
- Dimensione: 524288 byte.
- CRC32: 37157331.
- SHA-256: 71af94d1e47a68c11e8fdb9f8368040601514a42a5a399cda48c7d3bff1e99d3.
- File locale nel container: /bios/psx/scph1001.bin.

Il dump è materiale proprietario e rimane esclusivamente
nell'ambiente locale dell'utente.

## Verifiche effettuate

Il BIOS locale è stato confrontato con il profilo:

    psxrecomp/bios/SCPH1001.toml

La verifica degli identificativi è risultata positiva.

## Backend disponibili

La configurazione CMake utilizzata ha riportato:

    BIOS backends linked: OpenBIOS;SCPH1001

Nel binario sono stati individuati i simboli:

    OpenBIOS_psx_bios_backend
    SCPH1001_psx_bios_backend

Questo conferma il collegamento dei backend,
non il corretto completamento del boot.

## Generazione del backend SCPH-1001

Nell'ambiente QNAP è stato utilizzato:

    cd /workspace/TombaRecomp/psxrecomp

    tools/regen_bios.sh \
      --config bios/SCPH1001.toml

Il processo ha prodotto i sorgenti necessari
alla compilazione del backend.

La generazione ha segnalato una funzione non
supportata, gestita tramite fallback interprete.

I sorgenti generati dal BIOS proprietario
non devono essere pubblicati.

## Collegamento del dump nel container

Il BIOS è disponibile in sola lettura:

    /bios/psx/scph1001.bin

Nell'ambiente di sviluppo è stato predisposto
un collegamento locale:

    psxrecomp/bios/SCPH1001.BIN

Il collegamento punta al dump disponibile
nel container e non deve essere distribuito.

## Risultato del test headless

Il runtime ha riportato:

    psxrecomp runtime: loading BIOS from /bios/psx/scph1001.bin

    bios_backend=HLE (LLE fallback)
    bios_boot=HLE (shell skipped)
    image=SCPH-1001

    psxrecomp runtime: executing from PC=0xBFC00000

Il processo è stato interrotto dopo 30 secondi
dal timeout di test, con codice di uscita 124.

## Interpretazione

Risultati confermati:

- Il file BIOS è stato individuato e caricato.
- Il runtime ha riconosciuto il modello SCPH-1001.
- Il backend SCPH-1001 è presente nel binario.
- Il runtime ha utilizzato il percorso HLE con
  fallback LLE disponibile.

Risultati non ancora confermati:

- Esecuzione completa del boot BIOS.
- Raggiungimento dell'entry point PAL 0x8001E1F4.
- Avvio della schermata iniziale del gioco.
- Compatibilità funzionale del gameplay.

La presenza del backend SCPH-1001 non implica
necessariamente che il BIOS sia stato eseguito
interamente in modalità LLE.

## Prossime verifiche

1. Tracciare il passaggio dal BIOS al codice PAL.
2. Verificare il raggiungimento dell'entry point.
3. Identificare eventuali blocchi nel runtime.
4. Verificare gli overlay e i fallback interprete.
5. Ripetere i test con output video quando disponibile.

## Distribuzione

Non includere nel repository pubblico:

- SCPH1001.BIN o altri dump BIOS.
- Sorgenti generati da BIOS proprietari.
- Cache e file intermedi derivati dal BIOS.

## Documentazione collegata

- docs/pal-italiano/STATUS.md.
- docs/pal-italiano/BUILD.md.
- psxrecomp/bios/SCPH1001.toml.
- psxrecomp/tools/regen_bios.sh.
