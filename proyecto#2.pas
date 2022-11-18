program tablerolisto;

uses CRT;

var

	sudoku1: array[1..9, 1..9] of string;
	sudoku2: array[1..9, 1..9] of string;
	sudoku3: array[1..9, 1..9] of string;

	sudoku: array[1..9,1..9]of string;
	
	f,c,n:integer;               {variables para recorrer la matriz}   
	salida:string; 
	fila,columna,numero:string;  {variables que guardaran el dato de la fila y la columna que usuario ingresara} 
	fil,col,num,cod:integer;     {variables para la validacion}
	error: integer;
	i, j: integer;
	completado, cont: integer;
	nn: integer;

procedure sudokuAleatorio;
var
	aleatorio: integer;

begin

	randomize();
	
	aleatorio := random(3);
	
	case aleatorio of
	
		0:
		begin
			sudoku := sudoku1;
			nn := 1;
		end;
			
		1:
		begin
			sudoku := sudoku2;
			nn := 2;
		end;
	    
	    2:
		begin
			sudoku := sudoku3;
			nn := 3;
		end;
	end;

end;

procedure tablero;   {tablero con pistas ya declaradad en color verde}
begin
	
    writeln(' ___ ___ ___  ___ ___ ___  ___ ___ ___');
    write('|_');
    textcolor(green);
    write(sudoku[1][1]);
    normvideo;
    writeln('_|_',sudoku[1][2],'_|_',sudoku[1][3],'_||_',sudoku[1][4],'_|_',sudoku[1][5],'_|_',sudoku[1][6],'_||_',sudoku[1][7],'_|_',sudoku[1][8],'_|_',sudoku[1][9],'_|');
    write('|_',sudoku[2][1],'_|_',sudoku[2][2],'_|_',sudoku[2][3],'_||_');
    textcolor(green);
    write(sudoku[2][4]);
    normvideo;
    write('_|_',sudoku[2][5],'_|_',sudoku[2][6],'_||_',sudoku[2][7],'_|_');
    textcolor(green);
    write(sudoku[2][8]);
    normvideo;
    writeln('_|_',sudoku[2][9],'_|');
    write('|_',sudoku[3][1],'_|_');
    textcolor(green);
    write(sudoku[3][2]);
    normvideo;
    write('_|_',sudoku[3][3],'_||_',sudoku[3][4],'_|_',sudoku[3][5],'_|_');
    textcolor(green);
    write(sudoku[3][6]);
    normvideo;
    write('_||_');
    textcolor(green);
    write(sudoku[3][7]);
    normvideo;
    writeln('_|_',sudoku[3][8],'_|_',sudoku[3][9],'_|');
	writeln(' ___ ___ ___  ___ ___ ___  ___ ___ ___');
    write('|_',sudoku[4][1],'_|_',sudoku[4][2],'_|_',sudoku[4][3],'_||_',sudoku[4][4],'_|_',sudoku[4][5],'_|_',sudoku[4][6],'_||_',sudoku[4][7],'_|_');
    textcolor(green);
    write(sudoku[4][8]);
    normvideo;
    writeln('_|_',sudoku[4][9],'_|');
    write('|_',sudoku[5][1],'_|_',sudoku[5][2],'_|_',sudoku[5][3],'_||_',sudoku[5][4],'_|_');
    textcolor(green);
    write(sudoku[5][5]);
    normvideo;
    write('_|_',sudoku[5][6],'_||_');
    textcolor(green);
    write(sudoku[5][7]);
    normvideo;
    writeln('_|_',sudoku[5][8],'_|_',sudoku[5][9],'_|');
    write('|_');
    textcolor(green);
    write(sudoku[6][1]);
    normvideo;
    write('_|_',sudoku[6][2],'_|_');
    textcolor(green);
    write(sudoku[6][3]);
    normvideo;
    write('_||_');
    textcolor(green);
    write(sudoku[6][4]);
    normvideo;
    writeln('_|_',sudoku[6][5],'_|_',sudoku[6][6],'_||_',sudoku[6][7],'_|_',sudoku[6][8],'_|_',sudoku[6][9],'_|');
    writeln(' ___ ___ ___  ___ ___ ___  ___ ___ ___');
    write('|_',sudoku[7][1],'_|_',sudoku[7][2],'_|_',sudoku[7][3],'_||_',sudoku[7][4],'_|_',sudoku[7][5],'_|_');
    textcolor(green);
    write(sudoku[7][6]);
    normvideo;
    write('_||_',sudoku[7][7],'_|_',sudoku[7][8],'_|_');
    textcolor(green);
    write(sudoku[7][9]);
    normvideo;
    writeln('_|');
    write('|_',sudoku[8][1],'_|_',sudoku[8][2],'_|_',sudoku[8][3],'_||_',sudoku[8][4],'_|_',sudoku[8][5],'_|_',sudoku[8][6],'_||_',sudoku[8][7],'_|_');
    textcolor(green);
    write(sudoku[8][8]);
    normvideo;
    writeln('_|_',sudoku[8][9],'_|');
    write('|_',sudoku[9][1],'_|_');
    textcolor(green);
    write(sudoku[9][2]);
    normvideo;
    write('_|_');
    textcolor(green);
    write(sudoku[9][3]);
    normvideo;
    writeln('_||_',sudoku[9][4],'_|_',sudoku[9][5],'_|_',sudoku[9][6],'_||_',sudoku[9][7],'_|_',sudoku[9][8],'_|_',sudoku[9][9],'_|');
    writeln;
  
