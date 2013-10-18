:- dynamic clima /5.
:- dynamic tipoclima /2.

clima(n,18,25,12102013,sao paulo).
clima(n,12,22,12102013,portoalegre).
clima(pp,13,20,14102013,riobranco).
clima(cm,16,26,15102013,salvador).
clima(cn,19,27,16102013,curitiba).

tipoclima(n,nublado).
tipoclima(pp,pancadadechuva).

consulta_temp(Cidade,Tempmin,Tempmax):-clima(_,Tempmin,Tempmax,_,Cidade).

consulta_clima(Cidade,Clima):- tipoclima(N,Clima),clima(N,_,_,_,Cidade).

consulta_clima_geral(Cidade,Clima,Dia):- clima(N,_,_,Dia,Cidade),tipoclima(N,Clima).
