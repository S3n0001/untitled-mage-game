--!strict
-- Action data model (GDD 4.2, 4.13). Field names follow the GDD data fields (snake_case).
-- Times are ms, distances studs, damage is points of a 100 Health baseline (4.13).

export type Echelon = "E0" | "E1" | "E2" | "E3"
export type ParryClass = "Parryable" | "Breaker" | "Unparryable" | "Grab"
export type Element = "Fire" | "Ice" | "Water" | "Lightning" | "Wind" | "Earth" | "Void"
export type StatusId = "Chill" | "Soaked" | "Singe" | "ManaDrain" | "Stung" | "Root"
export type ActionKind = "Spell" | "Strike" | "Movement"

-- 4.13 Hitboxes. Beam is not in the 4.13 list; Torrent needs it (head extends at 160, turns).
export type HitboxMode = "Projectile" | "Melee" | "Area" | "Ground" | "Beam"

-- Startup is written "raw to floor" (4.13): Cast Speed moves raw toward floor, never past.
export type Startup = { raw: number, floor: number }

-- Hitbox: tagged union on `shape`. Capsule length is tip to tip. Box depth is reach along facing.
export type Sphere = { shape: "Sphere", mode: HitboxMode, radius: number }
export type Capsule = { shape: "Capsule", mode: HitboxMode, radius: number, length: number }
export type Box = { shape: "Box", mode: HitboxMode, width: number, height: number, depth: number }
export type Arc = { shape: "Arc", mode: HitboxMode, angle_deg: number, radius: number }
export type Cone = { shape: "Cone", mode: HitboxMode, angle_deg: number, length: number }
export type Cylinder = { shape: "Cylinder", mode: HitboxMode, radius: number, height: number }
export type Hitbox = Sphere | Capsule | Box | Arc | Cone | Cylinder

-- 4.13 Unblocked hits.
export type ReactionKind = "None" | "Flinch" | "Stagger" | "Knockdown"
export type HitReaction = {
	kind: ReactionKind,
	duration_ms: number,
	knockback_studs: number,
	grounds: boolean, -- Grounding (4.10)
}

-- 4.3: cancel is legal during startup only, forfeiting part of committed mana.
export type CancelRule = { window: "Startup", forfeit_frac: number }

-- 4.11 / 4.13: Hold at the end of startup, draining a share of cost per 100ms.
export type HoldRule = { max_ms: number, drain_frac_per_100ms: number }

-- 4.13: "Telegraph tags are the parry class, the echelon tier and the element."
export type TelegraphTags = {
	class_marker: ParryClass?, -- nil only for Barrier (pale, not a class color)
	tier: Echelon,
	element: Element?,
	ground_decal: boolean, -- decal from Telegraph_Start (Ground hitboxes)
	splash_marker: boolean, -- faint yellow-hatched splash sphere (e2_fireball)
}

-- 4.11 Law 6: an action without both does not ship.
export type SkillNotes = { mix_up: string, counterplay: string }

export type ProjectileRule = {
	speed: number, -- fixed per echelon (4.13 Projectile tiers)
	range: number, -- active_ms = range / speed (4.13 Conventions)
	pierce: number?, -- extra targets it passes through
	curve_deg: number?, -- max curve with aim at release
	curve_studs: number?, -- over the first N studs
}

export type BeamRule = {
	head_speed: number, -- 4.13: beam heads extend at 160
	turn_deg_per_s: number,
	cuts_projectiles: boolean, -- 4.8 Step 2
}

-- Multi-tick spells: damage band per cast, hit cap per tick (4.13 shared rules).
export type Ticks = {
	count: number,
	damage: number,
	interval_ms: number,
	heavy_first_only: boolean, -- 4.5: a beam is heavy only on its first tick
}

export type SplashTrigger = "Hit" | "Block" | "Clash"
export type Splash = {
	damage: number,
	hitbox: Hitbox,
	parry_class: ParryClass,
	excludes_direct_target: boolean,
	triggers: { SplashTrigger }, -- a parried projectile is dispelled with no blast (4.6)
}

export type Push = { studs: number, through_block: boolean }

