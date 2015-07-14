Category.destroy_all
System.destroy_all
Priority.destroy_all
Status.destroy_all
# popula a tabela systems ------------------------------------------------------
sys1 = System.create({description: "Sistema 1"})
sys2 = System.create({description: "Sistema 2"})
sys3 = System.create({description: "Sistema 3"})
sys4 = System.create({description: "Sistema 4"})
# popula a tabela categories  --------------------------------------------------
Category.create({description: "Dúvida de funcionamento", system_id: sys1.id})
Category.create({description: "Comportamento estranho", system_id: sys1.id})
Category.create({description: "Mensagem de erro", system_id: sys1.id})
Category.create({description: "Outros", system_id: sys1.id})

Category.create({description: "Solicitar Criação de usuário", system_id: sys2.id})
Category.create({description: "Solicitar customização", system_id: sys2.id})
Category.create({description: "Dúvida de funcionamento", system_id: sys2.id})
Category.create({description: "Comportamento estranho", system_id: sys2.id})
Category.create({description: "Mensagem de erro", system_id: sys2.id})
Category.create({description: "Outros", system_id: sys2.id})

Category.create({description: "Dúvida de funcionamento", system_id: sys3.id})
Category.create({description: "Comportamento estranho", system_id: sys3.id})
Category.create({description: "Mensagem de erro", system_id: sys3.id})
Category.create({description: "Outros", system_id: sys3.id})

Category.create({description: "Dúvida de funcionamento", system_id: sys4.id})
Category.create({description: "Comportamento estranho", system_id: sys4.id})
Category.create({description: "Mensagem de erro", system_id: sys4.id})
Category.create({description: "Outros", system_id: sys4.id})

# popula a tabela priorities ---------------------------------------------------
Priority.create({description: "Impacto nas atividades sem saida de contorno"})
Priority.create({description: "Impacto nas atividades com saida de contorno"})
Priority.create({description: "Sem impacto em produção"})

# popula a tabela statuses -----------------------------------------------------

Status.create({description: "Aberto"})
Status.create({description: "Em análise"})
Status.create({description: "Aguardando resposta do usuário"})
Status.create({description: "Cancelado"})
Status.create({description: "Encerrado"})
