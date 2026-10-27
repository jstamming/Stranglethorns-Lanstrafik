STRANGLETHORNS LÄNSTRAFIK — ONLINE MVP
======================================

Detta är en online-ansluten version med e-post/lösenordsinloggning, gemensam guilddata och realtime-uppdateringar via Supabase. Den kan inte synka förrän du kopplat den till ett eget Supabase-projekt. Jag kan inte skapa projektet eller dina hemliga uppgifter åt dig.

STARTA LOKALT
1. Skapa ett projekt på https://supabase.com/ (Free räcker för att testa).
2. Öppna Project Settings > API (eller Connect) och kopiera Project URL samt anon/publishable key. Använd ALDRIG service_role key i webbläsaren.
3. Klistra in URL och anon/publishable key i config.js.
4. Öppna Supabase Dashboard > SQL Editor och kör hela supabase-schema.sql.
5. Gå till Database > Replication och se till att public.guild_state ingår i Realtime/publication.
6. Under Authentication > URL Configuration kan du för lokal testning lägga till http://localhost:8000 som Site URL/Redirect URL.
7. Kör en lokal webbserver i mappen:
   Windows: öppna PowerShell i mappen och kör: python -m http.server 8000
   Mac/Linux: python3 -m http.server 8000
8. Öppna http://localhost:8000. Skapa ett konto och logga in.

VIKTIGT OM DATAN
- Alla konton som kan skapa konto kan i denna MVP komma åt samma guild-state. Dela bara länken/projektet med den tänkta guilden.
- Denna första molnversion lagrar appens guilddata i en gemensam JSON-rad. Alla inloggade användare kan ändra samma data; den begränsar ännu inte redigering till den egna karaktären. Det är en fungerande grund för konton och synkning, men inte slutlig säkerhet för en publik produkt.
- Innan offentlig lansering rekommenderas medlemsinbjudningar, guild_members-tabell, per-karaktärsägarskap och RLS-policies som låter varje spelare redigera bara sin karaktär.
- Supabase Auth hanterar lösenord; appen lagrar inte lösenord.
- För produktionsbruk: konfigurera e-postbekräftelse, återställning av lösenord och tillåtna redirect-URL:er.
- Använd aldrig service_role-nyckeln i config.js. Endast anon/publishable key ska ligga i frontend.

FUNKTIONER
- Personliga användarkonton (e-post + lösenord)
- Gemensam guilddata via Supabase Postgres
- Realtime-prenumeration på guildens delade data
- Befintliga funktioner från v4: quests, goals, events, karaktärer, journey, Hall of Fame, tribute, export/import
- Backup-export/import finns kvar

BEGRÄNSNINGAR
Detta är en första online-MVP. Den synkar gemensam data men har ännu inte fullständig behörighetsmodell för att låsa en karaktär till en specifik användare. Karaktärsägarskap, godkända guildinbjudningar och serverbaserad historik bör byggas innan den används som en helt öppen publik webbapp.
