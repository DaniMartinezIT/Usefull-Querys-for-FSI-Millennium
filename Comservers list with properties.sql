;Interfaces
select * from oen_procinfo order by proc_name

;IP y puerto de outbound
Select op.interfaceid, op.proc_name, per.name, per.value, per2.name, per2.value
from oen_procinfo op, oen_personality per, oen_personality per2
plan op where op.proc_desc != "125*"
	;and op.interfaceid = 1038
	and op.service = "Outbound"
	and not (op.proc_name like "*ESI*")
join per where per.interfaceid = op.interfaceid
	and per.name = "REMOTEHOST"
join per2 where per2.interfaceid = op.interfaceid
	and per2.name = "PORT"
order by op.proc_name

;Propiedades de las interfaces
Select op.proc_name, op.proc_desc, op.interfaceid, per2.name, per2.value
from oen_procinfo op, oen_personality per, oen_personality per2
plan op
where op.proc_desc != "125*"
;and op.service = "Inbound"
join per
where per.interfaceid = op.interfaceid
and per.name = "PROTOCOL"
and per.value = "TCPIP"
join per2 where per2.interfaceid = op.interfaceid
and per2.name = "ENABLE_TCPKEEPALIVE"
and per2.value != "1"
order by op.proc_name