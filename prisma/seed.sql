-- Dutch Municipalities and Cities
-- Source: CBS (Statistics Netherlands)

INSERT INTO "DutchPlace" (id, name, slug, type, province, municipality, population) VALUES
-- Noord-Holland
(gen_random_uuid(), 'Amsterdam', 'amsterdam', 'city', 'Noord-Holland', 'Amsterdam', 872680),
(gen_random_uuid(), 'Haarlem', 'haarlem', 'city', 'Noord-Holland', 'Haarlem', 162543),
(gen_random_uuid(), 'Zaanstad', 'zaanstad', 'city', 'Noord-Holland', 'Zaanstad', 156789),
(gen_random_uuid(), 'Haarlemmermeer', 'haarlemmermeer', 'city', 'Noord-Holland', 'Haarlemmermeer', 154235),
(gen_random_uuid(), 'Alkmaar', 'alkmaar', 'city', 'Noord-Holland', 'Alkmaar', 108558),
(gen_random_uuid(), 'Purmerend', 'purmerend', 'city', 'Noord-Holland', 'Purmerend', 80896),
(gen_random_uuid(), 'Hilversum', 'hilversum', 'city', 'Noord-Holland', 'Hilversum', 90510),
(gen_random_uuid(), 'Amstelveen', 'amstelveen', 'city', 'Noord-Holland', 'Amstelveen', 90385),
(gen_random_uuid(), 'Hoorn', 'hoorn', 'city', 'Noord-Holland', 'Hoorn', 73614),
(gen_random_uuid(), 'Zaandam', 'zaandam', 'town', 'Noord-Holland', 'Zaanstad', 78000),

-- Zuid-Holland
(gen_random_uuid(), 'Rotterdam', 'rotterdam', 'city', 'Zuid-Holland', 'Rotterdam', 644618),
(gen_random_uuid(), 'Den Haag', 'den-haag', 'city', 'Zuid-Holland', 'Den Haag', 545838),
(gen_random_uuid(), 'Zoetermeer', 'zoetermeer', 'city', 'Zuid-Holland', 'Zoetermeer', 125267),
(gen_random_uuid(), 'Delft', 'delft', 'city', 'Zuid-Holland', 'Delft', 103588),
(gen_random_uuid(), 'Leiden', 'leiden', 'city', 'Zuid-Holland', 'Leiden', 124899),
(gen_random_uuid(), 'Dordrecht', 'dordrecht', 'city', 'Zuid-Holland', 'Dordrecht', 119115),
(gen_random_uuid(), 'Alphen aan den Rijn', 'alphen-aan-den-rijn', 'city', 'Zuid-Holland', 'Alphen aan den Rijn', 111986),
(gen_random_uuid(), 'Westland', 'westland', 'city', 'Zuid-Holland', 'Westland', 110986),
(gen_random_uuid(), 'Spijkenisse', 'spijkenisse', 'town', 'Zuid-Holland', 'Nissewaard', 72000),
(gen_random_uuid(), 'Schiedam', 'schiedam', 'city', 'Zuid-Holland', 'Schiedam', 80123),

-- Utrecht
(gen_random_uuid(), 'Utrecht', 'utrecht', 'city', 'Utrecht', 'Utrecht', 357179),
(gen_random_uuid(), 'Amersfoort', 'amersfoort', 'city', 'Utrecht', 'Amersfoort', 157279),
(gen_random_uuid(), 'Nieuwegein', 'nieuwegein', 'city', 'Utrecht', 'Nieuwegein', 62982),
(gen_random_uuid(), 'Veenendaal', 'veenendaal', 'city', 'Utrecht', 'Veenendaal', 65812),
(gen_random_uuid(), 'Zeist', 'zeist', 'city', 'Utrecht', 'Zeist', 65123),
(gen_random_uuid(), 'Houten', 'houten', 'city', 'Utrecht', 'Houten', 50123),

