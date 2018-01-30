select
	MES = month(o.create_dt_tm),
	DIA = day(o.create_dt_tm),
	HORA = hour(o.create_dt_tm),
	PROC = substring(2,4,o.TX_KEY),
	op.proc_name,
	o.eventid,
	cnvtint(count(o.TX_KEY))
from oen_txlog o, oen_procinfo op
where o.create_dt_tm between cnvtdatetime(curdate-6,000000) and cnvtdatetime(curdate+1,000000)
	and o.msg_text like "*|ADT^*"
	and cnvtint(o.interfaceid) = op.interfaceid 
	and cnvtint(o.interfaceid) = 1065 ;Patwin
group by month(o.create_dt_tm), day(o.create_dt_tm), hour(o.create_dt_tm), substring(2,4,o.TX_KEY), op.proc_name, o.eventid
order by month(o.create_dt_tm), day(o.create_dt_tm), hour(o.create_dt_tm)