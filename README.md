# OAS DevOps TeamDay

Mobil webbapp för femkampen. Tipspromenaden genomförs analogt för att undvika telefonfusk. Varje lag kan ha en egen telefon; poängen sparas lokalt direkt och synkas automatiskt till Supabase när konfigurationen är ifylld.

## Supabase, en gång

1. Skapa ett projekt på [supabase.com](https://supabase.com).
2. Öppna **SQL Editor**, klistra in hela [supabase.sql](supabase.sql) och kör.
3. Öppna **Project Settings → API**.
4. Klistra in **Project URL** och den publika **anon key** i [supabase-config.js](supabase-config.js).
5. Publicera filerna på GitHub Pages.

`anon key` får ligga i frontend. Använd aldrig Supabase service-role key i denna app.

## Gratis publicering

GitHub Pages är enklast: **Settings → Pages → Deploy from branch → main / root**. Ingen build eller server behövs.

## Hur appen beter sig

- Poäng sparas direkt i telefonens localStorage.
- När nät finns synkas lagkort till Supabase efter 0,5 sekunders paus.
- Grön status betyder `Synkad`; röd status betyder att lokalt kort finns kvar men att nätet inte synkar.
- Resultatfliken läser samma lag från databasen på alla telefoner.
- Export/import finns kvar som reservplan.

Eventkoden är `tullgarn-2026` och används i både appen och RLS-policyn. Ändra den på båda ställena om appen ska återanvändas för ett nytt event.
