Global Integer Out_9, Out_10
Function main
	
	Motor On
	Power High
		
	Accel 50, 50
	Speed 50
	
	Out_9 = 11
	Out_10 = 12
	
	Do
		If Sw(8) Then
			Call Punto4
		EndIf
	
		If Sw(9) Then
			Call paletizado_z
			On Out_9
		EndIf
		
		If Sw(10) Then
			Call paletizado_s
			On Out_10
		EndIf
	
		If Sw(11) Then
			Call paletizado_e
		EndIf
	
		
	Loop
		
Fend

Function Punto4
	Do
		Go Origen
		Wait 0.5
		Go EjeX
		Wait 0.5
		Go EjeY
		Wait 0.5
		
		Move Origen
		Wait 0.5
		Move EjeY
		Wait 0.5
		Move EjeX
		Wait 0.5
		
		Go Origen :Z(200)
		Go Origen
		Go Origen :Z(200)
		Wait 0.5
		Go EjeX :Z(200)
		Go EjeX
		Go EjeX :Z(200)
		Wait 0.5
		Go EjeY :Z(200)
		Go EjeY :Z(200)
		Go EjeY :Z(200)
		Wait 0.5
	Loop
Fend

Function paletizado_z
	
	Integer i
			
	#define estado_paletizado_z 11
	
	Pallet 1, Origen, EjeX, EjeY, 3, 3
	
	On estado_paletizado_z
	For i = 1 To 9
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	Off estado_paletizado_z
Fend

Function paletizado_s
	
	Integer i
	
	#define estado_paletizado_s 12
	
	Pallet 2, Origen, EjeX, EjeY, 3, 3
	
	On estado_paletizado_s
	
	For i = 1 To 3
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	
	For i = 6 To 4 Step -1
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	
	For i = 7 To 9
		Go Pallet(1, i) :Z(200)
		Go Pallet(1, i)
		Go Pallet(1, i) :Z(200)
	Next
	
	Off estado_paletizado_s
Fend

Function paletizado_e
	Integer i
	Integer j
	
	#define estado_paletizado_e 13
	
	Pallet Outside, 3, Origen, EjeX, EjeY, 3, 3
	
	On estado_paletizado_e
	For i = 1 To 4
		For j = 1 To 4
			Go Pallet(3, i, j) :Z(200)
			Go Pallet(3, i, j)
			Go Pallet(3, i, j) :Z(200)
		Next
	Next
	Off estado_paletizado_e
Fend

