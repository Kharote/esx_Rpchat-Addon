RegisterCommand('doc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	frist = args[1]
	second = args[2]

			local name = GetPlayerName(source)
			if Config.EnableESXIdentity then name = GetCharacterName(source) end

			TriggerClientEvent('esx_rpchat:sendProximityMessagedoc', -1, source, _U('doc_prefix', name), frist, second, { 0, 0, 255 })
			--print(('%s: %s'):format(name, args))
end, false)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end

Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/doc',   _U('doc_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		TriggerEvent('chat:removeSuggestion', '/doc')
	end
end)