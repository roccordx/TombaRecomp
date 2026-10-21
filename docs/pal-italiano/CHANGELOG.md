# TOMBI! PAL Italiano — Registro delle modifiche

Questo documento registra lo sviluppo del supporto
alla versione europea PAL di TOMBI!.

Il progetto è sperimentale: una compilazione riuscita
non implica che il gioco sia già funzionante.

## 21 ottobre 2026 — Compilazione PAL su Linux

### Completato

- Preparazione dell'ambiente Docker Debian 12 su QNAP.
- Allineamento del repository e dei submodule Git.
- Identificazione dell'eseguibile PAL SCES_013.30.
- Configurazione dei parametri di caricamento PAL.
- Preparazione dei seed per il ricompilatore.
- Generazione del codice C della versione PAL.
- Compilazione del ricompilatore psxrecomp-game.
- Generazione del backend BIOS SCPH-1001.
- Collegamento dei backend OpenBIOS e SCPH-1001.
- Compilazione del runtime PAL con exit code 0.
- Produzione del binario TOMBI__Recompiled_PAL.
- Verifica dei simboli dei backend BIOS nel binario.
- Esecuzione di test headless con BIOS SCPH-1001.
- Riconoscimento del disco PAL SCES-01330.
- Rilevamento del timing PAL a 50 Hz.

### Risultati dei test

- Caricamento del BIOS locale confermato.
- Selezione del modello SCPH-1001 confermata.
- Runtime avviato in modalità HLE con fallback LLE.
- Test headless terminato dopo 30 secondi.
- Exit code 124 dovuto al timeout di test.

### Limitazioni

- Non è stato dimostrato il raggiungimento
  dell'entry point PAL 0x8001E1F4.
- Intro, menu, audio e gameplay non sono verificati.
- La toolchain TCC degli overlay non risulta
  disponibile nel percorso previsto dal runtime.
- Il submodule psxrecomp contiene modifiche locali
  ancora da classificare.
- La riproducibilità da checkout pulito non è verificata.

### Documentazione

- Creazione di STATUS.md.
- Creazione di BUILD.md.
- Creazione di BIOS.md.
- Creazione di questo CHANGELOG.md.

## Supporto PAL — Configurazione iniziale

### Aggiunto

- Directory pal_ita dedicata alla versione europea.
- Configurazione pal_ita/game.toml.
- Configurazione game-pal.toml.
- Configurazione CMake pal_ita/CMakeLists.txt.
- Seed pal_ita/seeds/ghidra_funcs.txt.
- Separazione dei file PAL dagli artefatti USA.

### Identificazione eseguibile

- Serial: SCES-01330.
- Eseguibile: SCES_013.30.
- Load address: 0x80010000.
- Entry point: 0x8001E1F4.
- Text size: 0x0009E800.
- Stack base: 0x801FFFF0.

## GitHub e documentazione

### Completato

- Utilizzo del branch feature/tombi-pal-italiano.
- Aggiornamento del README con intestazione TOMBI!.
- Introduzione della documentazione italiana.
- Sincronizzazione del branch con il repository remoto.

### Da completare

- Aggiornamento dello stato della build nel README.
- Script di rigenerazione dedicato alla versione PAL.
- Istruzioni persistenti AGENTS.md per Codex.
- Protezione esplicita della directory dei salvataggi.
- Audit e gestione delle modifiche locali a psxrecomp.
- Pubblicazione della nuova documentazione.

## Prossime attività tecniche

1. Rendere riproducibile la generazione PAL.
2. Verificare il passaggio BIOS -> codice del gioco.
3. Analizzare la gestione degli overlay.
4. Verificare il funzionamento della toolchain TCC.
5. Eseguire test video, audio e controller.
6. Verificare intro, menu e testi italiani.
7. Validare il gameplay e i salvataggi.

## Regole di pubblicazione

Non includere nel repository pubblico:

- ROM, immagini disco o eseguibili originali.
- Dump BIOS proprietari.
- Codice generato da ROM o BIOS proprietari.
- Memory card, salvataggi e cache di esecuzione.
- Artefatti di compilazione.

Le modifiche ai submodule devono essere gestite
separatamente e non pubblicate accidentalmente.
