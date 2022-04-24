(* ::Package:: *)

pn(* ::Package:: *)

(* Dateinamen *)
ursprungsDatei = "Originalbild.jpg";
grauwertBild = "Grauwertbild.pgm";
bild3x3 = "Filter3x3.pgm";
bild5x5 = "Filter5x5.pgm";
bild7x7 = "Filter7x7.pgm";

(* RGB Bild laden und in Grauwertbild konvertieren *)
bild = ColorConvert[Import[ursprungsDatei],"Grayscale"];

(* Grauwertbild exportieren *)
Export[grauwertBild, bild];
Print["Grauwertbild wurde exportiert als ", grauwertBild];

(* Auslesen des Grauwertbildes in einem 2D-Array mit Option : "Byte", Wertebereich 0 - 255 *)
bildArray = ImageData[bild,"Byte"];


(* 3X3 *)

(* Anlegen der Datei f\[UDoubleDot]r 3x3 Filter, Output stream intialisieren *)
bild3 = OpenWrite[bild3x3];

(* Neue Datei mit Dimensionen vom Ursprungsbild intialisieren *)
WriteString[bild3,"P2 \n",Last[Dimensions[bildArray]]," ", First[Dimensions[bildArray]],"\n255\n"];

(* Geschachtelte For-Schleife f\[UDoubleDot]r 2D-Array mit Bildaten. i <= Zeilenanzahl, j <= Spaltenanzahl *)
For[i=1, i<= First[Dimensions[bildArray]],i++, 
	For[j=1, j<=Last[Dimensions[bildArray]],j++,
		If [ i+2 <= First[Dimensions[bildArray]] && j+2 <= Last[Dimensions[bildArray] && i >= 1 && j >= 1],
			(* Nachbarwerte zusammenrechnen, durchschnitt berechnen und runden *)
			WriteString[bild3,Round[Total[Total[Take[bildArray,{i,i+2},{j,j+2}]]]/9]," "]
		,
			(* Pixel von i bis j *)
			WriteString[bild3,Round[Total[Total[Take[bildArray,{i},{j}]]]]," "];
		]
	]
]

Print["3x3 Bild wurde exportiert als ",bild3x3];

Close[bild3];


(* 5X5 *)
					
(* Anlegen der Datei f\[UDoubleDot]r 5x5 Filter, Output stream intialisieren *)
bild5 = OpenWrite[bild5x5];

(* Neue Datei mit Dimensionen vom Ursprungsbild intialisieren *)
WriteString[bild5,"P2 \n",Last[Dimensions[bildArray]]," ", First[Dimensions[bildArray]],"\n255\n"];

(* Geschachtelte For-Schleife f\[UDoubleDot]r 2D-Array mit Bildaten. i <= Zeilenanzahl, j <= Spaltenanzahl *)
For[i=1, i<= First[Dimensions[bildArray]],i++, 
	For[j=1, j<=Last[Dimensions[bildArray]],j++,
		If [ i+4 <= First[Dimensions[bildArray]] && j+4 <= Last[Dimensions[bildArray] && i >= 1 && j >= 1],
			(* Nachbarwerte zusammenrechnen, durchschnitt berechnen und runden *)
			WriteString[bild5,Round[Total[Total[Take[bildArray,{i,i+4},{j,j+4}]]]/25]," "]
		,
			(* Pixel von i bis j *)
			WriteString[bild5,Round[Total[Total[Take[bildArray,{i},{j}]]]]," "];
		]
	]
]

Print["5x5 Bild wurde exportiert als ",bild5x5];

Close[bild5];


(* 7X7 *)
		
(* Anlegen der Datei f\[UDoubleDot]r 7x7 Filter, Output stream intialisieren *)
bild7 = OpenWrite[bild7x7];

(* Neue Datei mit Dimensionen vom Ursprungsbild intialisieren *)
WriteString[bild7,"P2 \n",Last[Dimensions[bildArray]]," ", First[Dimensions[bildArray]],"\n255\n"];

(* Geschachtelte For-Schleife f\[UDoubleDot]r 2D-Array mit Bildaten. i <= Zeilenanzahl, j <= Spaltenanzahl *)
For[i=1, i<= First[Dimensions[bildArray]],i++, 
	For[j=1, j<=Last[Dimensions[bildArray]],j++,
		If [ i+6 <= First[Dimensions[bildArray]] && j+6 <= Last[Dimensions[bildArray] && i >= 1 && j >= 1],
			(* Nachbarwerte zusammenrechnen, durchschnitt berechnen und runden *)
			WriteString[bild7,Round[Total[Total[Take[bildArray,{i,i+6},{j,j+6}]]]/49]," "]
		,
			(* Pixel von i bis j *)
			WriteString[bild7,Round[Total[Total[Take[bildArray,{i},{j}]]]]," "];
		]
	]
]

Print["7x7 Bild wurde exportiert als ",bild7x7];

Close[bild7];
