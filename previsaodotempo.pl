:- dynamic clima /6.
:- dynamic clima_sem_umidade /5.
:- dynamic tipoclima /2.
:- dynamic tempo/2.
:- dynamic condicao_clima_para_lugar /2.
:- dynamic temperatura_minima/1.
:- dynamic temperatura_maxima/1.

clima(t,95,18,24,12,macapa).
clima(s,67,12,22,13,belem).
clima(n,56,10,20,14,aracaju).
clima(c,78,16,26,15,salvador).
clima(e,68,14,18,16,curitiba).

clima_sem_umidade(n,18,24,12,macapa).
clima_sem_umidade(c,12,22,13,belem).
clima_sem_umidade(t,10,20,14,aracaju).
clima_sem_umidade(s,16,26,15,salvador).
clima_sem_umidade(e,14,18,16,curitiba).

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

temperatura_minima(18).
temperatura_minima(12).
temperatura_minima(10).
temperatura_minima(16).
temperatura_minima(14).

temperatura_maxima(24).
temperatura_maxima(22).
temperatura_maxima(20).
temperatura_maxima(26).
temperatura_maxima(18).

consulta_temp(Cidade,Tempmin,Tempmax):- clima_sem_umidade(_,Tempmin,Tempmax,_,Cidade).

consulta_clima(Cidade,Clima):- tipoclima(N,Clima),clima_sem_umidade(N,_,_,_,Cidade).

consulta_clima_geral(Cidade,Clima,Dia):- clima_sem_umidade(N,_,_,Dia,Cidade),tipoclima(N,Clima).

consulta_como_esta_tempo_num_lugar(Cidade,CaracteristicaClima):- condicao_clima_para_lugar(Sigla,Cidade),
								tipoclima(Sigla,Tempo),
								tempo(CaracteristicaClima,Tempo).
   
verifica_umidade(Umidade,Cidade,boa):- clima(_,Umidade,_,_,_,Cidade),Umidade>=50.

verifica_umidade(Umidade,Cidade,prejudicial):- clima(_,Umidade,_,_,_,Cidade),Umidade<50.

media_temperatura_cidade(Cidade,Media):- Media is ( ( (temperatura_maxima(Tempmax) ) + (temperatura_minima(Tempmin) ) )/2), 
					clima_sem_umidade(_,Tempmin,Tempmax,_,Cidade).

consulta_umidade_cidade(Cidade,Umidade):- clima(_,95,_,_,_,Cidade).


