:- dynamic clima /6.
:- dynamic clima_sem_umidade /5.
:- dynamic tipoclima /2.
:- dynamic tempo/2.
:- dynamic condicao_clima_para_lugar /2.

clima(t,95,18,25,12,outubro,2011,macapa).
clima(s,67,12,22,12,outubro,2013,belem).
clima(n,56,13,20,14,setembro,2012,aracaju).
clima(c,78,16,26,abril,2010,salvador).
clima(e,68,19,27,janeiro,2009,curitiba).

clima_sem_umidade(n,18,25,12,outubro,2013,macapa).
clima_sem_umidade(c,12,22,12,outubro,2013,belem).
clima_sem_umidade(t,13,20,14,outubro,2013,aracaju).
clima_sem_umidade(s,16,26,outubro,2013,salvador).
clima_sem_umidade(e,19,27,outubro,2013,curitiba).

condicao_clima_para_lugar(t,macapa).
condicao_clima_para_lugar(s,belem).
condicao_clima_para_lugar(n,aracaju).
condicao_clima_para_lugar(c,salvador).
condicao_clima_para_lugar(e,curitiba).

tempo(bom,sol).
tempo(ruim,chuva).
tempo(ameno,nublado).
tempo(fechado,encoberto).
tempo(tempestuoso,tempestade).

tipoclima(n,nublado).
tipoclima(c,chuva).
tipoclima(t,tempestade).
tipoclima(s,sol).
tipoclima(e,encoberto).

consulta_temp(Cidade,Tempmin,Tempmax):- clima_sem_umidade(_,Tempmin,Tempmax,_,_,_,Cidade).

consulta_clima(Cidade,Clima):- tipoclima(N,Clima),clima_sem_umidade(N,_,_,_,_,_,Cidade).

consulta_clima_geral(Cidade,Clima,Dia):- clima_sem_umidade(N,_,_,Dia,Mes,Ano,Cidade),tipoclima(N,Clima).

consulta_como_esta_tempo_num_lugar(Cidade,CaracteristicaClima):- condicao_clima_para_lugar(Sigla,Cidade),
								tipoclima(Sigla,Tempo),
								tempo(CaracteristicaClima,Tempo).
   

