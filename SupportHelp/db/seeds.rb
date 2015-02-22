# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

System.destroy_all
Priority.destroy_all
Subject.destroy_all
Status.destroy_all

System.create([
  {is_active: true, name: 'Sistema 1'},
  {is_active: false, name: 'Sistema 2'},
  {is_active: true, name: 'Sistema 3'},
  {is_active: true, name: 'Sistema 4'}
])

Subject.create([
  {is_active: true, title: '', system_id: -1},
  {is_active: true, title: 'falha no cadastro de registro de pagamentos', system_id: System.where(name: 'Sistema 1' ).take.id},
  {is_active: false, title: 'Excluida', system_id: System.where(name: 'Sistema 1' ).take.id},
  {is_active: true, title: 'Erro de exportação', system_id: System.where(name: 'Sistema 1' ).take.id},
  {is_active: true, title: 'Sistema fora do ar', system_id: System.where(name: 'Sistema 1' ).take.id},
  {is_active: true, title: 'Perda de senha do usuário', system_id: System.where(name: 'Sistema 1' ).take.id},
  {is_active: true, title: 'Parametrização do sistema', system_id: System.where(name: 'Sistema 1' ).take.id},
  {is_active: true, title: 'Solicitação de customização', system_id: System.where(name: 'Sistema 1' ).take.id},
  {is_active: true, title: 'Outros', system_id: System.where(name: 'Sistema 1' ).take.id}
])

Subject.create([
  {is_active: false, title: 'Excluida', system_id: System.where(name: 'Sistema 3' ).take.id},
  {is_active: true, title: 'Erro de exportação', system_id: System.where(name: 'Sistema 3' ).take.id},
  {is_active: true, title: 'Sistema fora do ar', system_id: System.where(name: 'Sistema 3' ).take.id},
  {is_active: true, title: 'Parametrização do sistema', system_id: System.where(name: 'Sistema 4' ).take.id},
  {is_active: true, title: 'Solicitação de customização', system_id: System.where(name: 'Sistema 4' ).take.id},
  {is_active: true, title: 'Outros', system_id: System.where(name: 'Sistema 4' ).take.id}
])

Priority.create([
  {is_active: true, description: 'Baixa'},
  {is_active: false, description: 'Excluida'},
  {is_active: true, description: 'Normal'},
  {is_active: true, description: 'Alta'},
  {is_active: true, description: 'Urgente (impacto direto e não contornável)'}
])

Status.create([
  {is_active: true, name: 'Aberto'},
  {is_active: true, name: 'Concluido'},
  {is_active: true, name: 'Reaberto pelo usuário'},
  {is_active: true, name: 'Fechado por falta de interação'}
])
