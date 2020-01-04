RegisterNetEvent('esx_rpchat:sendProximityMessagedoc')
AddEventHandler('esx_rpchat:sendProximityMessagedoc', function(playerId, title, message, messagee, color)
	local source = PlayerId()
	local target = GetPlayerFromServerId(playerId)

	local sourcePed, targetPed = PlayerPedId(), GetPlayerPed(target)
	local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
	
	message = tonumber(message) -- Set text Numbers to Int variable
	messagee = tonumber(messagee)
	
	local name = GetPlayerName(source)

	if target == source then
		TriggerEvent('chat:addMessage', { args = { title .. " " .. message, "/" .. messagee }, color = nil })
	elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
		TriggerEvent('chat:addMessage', { args = { title .. " " .. message, "/" .. messagee }, color = nil })
	end
	Citizen.Wait(1000)
	

	
	if message > messagee then
		while (message > messagee) do

			local name = GetPlayerName(source)
			message = message - 1

			if target == source then
				TriggerEvent('chat:addMessage', { args = { title .. " " .. message, "/" .. messagee }, color = nil })
			elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
				TriggerEvent('chat:addMessage', { args = { title .. " " .. message, "/" .. messagee }, color = nil })
			end
			Citizen.Wait(1000)
		end
			

	
	elseif message < messagee then
		while (message < messagee) do
			local name = GetPlayerName(source)
			message = message + 1

			if target == source then
				TriggerEvent('chat:addMessage', { args = { title .. " " .. message, "/" .. messagee }, color = nil })
			elseif GetDistanceBetweenCoords(sourceCoords, targetCoords, true) < 20 then
				TriggerEvent('chat:addMessage', { args = { title .. " " .. message, "/" .. messagee }, color = nil })
			end
			Citizen.Wait(1000)
		end
	end
end)