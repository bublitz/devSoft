select v.CODIGOVEICULO,
       max(q.FINAL)-min(q.INICIO)     as KmRodados,
       sum(a.LITROS)                  as QtdComb,
       sum(m.LITROS)                  as QtdOleo,
       sum(a.LITROS*a.VALORUNITARIO)  as ValAbast,
       sum(m.LITROS*m.VALOR)          as ValManut,
       sum(r.VALORMAT+r.VALORMAO)     as ValReparo

from VEICULO v

left join QUILOMETRAGEM q
on v.CODIGOVEICULO = q.CODIGOVEICULO

left join ABASTECIMENTO a
on v.CODIGOVEICULO = a.CODIGOVEICULO

left join MANUTENCAO m
on v.CODIGOVEICULO = a.CODIGOVEICULO

left join REPARO r
on v.CODIGOVEICULO = r.CODIGOVEICULO

group by v.CODIGOVEICULO

