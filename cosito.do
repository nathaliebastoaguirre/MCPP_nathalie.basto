drop if year==2011
drop if year==2012
drop if year==2013
replace year=2015 if year==2014
drop ciudad
gen ciudad=lower(NombreMunicipio)

replace ciudad="bogota" if ciudad=="bogota, d.c."
replace ciudad="santanderdequilichao" if ciudad=="santander de quilichao"
replace ciudad="santamarta" if ciudad=="santa marta"
replace ciudad="tumaco" if ciudad=="san andres de tumaco"
replace ciudad="villadelrosario" if ciudad=="villa del rosario"
replace ciudad="sanandres" if ciudad=="san andres"
replace ciudad="puertoinirida" if ciudad=="puerto inirida"
replace ciudad="sanjosedelguaviare" if ciudad=="san jose del guaviare"
replace ciudad="puertocareño" if ciudad=="puerto carreño"