-- Grab payload (e1_stonegrip): hold the target, then damage and throw.
export type GrabRule = { hold_ms: number, throw_studs: number }

-- e0_barrier (4.5, 4.6). Recovery is situational, so it lives here, not in recovery_ms.
export type BarrierRule = {
	parry_window_ms: number,
	whiff_recovery_ms: number, -- Parry Recovery
	release_lag_ms: number,
	shell_radius: number,
	block_drain_per_s: number, -- x (1.5 / Block Proficiency)
	block_proficiency_base: number,
}

export type SenseRule = { radius: number }

export type WeaponKind = "Unarmed" | "Staff" | "Sword"
export type WeaponRule = {
	weapon: WeaponKind,
	parries_spells: boolean,
	durability: number?,
	parry_durability_melee: number?,
	parry_durability_spell: number?,
	parry_durability_spell_hollow: number?, -- spell parry at 0 mana
	stance_toggle_ms: number?, -- nil: casts in either stance
}

export type MovementRule = {
	distance_studs: number,
	duration_ms: number,
	iframes_ms: number, -- from the input frame (4.3)
	cooldown_ms: number, -- from the start (4.3)
	chain_window_ms: number?, -- 3.4: a Step within this of the last costs more
	chain_cost_mult: number?,
}

export type SpellDef = {
	kind: "Spell",
	id: string,
	name: string,
	family: string?,
	echelon: Echelon,
	element: Element?,
	mana_cost: number,
	strain_cost: number,
	startup_ms: Startup,
	active_ms: number,
	recovery_ms: number,
	parry_class: ParryClass?, -- nil only when there is no hitbox (Barrier, Mana Sense)
	hitbox: Hitbox?,
	cancel: CancelRule?,
	hold: HoldRule?,
	telegraph: TelegraphTags,
	skill_notes: SkillNotes,
	hit_reaction: HitReaction,
	damage: number?, -- direct, Raw (4.13)
	physical: boolean, -- drains Blood on hit (3.3)
	status: StatusId?,
	push: Push?,
	projectile: ProjectileRule?,
	beam: BeamRule?,
	ticks: Ticks?,
	splash: Splash?,
	grab: GrabRule?,
	aim_range: number?, -- Ground: max distance to the aim point
	barrier: BarrierRule?,
	sense: SenseRule?,
}

export type StrikeDef = {
	kind: "Strike",
	id: string,
	name: string,
	echelon: Echelon,
	mana_cost: number,
	strain_cost: number,
	startup_ms: Startup,
	active_ms: number,
	recovery_ms: number,
	parry_class: ParryClass,
	hitbox: Hitbox,
	cancel: CancelRule?,
	hold: HoldRule?,
	telegraph: TelegraphTags,
	skill_notes: SkillNotes,
	hit_reaction: HitReaction,
	damage: number,
	physical: boolean,
	push: Push?,
	weapon: WeaponRule,
}

export type MovementDef = {
	kind: "Movement",
	id: string,
	name: string,
	mana_cost: number,
	strain_cost: number,
	startup_ms: Startup,
	active_ms: number,
	recovery_ms: number,
	cancel: CancelRule?,
	skill_notes: SkillNotes,
	movement: MovementRule,
}

export type ActionDef = SpellDef | StrikeDef | MovementDef

-- One value per echelon. Record, not an indexer, so `.E1` type-checks.
export type PerEchelon<T> = { E0: T, E1: T, E2: T, E3: T }

-- 4.7 echelon table plus the 4.13 tiers. Read by validation and by combat systems.
export type EchelonRule = {
	cost_min: number,
	cost_max: number,
	cost_capacity_frac: number?, -- E3: also at least this share of max capacity
	capacity: number,
	damage_min: number,
	damage_max: number,
	damage_max_exclusive: boolean, -- E0: "under 2%"
	hit_cap: number?,
	startup_floor_ms: number,
	recovery_floor_ms: number,
	projectile_speed: number,
	projectile_radius_min: number?,
	projectile_radius_max: number?,
	area_radius_min: number?,
	area_radius_max: number?,
	contest_ms: number?, -- nil: cannot clash (E0 fizzles)
	sound_range: number,
	hit_reaction: HitReaction,
}

return {}
