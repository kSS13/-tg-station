/datum/reagent/k_madmed
	name = "Odd Chemical"
	id = "k_madmed"

/datum/reagent/k_madmed/on_mob_life(mob/living/M)
	current_cycle++
	holder.remove_reagent(src.id, metabolization_rate / M.metabolism_efficiency)
	..() //madmed reagents can last ages if your efficiency allows it to

/datum/reagent/k_madmed/k_chuuine
	id = "k_chuuine"
	name = "Chuuine"
	description = "A standard reagent. Do not ingest without a healthy supply of antitoxin."
	color = "#40F000"
	metabolization_rate = 0.05 * REAGENTS_METABOLISM

/datum/reagent/k_madmed/k_chuuine/on_mob_life(mob/living/M)
	M.adjustToxLoss(0.05*volume - 1)
	M.adjustBruteLoss(-0.05*volume)
	M.adjustOxyLoss(-0.05*volume)
	M.adjustFireLoss(-0.05*volume)
	..()

/datum/reagent/k_madmed/k_xraychem
	name = "Protexradiin"
	id = "k_xraychem"
	description = "Causes eyes to strain and see through walls and darkness for a short while"
	color = "#80FFFF"
	metabolization_rate = 2 * REAGENTS_METABOLISM
	overdose_threshold = 50

/datum/reagent/k_madmed/k_xraychem/on_mob_life(mob/living/M)
	M.sight |= SEE_TURFS | SEE_MOBS | SEE_OBJS
	M.see_in_dark = 8
	M.see_invisible = SEE_INVISIBLE_MINIMUM
	..()

/datum/reagent/k_madmed/k_xraychem/on_mob_delete(mob/living/M)
	M.sight &= ~(SEE_TURFS | SEE_MOBS | SEE_OBJS)
	M.see_in_dark = 0
	M.see_invisible = 0
	..()

/datum/reagent/k_madmed/k_xraychem/overdose_process(mob/living/M)
	M.adjustOxyLoss(5)
	M.losebreath++
	..()

datum/reagent/k_madmed/k_xraychem/k_longxraychem
	name = "Protexradiinine"
	id = "k_longxraychem"
	description = "Causes eyes to strain and see through walls and darkness. The damage after it clears out is blinding."
	metabolization_rate = 0.1 * REAGENTS_METABOLISM
	overdose_threshold = 11

/datum/reagent/k_madmed/k_xraychem/on_mob_life(mob/living/M)
	M.cure_blind()
	..()

/datum/reagent/k_madmed/k_xraychem/k_longxraychem/on_mob_delete(mob/living/M)
	M.become_blind()
	..()

/datum/reagent/k_madmed/k_xraychem/k_longxraychem/overdose_process(mob/living/M)
	..()