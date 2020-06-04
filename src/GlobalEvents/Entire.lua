---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 02.01.2020 15:39
---
---
function InitTrig_Entire()
	local this = CreateTrigger()
	TriggerRegisterEnterRectSimple(this, GetPlayableMapRect())
	TriggerAddAction(this, function()
		local EntireUnit=GetTriggerUnit()
		--print(GetUnitName(EntireUnit))
		if IsUnitType(EntireUnit,UNIT_TYPE_TAUREN)  and GetLosingHP(EntireUnit)>1 then
			print("растение посажено")
			local isReady=false
			TimerStart(CreateTimer(), 0.1, true, function()




				local heal=HealUnit(EntireUnit,10)
				if heal==0 then
					UnitSetConstructionProgress(EntireUnit, 100)

					DestroyTimer(GetExpiredTimer())
					print("саженец готов")
					DestroyTimer(GetExpiredTimer())
					DisableTrigger(this)
					ReplaceUnitAsOne(EntireUnit)
					EnableTrigger(this)
				end
			end)
		end
	end)
end

function ReplaceUnitAsOne (hero)
	local id=GetUnitTypeId(hero)
	local x,y=GetUnitXY(hero)
	local new=CreateUnit(GetOwningPlayer(hero),id,x,y,0)
	KillUnit(hero)
	ShowUnit(hero,false)
	SetUnitX(new,x)
	SetUnitY(new,y)
	return new
end