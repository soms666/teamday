create table if not exists public.team_cards (
  id uuid primary key,
  event_code text not null,
  name text not null default '',
  members jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

create table if not exists public.quiz_entries (
  id uuid primary key,
  event_code text not null,
  name text not null,
  correct integer not null,
  tie_break integer not null default 0,
  created_at timestamptz not null default now()
);

alter table public.team_cards enable row level security;
alter table public.quiz_entries enable row level security;

create policy "teamday teams" on public.team_cards for all to anon
  using (event_code = 'tullgarn-2026')
  with check (event_code = 'tullgarn-2026');

create policy "teamday quiz" on public.quiz_entries for all to anon
  using (event_code = 'tullgarn-2026')
  with check (event_code = 'tullgarn-2026');