end;
 
  procedure sudokuResuelto;
 begin
 if nn = 1 then
 begin
 textcolor(blue);
 writeln('       Vuelva a Intentarlo Pronto :)');
 normvideo;
 writeln(' _______________________________________');
 writeln(' _ ___ ___ _  _ ___ ___ _  _ ___ ___ ___');
 writeln('||_1_|_2_|_3_||_9_|_6_|_4_||_7_|_8_|_5_||');
 writeln('||_9_|_4_|_6_||_8_|_7_|_5_||_1_|_3_|_2_||');
 writeln('||_5_|_7_|_8_||_2_|_1_|_3_||_9_|_6_|_4_||');
 writeln(' ___________  ___________  _____________');
 writeln('||_7_|_1_|_9_||_3_|_5_|_6_||_4_|_2_|_8_||');
 writeln('||_2_|_8_|_5_||_4_|_9_|_1_||_6_|_7_|_3_||');
 writeln('||_3_|_6_|_4_||_7_|_8_|_2_||_5_|_9_|_1_||');
 writeln(' ___________  ___________  _____________');
 writeln('||_8_|_5_|_2_||_6_|_4_|_7_||_3_|_1_|_9_||'); 
 writeln('||_4_|_9_|_7_||_1_|_3_|_8_||_2_|_5_|_6_||');
 writeln('||_6_|_3_|_1_||_5_|_2_|_9_||_8_|_4_|_7_||');
 writeln(' _______________________________________');
 end;
 
 if nn = 2 then
 begin
 textcolor(blue);
 writeln('       Vuelva a Intentarlo Pronto :)');
 normvideo;
 writeln(' _______________________________________');
 writeln(' _ ___ ___ _  _ ___ ___ _  _ ___ ___ ___');
 writeln('||_5_|_3_|_4_||_6_|_7_|_8_||_9_|_1_|_2_||');
 writeln('||_6_|_7_|_2_||_1_|_9_|_5_||_3_|_4_|_8_||');
 writeln('||_1_|_9_|_8_||_3_|_4_|_2_||_5_|_6_|_7_||');
 writeln(' ___________  ___________  _____________');
 writeln('||_8_|_5_|_9_||_7_|_6_|_1_||_4_|_2_|_3_||');
 writeln('||_4_|_2_|_6_||_8_|_5_|_3_||_7_|_9_|_1_||');
 writeln('||_7_|_1_|_3_||_9_|_2_|_4_||_8_|_5_|_6_||');
 writeln(' ___________  ___________  _____________');
 writeln('||_9_|_6_|_1_||_5_|_3_|_7_||_2_|_8_|_4_||'); 
 writeln('||_2_|_8_|_7_||_4_|_1_|_9_||_6_|_3_|_5_||');
 writeln('||_3_|_4_|_5_||_2_|_8_|_6_||_1_|_7_|_9_||');
 writeln(' _______________________________________');
 end;
 
 if nn = 3 then
 begin
 textcolor(blue);
 writeln('       Vuelva a Intentarlo Pronto :)');
 normvideo;
 writeln(' _______________________________________');
 writeln(' _ ___ ___ _  _ ___ ___ _  _ ___ ___ ___');
 writeln('||_5_|_8_|_4_||_3_|_7_|_9_||_2_|_1_|_6_||');
 writeln('||_3_|_9_|_7_||_1_|_2_|_6_||_5_|_4_|_8_||');
 writeln('||_6_|_2_|_1_||_8_|_5_|_4_||_3_|_7_|_9_||');
 writeln(' ___________  ___________  _____________');
 writeln('||_2_|_5_|_3_||_4_|_6_|_7_||_9_|_8_|_1_||');
 writeln('||_8_|_1_|_6_||_9_|_3_|_5_||_7_|_2_|_4_||');
 writeln('||_4_|_7_|_9_||_2_|_1_|_8_||_6_|_3_|_5_||');
 writeln(' ___________  ___________  _____________');
 writeln('||_1_|_6_|_8_||_7_|_9_|_2_||_4_|_5_|_3_||'); 
 writeln('||_9_|_3_|_2_||_5_|_4_|_1_||_8_|_6_|_7_||');
 writeln('||_7_|_4_|_5_||_6_|_8_|_3_||_1_|_9_|_2_||');
 writeln(' _______________________________________');
 end;
