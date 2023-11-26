/* Testbench para la celda inicial correspondiente al
   diseño de la red iterativa analizando las palabras 
   de bits A y B de izquierda a derecha */

`timescale 1 ns/10 ps // Definición del timescale

module celdaInicial_tb; 
    /* Rango de tiempo period correspondiente
       a cada combinación binaria de las palabras 
       A y B */
    localparam period = 20;

    /* variable utilizada para for de pruebas */
    integer counter; 

    /* Declaración de bits de prueba correspondientes
       a las palabras A y B */
    reg An_1, Bn_1;

    /* variables de próximo estado P y Q para la
       celda Inicial */
    wire [1:0] prox_estado;      // P = prox_estado[1], Q = prox_estado[0] 

    /* instanciación de celdaInicial como una descripción 
       nombrada  para someterla a pruebas */
    celdaInicial DUT (.Pinit(prox_estado[1]), .Qinit(prox_estado[0]), .An_1(An_1), .Bn_1(Bn_1));

    initial 
        begin
            /* Archivo para la visualización de los
               resultados de las pruebas en gtkwave */
            $dumpfile("celdaInicial_tb.vcd");

            /* descargar en el archivo del dumpfile
               las variables en el módulo celdaInicial_tb */
            $dumpvars(1, celdaInicial_tb); 

            /* Pruebas en base a la tabla de 
               transición de estados */
            An_1 = 0; Bn_1 = 0;     //AB = 00
            #period;
            An_1 = 0; Bn_1 = 1;     //AB = 01
            #period;
            An_1 = 1; Bn_1 = 0;     //AB = 10
            #period;
            An_1 = 1; Bn_1 = 1;     //AB = 11
            #period;
            $finish;
        end
endmodule 