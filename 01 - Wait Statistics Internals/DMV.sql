

-- Devuelve una fila por cada sesión autenticada en SQL Server.
SELECT * FROM sys.dm_exec_sessions
WHERE is_user_process = 1
ORDER BY cpu_time DESC

-- Devuelve información sobre cada solicitud que se ejecuta en SQL Server.
SELECT * FROM sys.dm_exec_requests

-- Devuelve una fila por cada tarea activa en la instancia de SQL Server. Una tarea es la unidad básica de ejecución en SQL Server.
SELECT * FROM sys.dm_os_tasks

-- Devuelve una lista de todos los subprocesos del sistema operativo SQL Server que se están ejecutando en el proceso de SQL Server.
SELECT * FROM sys.dm_os_threads

-- Devuelve una fila por cada trabajador del sistema.
SELECT * FROM sys.dm_os_workers

--	Devuelve una fila por programador en SQL Server donde cada programador está asignado a un determinado procesador. 
SELECT * FROM sys.dm_os_schedulers

-- consulta personalizada para ver que se esta ejecutando en tiempo real
SELECT s.session_id,s.login_time,s.host_name,s.login_name,s.original_login_name
	,r.status,r.command,r.wait_type,qt.text
FROM sys.dm_exec_sessions s
INNER JOIN sys.dm_exec_requests r ON s.session_id=r.session_id
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) qt
WHERE s.is_user_process = 1


-- Para ver informacion de DMVs para eestadisticas de espera, como en el libro
SELECT
r.session_id AS 'Session ID',
r.command AS 'Type of Request',
qt.[text] AS 'Query Text',
t.task_address AS 'Task Address',
t.task_state AS 'Task State',
w.worker_address AS 'Worker Address',
w.[state] AS 'Worker State',
s.scheduler_address AS 'Scheduler Address',
s.[status] AS 'Scheduler State'
FROM sys.dm_exec_requests r
CROSS APPLY sys.dm_exec_sql_text(r.sql_handle) qt
INNER JOIN sys.dm_os_tasks t
ON r.task_address = t.task_address
INNER JOIN sys.dm_os_workers w
ON t.worker_address = w.worker_address
INNER JOIN sys.dm_os_schedulers s
ON w.scheduler_address = s.scheduler_address