-- Noord-Brabant
(gen_random_uuid(), 'Eindhoven', 'eindhoven', 'city', 'Noord-Brabant', 'Eindhoven', 238326),
(gen_random_uuid(), 'Tilburg', 'tilburg', 'city', 'Noord-Brabant', 'Tilburg', 199613),
(gen_random_uuid(), 'Breda', 'breda', 'city', 'Noord-Brabant', 'Breda', 184126),
(gen_random_uuid(), 's-Hertogenbosch', 's-hertogenbosch', 'city', 'Noord-Brabant', 's-Hertogenbosch', 155849),
(gen_random_uuid(), 'Helmond', 'helmond', 'city', 'Noord-Brabant', 'Helmond', 92910),
(gen_random_uuid(), 'Oss', 'oss', 'city', 'Noord-Brabant', 'Oss', 92391),
(gen_random_uuid(), 'Roosendaal', 'roosendaal', 'city', 'Noord-Brabant', 'Roosendaal', 77123),

-- Gelderland
(gen_random_uuid(), 'Nijmegen', 'nijmegen', 'city', 'Gelderland', 'Nijmegen', 177818),
(gen_random_uuid(), 'Apeldoorn', 'apeldoorn', 'city', 'Gelderland', 'Apeldoorn', 164781),
(gen_random_uuid(), 'Arnhem', 'arnhem', 'city', 'Gelderland', 'Arnhem', 164424),
(gen_random_uuid(), 'Ede', 'ede', 'city', 'Gelderland', 'Ede', 118123),
(gen_random_uuid(), 'Doetinchem', 'doetinchem', 'city', 'Gelderland', 'Doetinchem', 58123),

-- Overijssel
(gen_random_uuid(), 'Enschede', 'enschede', 'city', 'Overijssel', 'Enschede', 160398),
(gen_random_uuid(), 'Zwolle', 'zwolle', 'city', 'Overijssel', 'Zwolle', 129840),
(gen_random_uuid(), 'Deventer', 'deventer', 'city', 'Overijssel', 'Deventer', 101123),
(gen_random_uuid(), 'Hengelo', 'hengelo', 'city', 'Overijssel', 'Hengelo', 81123),
(gen_random_uuid(), 'Almelo', 'almelo', 'city', 'Overijssel', 'Almelo', 73123),

-- Groningen
(gen_random_uuid(), 'Groningen', 'groningen', 'city', 'Groningen', 'Groningen', 233273),
(gen_random_uuid(), 'Assen', 'assen', 'city', 'Groningen', 'Assen', 68123),

-- Limburg
(gen_random_uuid(), 'Maastricht', 'maastricht', 'city', 'Limburg', 'Maastricht', 121565),
(gen_random_uuid(), 'Venlo', 'venlo', 'city', 'Limburg', 'Venlo', 101889),
(gen_random_uuid(), 'Sittard-Geleen', 'sittard-geleen', 'city', 'Limburg', 'Sittard-Geleen', 92123),
(gen_random_uuid(), 'Heerlen', 'heerlen', 'city', 'Limburg', 'Heerlen', 87123),

-- Friesland
(gen_random_uuid(), 'Leeuwarden', 'leeuwarden', 'city', 'Friesland', 'Leeuwarden', 124481),
(gen_random_uuid(), 'Drachten', 'drachten', 'town', 'Friesland', 'Smallingerland', 55123),

-- Drenthe
(gen_random_uuid(), 'Emmen', 'emmen', 'city', 'Drenthe', 'Emmen', 107024),
(gen_random_uuid(), 'Hoogeveen', 'hoogeveen', 'city', 'Drenthe', 'Hoogeveen', 55123),

-- Zeeland
(gen_random_uuid(), 'Middelburg', 'middelburg', 'city', 'Zeeland', 'Middelburg', 49123),
(gen_random_uuid(), 'Vlissingen', 'vlissingen', 'city', 'Zeeland', 'Vlissingen', 44123),

-- Flevoland
(gen_random_uuid(), 'Almere', 'almere', 'city', 'Flevoland', 'Almere', 214715),
(gen_random_uuid(), 'Lelystad', 'lelystad', 'city', 'Flevoland', 'Lelystad', 81123);
