## Wait Statistics Internals

### SQLOS

- Es una capa de aplicacion entre los componentes SQL Server y el sistema operativo

- Proporciona un control mas refinado de la asignacion de recursos

- Centraliza la asignacionde recursos para proporcionar una gestion y contabilidad mas eficientes

- El SQLOS se comporta muy parecido a un sistema operativo, resume el concepto de gestion de memoria, E/S, programacion, etc.

- El motor SQL sigue siendo un proceso como cualquier otro que se ejecuta en un servidor windows. No tiene ningun privilegio especial.

- SQLOS no omite Windows, simplemente gestiona los recursos dentro del espacio de proceso de SQL Server de manera eficiente para SQL Server

- El sistema operativo Windows utiliza un enfoque de programacion preventiva. El sistema puede optar por interrumpir un proceso cuando un proceso con mayor prioridad necesite tiempor de procesador.

- SQLOS utiliza un enfoque cooperativo asegurandose que los procesos de Windows no puedan interrumpit los procesos de SQLOS


