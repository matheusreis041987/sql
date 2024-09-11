-- comando readfile para buscar um arquivo no c: e incluir no BD. Só funciona no prompt


-- inclusão de fotos
sqlite> update tadega2 set foto = readfile("C:\Users\Matheus\Desktop\MBA - ANALISE E PROJETO DE SISTEMAS\PROJETO DE BANCO DE DADOS\LABPBD\SISADEGA\Doc\IMAGENS\PinotNoir.png") where num = 2;

-- iunclusão de imagens
sqlite>  update tadega2 set apres = readfile("C:\Users\Matheus\Desktop\MBA - ANALISE E PROJETO DE SISTEMAS\PROJETO DE BANCO DE DADOS\LABPBD\SISADEGA\Doc\IMAGENS\vinhosAP.txt");
