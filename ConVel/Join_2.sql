select v.CODIGOVEICULO,
       sum(a.LITROS*a.VALORUNITARIO),
       sum(R.VALORMAT+r.VALORMAO)
from VEICULO v
left join ABASTECIMENTO a
on v.CODIGOVEICULO = a.CODIGOVEICULO
left join REPARO r
on v.CODIGOVEICULO = r.CODIGOVEICULO

group by v.CODIGOVEICULO
