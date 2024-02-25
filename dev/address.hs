--Based on Get Programming with Haskell, Will Kurt.

data  Location = WatSETU | CarSETU| WexSETU
type Name = (String, String)

office :: Location -> String
office WatSETU = "SETU (Waterford Campus), Cork Road, Waterford, Ireland, X91 K0EK."
office CarSETU= "SETU (Carlow Campus), Dublin Road, Carlow, Ireland, R93 V960."
office WexSETU = "SETU (Wexford Campus), Summerhill Rd, Townparks, Wexford, Y35 KA07."

watOffice :: Name -> String
watOffice name =
  if lastName < "L"
    then nametext ++ ",  Lower Floor, Main Building  " ++ office WatSETU
    else nametext ++ ",  Top Floor, Main Building  " ++ office WatSETU
  where
    nametext = fst name ++ "  " ++ snd name
    lastName = snd name

carOffice :: Name -> String
carOffice name =   nametext ++ ",  " ++ office CarSETU
  where
    nametext = fst name ++ "  " ++ snd name

wexOffice :: Name -> String
wexOffice name =   nametext ++ ",  " ++ office WexSETU
  where
    nametext = snd name ++ ", " ++ fst name


getLocation :: String -> (Name -> String)
getLocation location   = case location  of 
                "Wat(SETU)" -> watOffice 
                "Car(SETU)" -> carOffice
                "Wex(SETU)" -> wexOffice 
                _     -> (\name -> fst name ++ "  " ++ snd name ++ ": Address unknown" ) 
                
addressLetter :: Name -> String -> String
addressLetter name location = getLocation location name 