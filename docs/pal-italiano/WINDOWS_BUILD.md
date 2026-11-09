# Build Windows PAL — verifica del 22 ottobre 2026

## Risultati verificati

La build incrementale Release di TOMBI__Recompiled_PAL.exe è riuscita su Windows x64 con MSVC 19.51, CMake 4.3.1, Ninja 1.13.2 e SDL3 3.4.10. Il linking includeva OpenBIOS e il backend SCPH-1001 generato localmente.

Il test headless di 30 secondi ha riconosciuto il disco SCES-01330, impostato il timing PAL a 50 Hz e riportato l'avvio del BIOS da 0xBFC00000, con SCPH-1001 e HLE con fallback LLE. Il test è terminato al timeout previsto. Le prove con finestra hanno confermato la creazione della finestra e, nel percorso OpenGL, l'inizializzazione del contesto. La cattura video è scaduta.

## Dipendenze locali

La build usava modifiche locali di psxrecomp in runtime/src/main.cpp per la portata di uno static_assert e in runtime/src/gpu_gl_renderer.c per gli atomici C11. Usava inoltre modifiche locali a pal_ita/CMakeLists.txt per abilitare gli atomici C11 nei sorgenti interessati da MSVC e a pal_ita/game.toml per risolvere i percorsi relativi.

La riproducibilità da checkout pulito con il pin pubblico del motore non è stata verificata. I sorgenti generati da materiali proprietari sono rimasti locali.

## Limiti della sessione

Le prove descritte qui non hanno attestato il raggiungimento dell'entry point del gioco, il menu, l'audio, l'input o il gameplay. Mancava la toolchain degli overlay e il runtime segnalava fallback all'interprete. Il generatore BIOS riportava una funzione interpretata per load delay e una saltata per opcode non supportato. La compatibilità Linux dopo le correzioni e la build USA non sono state verificate in questa sessione.
