-- Stranglethorns Länstrafik: initial shared guild state table
-- Kör i Supabase Dashboard > SQL Editor.
create table if not exists public.guild_state (
  guild_id text primary key,
  state jsonb not null default '{}'::jsonb,
  updated_by uuid references auth.users(id),
  updated_at timestamptz not null default now()
);
alter table public.guild_state enable row level security;
-- Inloggade användare i denna MVP delar en guild. Alla authenticated kan läsa och skriva guild_state.
-- För produktion med flera separata guilds och strikt per-karaktärsbehörighet: byt till tabeller per entitet + medlemskapstabell och policies.
drop policy if exists "guild members can read shared state" on public.guild_state;
create policy "guild members can read shared state" on public.guild_state for select to authenticated using (true);
drop policy if exists "guild members can insert shared state" on public.guild_state;
create policy "guild members can insert shared state" on public.guild_state for insert to authenticated with check (true);
drop policy if exists "guild members can update shared state" on public.guild_state;
create policy "guild members can update shared state" on public.guild_state for update to authenticated using (true) with check (true);
-- Aktivera Realtime för guild_state i Database > Replication om den inte redan är aktiverad.
