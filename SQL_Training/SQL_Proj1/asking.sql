#Quais ordens de serviços estão abertas?
  
SELECT os_id, status, data_emissao
FROM OrdemServico
WHERE status = 'ABERTA';

#Quais clientes possuem carros anteriores a 2017?

SELECT c.nome, v.modelo, v.ano
FROM Cliente c
JOIN Veiculo v ON c.cliente_id = v.cliente_id
WHERE v.ano < 2017;

#Quanto custou cada ordem de serviço?

SELECT 
    os.os_id,
    SUM(
        COALESCE(oss.valor_unitario * oss.quantidade, 0) +
        COALESCE(osp.valor_unitario * osp.quantidade, 0)
    ) AS total_os
FROM OrdemServico os
LEFT JOIN OS_Servico oss ON oss.os_id = os.os_id
LEFT JOIN OS_Peca osp ON osp.os_id = os.os_id
GROUP BY os.os_id;

#Quais ordens de serviço custou mais de quinhetos reais?

SELECT os.os_id,
       SUM(
         oss.valor_unitario * oss.quantidade +
         osp.valor_unitario * osp.quantidade
       ) AS total
FROM OrdemServico os
JOIN OS_Servico oss ON os.os_id = oss.os_id
JOIN OS_Peca osp ON os.os_id = osp.os_id
GROUP BY os.os_id
HAVING total > 500;

#Quem são os clientes que mais gastaram na oficina?

SELECT 
    c.nome,
    SUM(
        COALESCE(oss.valor_unitario * oss.quantidade, 0) +
        COALESCE(osp.valor_unitario * osp.quantidade, 0)
    ) AS total_gasto
FROM Cliente c
JOIN Veiculo v ON c.cliente_id = v.cliente_id
JOIN OrdemServico os ON os.veiculo_id = v.veiculo_id
LEFT JOIN OS_Servico oss ON oss.os_id = os.os_id
LEFT JOIN OS_Peca osp ON osp.os_id = os.os_id
GROUP BY c.cliente_id
ORDER BY total_gasto DESC;


