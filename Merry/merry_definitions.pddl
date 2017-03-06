;(define )
(define (domain merry_definitions)
	(:requirements :adl)
	(:predicates
		
		(klucz ?kolor ?id) ;kolor/id
		(drzwi ?kolor ?skad ?dokad) ;kolor/kierunek/id
		(pokoj ?id ?klucz) ;id
		(merryKlucz ?kolorKlucza ?idKlucza) ;czy ma klucz o id "y" kolor/id
		(merryPozycja ?id) ;id pokoju w ktorym jest
	)
	
	(:action wez_klucz
		:parameters (?pozycjaMerry ?jakiKlucz ?jakiKolorKlucza)
		:precondition 
		(and
			(merryPozycja ?pozycjaMerry)
			(pokoj ?pozycjaMerry ?jakiKlucz)
			(klucz ?jakiKolorKlucza ?jakiKlucz)
		)
		:effect
		(and
			(merryKlucz ?jakiKolorKlucza ?jakiKlucz)
			(not (pokoj ?pozycjaMerry ?jakiKlucz))
		)
	)
	
	(:action przejdz
		:parameters (?skad ?dokad ?klucz ?kolorKlucza)
		:precondition 
		(and
			(merryPozycja ?skad)
			(merryKlucz ?kolorKlucza ?klucz)
			(drzwi ?kolorKlucza ?skad ?dokad)
		)
		:effect
		(and
			(merryPozycja ?dokad)
			(not (merryPozycja ?skad))
			(not (merryKlucz ?kolorKlucza ?klucz))
		)
	)
)