end;
 
begin
        
    {Para inicializar el arreglo en vacío}
	for f := 1 to 9 do
		for c := 1 to 9 do
			sudoku[f][c] := '_';
			
	for f := 1 to 9 do
		for c := 1 to 9 do
			sudoku1[f][c] := '_';
			
	for f := 1 to 9 do
		for c := 1 to 9 do
			sudoku2[f][c] := '_';
			
	for f := 1 to 9 do
		for c := 1 to 9 do
			sudoku3[f][c] := '_';
	
	{asignacion de las pistas para 1}
	sudoku1[1][1]:='1';
	sudoku1[2][4]:='8';
	sudoku1[2][8]:='3';
	sudoku1[6][3]:='4';
	sudoku1[6][4]:='7';
	sudoku1[4][8]:='2';
	sudoku1[9][2]:='3';
	sudoku1[7][6]:='7';
	sudoku1[8][8]:='5';
	sudoku1[5][7]:='6';
	sudoku1[7][9]:='9';
	sudoku1[3][7]:='9';
	sudoku1[9][3]:='1';
	sudoku1[6][1]:='3';
	sudoku1[3][6]:='3';
	sudoku1[3][2]:='7';
	sudoku1[5][5]:='9';
	
	{asignacion de las pistas para 2}
	sudoku2[1][1]:='5';
	sudoku2[2][4]:='1';
	sudoku2[2][8]:='4';
	sudoku2[6][3]:='3';
	sudoku2[6][4]:='9';
	sudoku2[4][8]:='2';
	sudoku2[9][2]:='4';
	sudoku2[7][6]:='7';
	sudoku2[8][8]:='3';
	sudoku2[5][7]:='7';
	sudoku2[7][9]:='4';
	sudoku2[3][7]:='5';
	sudoku2[9][3]:='5';
	sudoku2[6][1]:='7';
	sudoku2[3][6]:='2';
	sudoku2[3][2]:='9';
	sudoku2[5][5]:='5';
	
	{asignacion de las pistas para 3}
	sudoku3[1][1]:='5';
	sudoku3[2][4]:='1';
	sudoku3[2][8]:='4';
	sudoku3[6][3]:='9';
	sudoku3[6][4]:='2';
	sudoku3[4][8]:='8';
	sudoku3[9][2]:='4';
	sudoku3[7][6]:='2';
	sudoku3[8][8]:='6';
	sudoku3[5][7]:='7';
	sudoku3[7][9]:='3';
	sudoku3[3][7]:='3';
	sudoku3[9][3]:='5';
	sudoku3[6][1]:='4';
	sudoku3[3][6]:='4';
	sudoku3[3][2]:='2';
	sudoku3[5][5]:='3';
	cont := 0;
	
	sudokuAleatorio;
	
	repeat
	
		error := 0;  {para inicializar}
	
		clrscr;
		tablero;
		textcolor(blue);
		writeln('casilla completado:',cont);
		normvideo;
		writeln;
		cont:=0;
		writeln('Indique la fila:');
	
		repeat
		
			readln(fila);
			val(fila, fil, cod);
			
			if (fil<1) or (fil>9) or (cod <> 0) then 
				writeln('Fila invalida');
				
		until ((fil >= 1) and (fil <= 9) and (cod = 0));
      
		writeln('Indique la columna:');
		repeat 
		
			readln(columna);
			val(columna, col, cod);
			
			if(col<1) or (col>9) or (cod <> 0) then 
				writeln('Columna invalida');
			
		until ((col >= 1) and (col <= 9) and (cod = 0));
      
		writeln('Indique el numero:');
		repeat 
			 
			readln(numero);
			val(numero, num, cod);
			
			{El caracter _ es para borrar el numero en caso de haberte equivocado}
			if ((num < 1) or (num > 9) or (cod <> 0)) and (numero <> '_') then
				writeln('Numero invalido');
				
			{para fijar las pistas}	
			if ((fil = 1) and (col = 1)) or
			   ((fil = 2) and (col = 4)) or
			   ((fil = 2) and (col = 8)) or
			   ((fil = 6) and (col = 3)) or 
			   ((fil = 6) and (col = 4)) or
			   ((fil = 4) and (col = 8)) or 
			   ((fil = 9) and (col = 2)) or
			   ((fil = 7) and (col = 6)) or
			   ((fil = 8) and (col = 8)) or
			   ((fil = 5) and (col = 7)) or
			   ((fil = 7) and (col = 9)) or
			   ((fil = 3) and (col = 7)) or    
			   ((fil = 9) and (col = 3)) or
			   ((fil = 6) and (col = 1)) or
			   ((fil = 3) and (col = 6)) or
			   ((fil = 3) and (col = 2)) or   
			   ((fil = 5) and (col = 5)) then
				error := 1;
		{para que el numero no se repita ni en filas ni en columnas}		
			for i := 1 to 9 do
			begin
				if (sudoku[i][col] = numero) and (numero <> '_') and (i <> fil) then
					error := 2;
			end;
			
			for i := 1 to 9 do
			begin
				if (sudoku[fil][i] = numero) and (numero <> '_') and (i <> col) then
					error := 2;
			end;
			
			{para que el numero no se repita en los cuadrantes}
			{Primer cuadrante}
			if ((fil >= 1) and (fil <= 3)) and ((col >= 1) and (col <= 3)) then
			begin
				for i := 1 to 3 do
				begin
					for j := 1 to 3 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{segundo  cuadrante}
			if ((fil >= 4) and (fil <= 6)) and ((col >= 1) and (col <= 3)) then
			begin
				for i := 4 to 6 do
				begin
					for j := 1 to 3 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{tercer cuadrante}
			if ((fil >= 7) and (fil <= 9)) and ((col >= 1) and (col <= 3)) then
			begin
				for i := 7 to 9 do
				begin
					for j := 1 to 3 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{cuarto cuadrante}
			if ((fil >= 1) and (fil <= 3)) and ((col >= 4) and (col <= 6)) then
			begin
				for i := 1 to 3 do
				begin
					for j := 4 to 6 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{quinto cuadrante}
			if ((fil >= 4) and (fil <= 6)) and ((col >= 4) and (col <= 6)) then
			begin
				for i := 4 to 6 do
				begin
					for j := 4 to 6 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{sexto cuadrante}
			if ((fil >= 7) and (fil <= 9)) and ((col >= 4) and (col <= 6)) then
			begin
				for i := 7 to 9 do
				begin
					for j := 4 to 6 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{septimo cuadrante}
			if ((fil >= 1) and (fil <= 3)) and ((col >= 7) and (col <= 9)) then
			begin
				for i := 1 to 3 do
				begin
					for j := 7 to 9 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{octavo cuadrante}
			if ((fil >= 4) and (fil <= 6)) and ((col >= 7) and (col <= 9)) then
			begin
				for i := 4 to 6 do
				begin
					for j := 7 to 9 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
			
			{noveno cuadrante}
			if ((fil >= 7) and (fil <= 9)) and ((col >= 7) and (col <= 9)) then
			begin
				for i := 7 to 9 do
				begin
					for j := 7 to 9 do
					begin
						if (sudoku[i][j] = numero) and (numero <> '_') and ((i <> fil) and (j <> col)) then
							error := 2;
					end;
				end;
			end;
				
        until ((num >= 1) and (num <= 9)) or (numero = '_'); 
            
        {marca error cuando intentas modificar una de las pistas}
        if (error = 1) then
			writeln('Este casilla no se puede modificar');
		
		{marca error cuando el numero se repite en filas, columnas o cuadrantes}
		if (error = 2) then
		begin
			textcolor(red);
			writeln('Error');
			normvideo;
		end;
            {para asignar el numero ingresado en el arreglo}
        if (error = 0) then
        begin
			if ((num >= 1) and (num <= 9)) or (numero = '_') 
				then sudoku[fil][col] := numero;
		end;
			
		
		
		writeln('presiona s para salir');
	
		readln(salida);
		
	
		{para ir contando las casillas llenas}
		for i := 1 to 9 do
		begin
			for j := 1 to 9 do
			begin
				if (sudoku[i][j] <> '_') then
				begin
					cont := cont + 1;
				end;
			end;
		end;
	
	until (salida = 's') or (cont = 81);
	sudokuResuelto();
	
 
	if (cont = 81) then
	begin
	    textcolor(blue);
		writeln('Felicidades, ha completado el sudoku ');
		normvideo;
		
		completado := 1;
  
     end;
 
end.
