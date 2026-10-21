#!/bin/sh
# Rigenera i sorgenti PAL di TOMBI! tramite psxrecomp.
# Richiede una copia locale e legittima dell'eseguibile.

set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)

TOOL="$ROOT/psxrecomp/recompiler/build/psxrecomp-game"
CONFIG="$ROOT/pal_ita/game.toml"
EXE="$ROOT/pal_ita/disc/SCES_013.30"

if [ ! -f "$TOOL" ]; then
    echo "ERRORE: generatore non trovato: $TOOL" >&2
    echo "Compilare prima psxrecomp/recompiler." >&2
    exit 1
fi

if [ ! -f "$CONFIG" ]; then
    echo "ERRORE: configurazione PAL mancante: $CONFIG" >&2
    exit 1
fi

if [ ! -f "$EXE" ]; then
    echo "ERRORE: eseguibile PAL mancante: $EXE" >&2
    echo "Estrarlo dalla propria copia del gioco." >&2
    exit 1
fi

echo "=== TOMBI! PAL — Rigenerazione ==="
echo "Configurazione: $CONFIG"
echo "Eseguibile: SCES_013.30"
echo "Output: pal_ita/generated/"
echo

cd "$ROOT"
"$TOOL" --config "$CONFIG"

echo
echo "Rigenerazione completata."
echo "Per compilare:"
echo "cmake -S pal_ita -B pal_ita/build"
echo "cmake --build pal_ita/build --target psx-runtime --parallel 2"
