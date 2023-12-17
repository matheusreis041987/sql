select * from paciente where doenca like'%diabetes%' or doenca like '%resfriado%'

select * from paciente where doenca in ('Sarampo', 'Resfriado');

select * from paciente where doenca not in ('Sarampo', 'Resfriado'); -- o Not faz o oposto