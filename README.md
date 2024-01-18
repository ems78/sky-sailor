# SkySailor - Rezervacija Aviokarti

## Opis Projekta

Projekt je rađen za kolegij *Uvod u programsko inženjerstvo* na Prirodoslovno-matematičkom fakultetu. Ova web aplikacija omogućava korisnicima pregled i rezervaciju aviokarata. Projekt je razvijen koristeći JavaScript, Node.js i React.

## Funkcionalnosti

- **Prijava i Registracija:** Omogućava korisnicima stvaranje računa i prijavu na sustav, te administratorima prijavu.
- **Pretraga Letova:** Brza pretraga dostupnih letova prema različitim kriterijima poput polazišta, destinacije i datuma.
- **Rezervacija Karata:** Jednostavan proces rezervacije karata nakon odabira željenog leta.
- ~~**Administrativne Funkcionalnosti:** Omogućuje administratorima dodavanje i ažuriranje informacija o letovima.~~

## Postavljanje Projekta

1. **Preuzimanje Koda:**
   ```bash
   git clone https://github.com/ems78/sky-sailor.git
   cd sky-sailor
   ```

2. **Instalacija MySQL:**

   Instalirajte MySQL i MySQL Workbench na svoj sustav. Posjetite MySQL web stranicu za upute o instalaciji.

3. **Inicijalizacija Baze Podataka:**
   
   Otvorite MySQL Workbench i prijavite se s vlastitim korisničkim imenom i lozinkom.
   Nakon uspješne prijave, otovrite skriptu `init.sql` iz direktorija projekta (`app/sql/`).
   Izvršite upit kako biste stvorili potrebne tablice i popunili ih početnim podacima.
   Nakon izvršenja skripte, vaša baza podataka trebala bi biti inicijalizirana.

4. **Spremanje Procedura u Bazu Podataka:**

   U MySql Workbench otvorite skripte za kreaciju procedura koje su u projektu u direktoriju `app/sql/` i izvršite ih.

5. **Instalacija Zavisnosti:**

   Otvorite projekt u VSCode (ili drugom IDE po vašem izboru). Dok ste pozicionirani u root direktoriju projekta:
   ```bash
   npm install
   cd client/
   npm install
   ```

6. **Konfiguracija .env Datoteke:**
   
   Nakon instalacije dependencija, stvorite .env datoteku u glavnom direktoriju projekta. Definirajte sljedeće varijable s odgovarajućim vrijednostima, prema postavkama koje ste odabrali prilikom instalacije MySQL-a:

   ```
   DB_HOST=localhost
   DB_USER=<user>
   DB_PASS=<password>
   DB_NAME=aviokompanija
   PORT=<port>
   ```

7. **Pokretanje Express Servera:**
   
   Dok ste pozicionirani u root direktoriju
   ```bash
   npm start
   ```

8. **Pokretanje React Aplikacije:**
    
    Otvorite drugi terminal
    ```bash
    cd client/
    npm run dev
    ```

Aplikacija će biti dostupna na `http://localhost:<port>`, port koji ste definirali u `.env`.

## Tehnologije Korištene

- JavaScript
- Express
- Node.js
- React
- MySQL

## Autori

- [Ema Andrea Drašković](https://github.com/ems78)
- [Nediljka Kujundžić](https://github.com/neda1010)
- [Mia Jadrić](https://github.com/mjadric)
- [Tomislav Jurič](https://github.com/tomisljuric)
- [Franko Cvrlje](https://github.com/FrankNOTSinatra)

## Licenca

Ovaj projekt je licenciran pod MIT licencom - pogledajte [LICENSE.md](LICENSE.md) za detalje.

## Napomena

Baza ima malo podataka, a za testiranje pretrage letova možete pretražiti letove na relaciji Berlin - Munchen na datum 22.2.2024.
