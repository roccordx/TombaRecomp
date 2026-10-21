# TOMBI! PAL Italiano — Guida alla compilazione

Ultimo aggiornamento: 21 ottobre 2026.

## Stato della procedura

La generazione del codice PAL e la compilazione Linux sono
state completate nell'ambiente di sviluppo QNAP.

La procedura non è ancora stata verificata su un checkout
Git pulito. Il submodule psxrecomp contiene modifiche locali
che richiedono un audit separato.

## Ambiente utilizzato

- NAS QNAP con Container Station.
- Container Docker: tombi-build.
- Sistema nel container: Debian 12.
- Utente di compilazione: dev.
- Repository: /workspace/TombaRecomp.
- Framework: psxrecomp (submodule Git).
- Build PAL: pal_ita/build.
- Eseguibile: pal_ita/build/TOMBI__Recompiled_PAL.

## Recupero dei sorgenti

    git clone --recurse-submodules \
      --branch feature/tombi-pal-italiano \
      https://github.com/roccordx/TombaRecomp.git

    cd TombaRecomp
    git submodule update --init --recursive

Questi comandi recuperano i sorgenti pubblicati.
Non includono ROM, BIOS proprietari o codice generato.

## Materiali locali necessari

La configurazione PAL utilizza:

- pal_ita/disc/SCES_013.30
- pal_ita/game.toml
- pal_ita/seeds/ghidra_funcs.txt

L'eseguibile SCES_013.30 deve essere estratto
legittimamente dalla propria copia del gioco.

Non pubblicarlo nel repository.

## Compilazione del ricompilatore

Dalla radice del repository:

    cmake -S psxrecomp/recompiler \
      -B psxrecomp/recompiler/build \
      -G Ninja \
      -DCMAKE_BUILD_TYPE=Release

    cmake --build psxrecomp/recompiler/build

Il generatore del gioco si trova in:

    psxrecomp/recompiler/build/psxrecomp-game

## Generazione del codice PAL

Dalla radice del repository:

    psxrecomp/recompiler/build/psxrecomp-game \
      --config pal_ita/game.toml

I sorgenti generati sono salvati in:

    pal_ita/generated/

Questa directory contiene codice derivato dal gioco
originale e non deve essere pubblicata.

## Generazione del backend BIOS SCPH-1001

Il backend richiede un dump BIOS locale e verificato.

Nel framework è disponibile:

    psxrecomp/tools/regen_bios.sh

La generazione utilizzata nell'ambiente di sviluppo è:

    cd psxrecomp
    tools/regen_bios.sh --config bios/SCPH1001.toml

Il profilo SCPH1001.toml identifica il BIOS atteso.

Il dump proprietario non deve essere incluso in Git.
Anche il codice generato da tale dump rimane locale.

## Configurazione della build PAL

Dalla radice del repository:

    cmake -S pal_ita \
      -B pal_ita/build \
      -G Ninja \
      -DCMAKE_BUILD_TYPE=Release

La configurazione del 21 ottobre 2026 ha confermato:

    BIOS backends linked: OpenBIOS;SCPH1001

La presenza del backend SCPH-1001 dipende dalla
generazione preventiva dei relativi sorgenti.

## Compilazione del runtime

    cmake --build pal_ita/build \
      --target psx-runtime \
      --parallel 2

Risultato verificato il 21 ottobre 2026:

- Exit code: 0.
- Eseguibile: TOMBI__Recompiled_PAL.
- Dimensione: circa 22 MB.
- Backend OpenBIOS collegato.
- Backend SCPH-1001 collegato.

## Verifica dei backend collegati

    nm -a pal_ita/build/TOMBI__Recompiled_PAL \
      | grep -E \
      "OpenBIOS_psx_bios_backend|SCPH1001_psx_bios_backend"

Entrambi i simboli sono stati verificati nella build.

## Test headless

Il runtime è stato avviato con:

- Configurazione PAL SCES-01330.
- Disco europeo Rev 1.
- BIOS locale SCPH-1001.
- Renderer software headless.
- Timeout di 30 secondi.

Il log ha confermato:

    image=SCPH-1001
    bios_backend=HLE (LLE fallback)
    bios_boot=HLE (shell skipped)

Il processo è terminato con exit code 124 per timeout.

Non è ancora stato verificato il raggiungimento
dell'entry point del gioco 0x8001E1F4.

## Limitazioni attuali

- La build Linux funziona nell'ambiente QNAP utilizzato.
- La riproducibilità su checkout pulito non è verificata.
- Le modifiche locali a psxrecomp devono essere analizzate.
- La toolchain TCC degli overlay non risulta disponibile
  nella directory prevista dal runtime.
- Il gameplay PAL non è ancora verificato.

## Materiali esclusi da Git

Non pubblicare:

- Dump ROM e immagini disco.
- Eseguibili originali del gioco.
- BIOS retail PlayStation.
- Codice generato dal gioco o dal BIOS proprietario.
- File di salvataggio.
- Cache, catture e artefatti di compilazione.

## Riferimenti

- README.md nella radice del repository.
- docs/pal-italiano/STATUS.md.
- psxrecomp/docs/BUILDING.md.
- psxrecomp/tools/regen_bios.sh.
