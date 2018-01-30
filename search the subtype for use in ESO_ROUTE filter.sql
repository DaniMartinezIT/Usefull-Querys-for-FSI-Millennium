;Obtener el subtipo para añadir a ESO_ROUTE
select activity_type_cd=uar_get_code_display(oc.activity_type_cd)
, activity_subtype_cd=uar_get_code_display(oc.activity_subtype_cd)
, cqm_subtype=cv.definition
, catalog_type_cd=uar_get_code_display(oc.catalog_type_cd)
, oc.primary_mnemonic
from order_catalog oc, code_value cv
where oc.activity_subtype_cd = cv.code_value
	and cv.code_set = 5801 ;Activity subtype
	and oc.primary_mnemonic like '*GAB CAR ERG*'