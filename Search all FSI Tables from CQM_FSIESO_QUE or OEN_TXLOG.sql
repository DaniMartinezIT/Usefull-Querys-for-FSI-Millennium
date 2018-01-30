
select 
	fq.queue_id, fq.create_dt_tm, estadoFQ = fq.process_status_flag, 
	fq.contributor_refnum, 
	fq.class, fq.type, fq.subtype,
	trigger_FTR = ftr.trigger_id, ftr.create_dt_tm, estadoFTR = ftr.process_status_flag, 
	ftr.listener_id, ftr.l_r_trigger_status_text,
	oq.queue_id, estadoOC = oq.process_status_flag, oq.type, oq.subtype, oq.contributor_refnum,
	trigger_OTR = otr.trigger_id, estadoOTR = otr.process_status_flag, otr.process_start_dt_tm, otr.process_stop_dt_tm,
	op.interfaceid, op.proc_name, op.service,
	ot.msg_date, ot.msg_time, ot.msgid, ot.msg_len
from CQM_FSIESO_QUE fq, CQM_FSIESO_TR_1 ftr, 
	CQM_OENINTERFACE_QUE oq, CQM_OENINTERFACE_TR_1 otr, 
	CQM_listener_config lc, oen_procinfo op, oen_txlog ot
plan fq where fq.queue_id = 664914443;662452966
join ftr where ftr.queue_id = outerjoin(fq.queue_id)
join oq where oq.queue_id = outerjoin(cnvtint(substring(5,15,ftr.l_r_trigger_status_text)))
join otr where otr.queue_id = outerjoin(oq.queue_id)
join lc where lc.listener_id = outerjoin(otr.listener_id)
join op where op.interfaceid = outerjoin(cnvtint(lc.listener_alias))
join ot where ot.tx_key = outerjoin(substring(7,27,otr.l_r_trigger_status_text))
order by fq.queue_id, ftr.trigger_id, oq.queue_id, otr.trigger_id
with format(date,"DD/MM/YYYY HH:MM:SS"), maxrec = 50000, time = 300	


select 
	fq.queue_id, fq.create_dt_tm, estadoFQ = fq.process_status_flag, 
	fq.contributor_refnum, 
	fq.class, fq.type, fq.subtype,
	trigger_FTR = ftr.trigger_id, ftr.create_dt_tm, estadoFTR = ftr.process_status_flag, 
	ftr.listener_id, ftr.l_r_trigger_status_text,
	oq.queue_id, estadoOC = oq.process_status_flag, oq.type, oq.subtype, oq.contributor_refnum,
	trigger_OTR = otr.trigger_id, estadoOTR = otr.process_status_flag, otr.process_start_dt_tm, otr.process_stop_dt_tm,
	op.interfaceid, op.proc_name, op.service,
	ot.msg_date, ot.msg_time, ot.msgid, ot.msg_len
from oen_txlog ot, oen_procinfo op,
	CQM_listener_config lc, 
	CQM_OENINTERFACE_TR_1 otr, CQM_OENINTERFACE_QUE oq,
	CQM_FSIESO_TR_1 ftr, CQM_FSIESO_QUE fq
plan ot where ot.msgid = '010380000011360'
join otr where substring(7,27,otr.l_r_trigger_status_text) = outerjoin(ot.tx_key)
join lc where lc.listener_id = outerjoin(otr.listener_id)
join op where op.interfaceid = outerjoin(cnvtint(lc.listener_alias))
join oq where oq.queue_id = outerjoin(otr.queue_id)
join ftr where cnvtint(substring(5,15,ftr.l_r_trigger_status_text)) = outerjoin(oq.queue_id)
join fq where fq.queue_id = outerjoin(ftr.queue_id)
order by fq.queue_id, ftr.trigger_id, oq.queue_id, otr.trigger_id
with format(date,"DD/MM/YYYY HH:MM:SS"), maxrec = 50000, time = 300	

select 
	fq.queue_id, fq.create_dt_tm, estado1 = fq.process_status_flag, 
	;fq.contributor_refnum, 
	fq.class, fq.type, fq.subtype,
	ftr.trigger_id, ftr.create_dt_tm, estado2 = ftr.process_status_flag, ftr.listener_id,
	oq.queue_id, estado3 = oq.process_status_flag, oq.type, oq.subtype, ;oq.contributor_refnum,
	otr.trigger_id, estado4 = otr.process_status_flag, otr.process_start_dt_tm, otr.process_stop_dt_tm,
	op.interfaceid, op.proc_name, op.service
from CQM_FSIESO_QUE fq, CQM_FSIESO_TR_1 ftr, 
	CQM_OENINTERFACE_QUE oq, CQM_OENINTERFACE_TR_1 otr, 
	CQM_listener_config lc, oen_procinfo op
plan fq where fq.queue_id = 662452966;662452966
join ftr where ftr.queue_id = outerjoin(fq.queue_id)
join oq where oq.queue_id = outerjoin(cnvtint(substring(5,15,ftr.l_r_trigger_status_text)))
join otr where otr.queue_id = outerjoin(oq.queue_id)
join lc where lc.listener_id = outerjoin(otr.listener_id)
join op where op.interfaceid = outerjoin(cnvtint(lc.listener_alias))
with format(date,"DD/MM/YYYY HH:MM:SS"), maxrec = 50000, time = 300	
