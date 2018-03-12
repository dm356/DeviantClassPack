//---------------------------------------------------------------------------------------
//  FILE:    X2Effect_DoubleDamage.uc
//  AUTHOR:  Amineri (Pavonis Interactive)
//  PURPOSE: Effect that applies double the weapon's base damage
//---------------------------------------------------------------------------------------
class X2Effect_DoubleDamage extends X2Effect_ApplyWeaponDamage;

simulated function ModifyDamageValue(out WeaponDamageValue DamageValue, Damageable Target, out array<Name> AppliedDamageTypes)
{
	local WeaponDamageValue EmptyDamageValue;

	if( Target != None )
	{
		if( Target.IsImmuneToDamage(DamageValue.DamageType) )
		{
			`log("Target is immune to damage type" @ DamageValue.DamageType $ "!", true, 'XCom_HitRolls');
			DamageValue = EmptyDamageValue;
		}
		else if( AppliedDamageTypes.Find(DamageValue.DamageType) == INDEX_NONE )
		{
			AppliedDamageTypes.AddItem(DamageValue.DamageType);
		}
	}
	
	DamageValue.Damage *= 2;
	DamageValue.Crit *= 2;
	DamageValue.Spread *= 2;
	DamageValue.Pierce *= 2;
	DamageValue.Shred *= 2;
	DamageValue.Rupture *= 2;
}
