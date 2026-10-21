# AGENTS.md — TOMBI! PAL Italiano

## Scopo

Questo repository è un fork di mstan/TombaRecomp.

Il branch feature/tombi-pal-italiano sviluppa il supporto
alla versione europea PAL di TOMBI!, con particolare
attenzione alla lingua italiana.

L'obiettivo è ottenere una ricompilazione funzionante
senza compromettere il supporto alla versione USA.

## Ambiente principale

- NAS QNAP con Docker Container Station.
- Container: tombi-build.
- Sistema operativo del container: Debian 12.
- Utente: dev.
- Workspace: /workspace/TombaRecomp.
- Branch: feature/tombi-pal-italiano.

Non assumere che i percorsi QNAP siano validi
su Windows o su altre installazioni Linux.

## Struttura del progetto

- README.md: documentazione principale.
- game.toml: configurazione originale USA.
- game-pal.toml: configurazione PAL alternativa.
- pal_ita/game.toml: configurazione PAL utilizzata.
- pal_ita/CMakeLists.txt: build PAL.
- pal_ita/seeds/: seed del ricompilatore.
- pal_ita/generated/: codice PAL generato, locale.
- pal_ita/disc/: eseguibile originale PAL, locale.
- pal_ita/build/: artefatti di compilazione, locali.
- docs/pal-italiano/: documentazione tecnica PAL.
- psxrecomp/: submodule del framework.
- recomp-ui/: submodule dell'interfaccia.

## Stato verificato al 21 ottobre 2026

- Generazione del codice C PAL completata.
- Compilazione Linux del runtime completata.
- Binario TOMBI__Recompiled_PAL prodotto.
- Backend OpenBIOS e SCPH-1001 collegati.
- BIOS SCPH-1001 riconosciuto dal runtime.
- Disco PAL SCES-01330 riconosciuto.
- Test headless eseguito per 30 secondi.
- Test terminato con exit code 124 per timeout.

Non è ancora stato dimostrato il raggiungimento
dell'entry point PAL 0x8001E1F4.

Non dichiarare il gioco giocabile senza test reali.

## Parametri PAL

- Serial: SCES-01330.
- Eseguibile: SCES_013.30.
- Load address: 0x80010000.
- Entry point: 0x8001E1F4.
- Text size: 0x0009E800.
- Stack base: 0x801FFFF0.

## Regole di sviluppo

1. Conservare il supporto alla versione USA.
2. Preferire modifiche isolate nella directory pal_ita.
3. Non sovrascrivere configurazioni USA senza necessità.
4. Non eseguire reset, clean o checkout distruttivi.
5. Verificare git status prima e dopo ogni modifica.
6. Non effettuare commit o push senza autorizzazione.
7. Non modificare automaticamente i riferimenti submodule.
8. Documentare i risultati verificati e le limitazioni.
9. Distinguere compilazione riuscita da gameplay funzionante.
10. Utilizzare test incrementali e registrare gli esiti.

## Regole sui submodule

psxrecomp contiene modifiche locali ancora da analizzare.

Non eseguire:

    git reset --hard
    git clean -fd
    git submodule update --force

Non pubblicare automaticamente le modifiche locali
del framework e non effettuare push verso il repository
upstream senza autorizzazione esplicita.

Prima di modificare un submodule, esaminare il suo stato.

## Materiali proprietari

Non includere in commit, patch pubbliche o allegati:

- ROM e immagini disco PlayStation.
- Eseguibili originali del gioco.
- Dump BIOS proprietari.
- Codice generato dalla ROM o dal BIOS proprietario.
- Memory card e salvataggi.
- Cache e catture derivate dal gioco.

Non utilizzare git add indiscriminatamente.

Preparare sempre una lista esplicita dei file da pubblicare.

## Generazione e compilazione

Generatore:

    psxrecomp/recompiler/build/psxrecomp-game

Configurazione PAL:

    pal_ita/game.toml

Build:

    cmake -S pal_ita -B pal_ita/build

    cmake --build pal_ita/build \
      --target psx-runtime --parallel 2

Questi comandi sono stati utilizzati nell'ambiente
di sviluppo, ma la riproducibilità su checkout pulito
deve ancora essere verificata.

## Verifiche prima di un commit

- Controllare git status.
- Controllare git diff.
- Controllare git diff --check.
- Verificare la lista dei file staged.
- Verificare che non siano presenti dati proprietari.
- Verificare che i submodule non cambino accidentalmente.
- Aggiornare STATUS.md e CHANGELOG.md se necessario.

## Documentazione da consultare

- docs/pal-italiano/STATUS.md
- docs/pal-italiano/BUILD.md
- docs/pal-italiano/BIOS.md
- docs/pal-italiano/CHANGELOG.md

## Prossime priorità

1. Preparare lo script di rigenerazione PAL.
2. Verificare il passaggio dal BIOS al codice del gioco.
3. Analizzare il fallback degli overlay.
4. Verificare la toolchain TCC.
5. Testare intro, menu, testi italiani e gameplay.
6. Rendere la build riproducibile da checkout pulito.
