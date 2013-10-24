:- dynamic clima /6.
:- dynamic clima_sem_umidade /5.
:- dynamic tipoclima /2.

clima(n,95,18,25,12,outubro,2013,macapa).
clima(c,67,12,22,12,outubro,2013,belem).
clima(t,56,13,20,14,outubro,2013,aracaju).
clima(g,78,16,26,outubro,2013,salvador).
clima(e,68,19,27,outubro,2013,curitiba).

clima_sem_umidade(n,18,25,12,outubro,2013,macapa).
clima_sem_umidade(c,12,22,12,outubro,2013,belem).
clima_sem_umidade(t,13,20,14,outubro,2013,aracaju).
clima_sem_umidade(g,16,26,outubro,2013,salvador).
clima_sem_umidade(e,19,27,outubro,2013,curitiba).

tipoclima(n,nublado).
tipoclima(c,chuva).
tipoclima(t,tempestade).
tipoclima(g,geada).
tipoclima(e,encoberto).

consulta_temp(Cidade,Tempmin,Tempmax):-clima_sem_umidade(_,Tempmin,Tempmax,_,_,_,Cidade).

consulta_clima(Cidade,Clima):- tipoclima(N,Clima),clima_sem_umidade(N,_,_,_,_,_,Cidade).

consulta_clima_geral(Cidade,Clima,Dia):- clima_sem_umidade(N,_,_,Dia,Mes,Ano,Cidade),tipoclima(N,Clima).

