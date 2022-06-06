select v.CODIGOVEICULO, v.DESCRICAO, v.PLACA,
       max(q.FINAL)-min(q.INICIO)     as KmRodados,
       sum(a.LITROS)                  as QtdComb,
       sum(m.LITROS)                  as QtdOleo,
       sum(a.LITROS*a.VALORUNITARIO)  as ValAbast,
       sum(m.LITROS*m.VALOR)          as ValManut,
       sum(r.VALORMAT+r.VALORMAO)     as ValReparo

from VEICULO v

left join QUILOMETRAGEM q
   on v.CODIGOVEICULO = q.CODIGOVEICULO
  and extract(year from q.DATA) = 2001
  and extract(month from q.DATA) = 10

left join ABASTECIMENTO a
   on v.CODIGOVEICULO = a.CODIGOVEICULO
  and extract(year from a.DATA) = 2001
  and extract(month from a.DATA) = 10

left join MANUTENCAO m
   on v.CODIGOVEICULO = m.CODIGOVEICULO
  and extract(year from m.DATA) = 2001
  and extract(month from m.DATA) = 10

left join REPARO r
   on v.CODIGOVEICULO = r.CODIGOVEICULO
  and extract(year from r.DATA) = 2001
  and extract(month from r.DATA) = 10

group by v.CODIGOVEICULO, v.DESCRICAO, v.PLACA
order by v.CODIGOVEICULO


