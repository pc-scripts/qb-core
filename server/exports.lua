-- Add or change (a) method(s) in the QBCore.Functions table
local function SetMethod(methodName, handler)
    if type(methodName) ~= 'string' then
        return false, 'invalid_method_name'
    end

    QBCore.Functions[methodName] = handler

    TriggerEvent('QBCore:Server:UpdateObject')

    return true, 'success'
end

-- Add or change (a) field(s) in the QBCore table
local function SetField(fieldName, data)
    if type(fieldName) ~= 'string' then
        return false, 'invalid_field_name'
    end

    QBCore[fieldName] = data

    TriggerEvent('QBCore:Server:UpdateObject')

    return true, 'success'
end

-- Single add job function which should only be used if you planning on adding a single job
local function AddJob(jobName, job)
    if type(jobName) ~= 'string' then
        return false, 'invalid_job_name'
    end

    if QBCore.Shared.Jobs[jobName] then
        return false, 'job_exists'
    end

    QBCore.Shared.Jobs[jobName] = job

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Jobs', jobName, job)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Multiple Add Jobs
local function AddJobs(jobs)
    local shouldContinue = true
    local message = 'success'
    local errorItem = nil

    for key, value in pairs(jobs) do
        if type(key) ~= 'string' then
            message = 'invalid_job_name'
            shouldContinue = false
            errorItem = jobs[key]
            break
        end

        if QBCore.Shared.Jobs[key] then
            message = 'job_exists'
            shouldContinue = false
            errorItem = jobs[key]
            break
        end

        QBCore.Shared.Jobs[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('QBCore:Client:OnSharedUpdateMultiple', -1, 'Jobs', jobs)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, message, nil
end

-- Single Remove Job
local function RemoveJob(jobName)
    if type(jobName) ~= 'string' then
        return false, 'invalid_job_name'
    end

    if not QBCore.Shared.Jobs[jobName] then
        return false, 'job_not_exists'
    end

    QBCore.Shared.Jobs[jobName] = nil

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Jobs', jobName, nil)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Single Update Job
local function UpdateJob(jobName, job)
    if type(jobName) ~= 'string' then
        return false, 'invalid_job_name'
    end

    if not QBCore.Shared.Jobs[jobName] then
        return false, 'job_not_exists'
    end

    QBCore.Shared.Jobs[jobName] = job

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Jobs', jobName, job)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Single add item
local function AddItem(itemName, item)
    if type(itemName) ~= 'string' then
        return false, 'invalid_item_name'
    end

    if QBCore.Shared.Items[itemName] then
        return false, 'item_exists'
    end

    QBCore.Shared.Items[itemName] = item

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Items', itemName, item)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Single update item
local function UpdateItem(itemName, item)
    if type(itemName) ~= 'string' then
        return false, 'invalid_item_name'
    end
    if not QBCore.Shared.Items[itemName] then
        return false, 'item_not_exists'
    end
    QBCore.Shared.Items[itemName] = item
    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Items', itemName, item)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Multiple Add Items
local function AddItems(items)
    local shouldContinue = true
    local message = 'success'
    local errorItem = nil

    for key, value in pairs(items) do
        if type(key) ~= 'string' then
            message = 'invalid_item_name'
            shouldContinue = false
            errorItem = items[key]
            break
        end

        if QBCore.Shared.Items[key] then
            message = 'item_exists'
            shouldContinue = false
            errorItem = items[key]
            break
        end

        QBCore.Shared.Items[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('QBCore:Client:OnSharedUpdateMultiple', -1, 'Items', items)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, message, nil
end

-- Single Remove Item
local function RemoveItem(itemName)
    if type(itemName) ~= 'string' then
        return false, 'invalid_item_name'
    end

    if not QBCore.Shared.Items[itemName] then
        return false, 'item_not_exists'
    end

    QBCore.Shared.Items[itemName] = nil

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Items', itemName, nil)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Single Add Gang
local function AddGang(gangName, gang)
    if type(gangName) ~= 'string' then
        return false, 'invalid_gang_name'
    end

    if QBCore.Shared.Gangs[gangName] then
        return false, 'gang_exists'
    end

    QBCore.Shared.Gangs[gangName] = gang

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Gangs', gangName, gang)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Multiple Add Gangs
local function AddGangs(gangs)
    local shouldContinue = true
    local message = 'success'
    local errorItem = nil

    for key, value in pairs(gangs) do
        if type(key) ~= 'string' then
            message = 'invalid_gang_name'
            shouldContinue = false
            errorItem = gangs[key]
            break
        end

        if QBCore.Shared.Gangs[key] then
            message = 'gang_exists'
            shouldContinue = false
            errorItem = gangs[key]
            break
        end

        QBCore.Shared.Gangs[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('QBCore:Client:OnSharedUpdateMultiple', -1, 'Gangs', gangs)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, message, nil
end

-- Single Remove Gang
local function RemoveGang(gangName)
    if type(gangName) ~= 'string' then
        return false, 'invalid_gang_name'
    end

    if not QBCore.Shared.Gangs[gangName] then
        return false, 'gang_not_exists'
    end

    QBCore.Shared.Gangs[gangName] = nil

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Gangs', gangName, nil)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

-- Single Update Gang
local function UpdateGang(gangName, gang)
    if type(gangName) ~= 'string' then
        return false, 'invalid_gang_name'
    end

    if not QBCore.Shared.Gangs[gangName] then
        return false, 'gang_not_exists'
    end

    QBCore.Shared.Gangs[gangName] = gang

    TriggerClientEvent('QBCore:Client:OnSharedUpdate', -1, 'Gangs', gangName, gang)
    TriggerEvent('QBCore:Server:UpdateObject')
    return true, 'success'
end

local function GetCoreVersion(InvokingResource)
    local resourceVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
    if InvokingResource and InvokingResource ~= '' then
        print(('%s called qbcore version check: %s'):format(InvokingResource or 'Unknown Resource', resourceVersion))
    end
    return resourceVersion
end

local function ExploitBan(playerId, origin, seconds)
    local name = GetPlayerName(playerId)
    local query, params = MySQL.PrepareQuery('INSERT INTO ?? SET ? ', {'bans', {
        name = name,
        license = QBCore.Functions.GetIdentifier(playerId, 'license'),
        discord = QBCore.Functions.GetIdentifier(playerId, 'discord'),
        ip = QBCore.Functions.GetIdentifier(playerId, 'ip'),
        reason = origin,
        banned_by = 'Anti Cheat',
        expires_at = 'DATE_ADD(NOW(), INTERVAL '..(seconds or 86400 * 365 * 10)..' SECOND)',
    }})
    MySQL.insert(query, params)
    DropPlayer(playerId, Lang:t('info.exploit_banned', { discord = QBCore.Config.Server.Discord }))
    TriggerEvent('qb-log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'red', name .. ' has been banned for exploiting ' .. origin, true)
end

QBCore.Functions.GetCoreVersion = GetCoreVersion
QBCore.Functions.UpdateGang = UpdateGang
QBCore.Functions.RemoveGang = RemoveGang
QBCore.Functions.AddGangs = AddGangs
QBCore.Functions.SetMethod = SetMethod
QBCore.Functions.SetField = SetField
QBCore.Functions.AddJob = AddJob
QBCore.Functions.AddJobs = AddJobs
QBCore.Functions.RemoveJob = RemoveJob
QBCore.Functions.UpdateJob = UpdateJob
QBCore.Functions.AddItem = AddItem
QBCore.Functions.UpdateItem = UpdateItem
QBCore.Functions.AddItems = AddItems
QBCore.Functions.RemoveItem = RemoveItem
QBCore.Functions.AddGang = AddGang

exports('ExploitBan', ExploitBan)
exports('GetCoreVersion', GetCoreVersion)
exports('UpdateGang', UpdateGang)
exports('RemoveGang', RemoveGang)
exports('AddGangs', AddGangs)
exports('SetMethod', SetMethod)
exports('SetField', SetField)
exports('AddJob', AddJob)
exports('AddJobs', AddJobs)
exports('RemoveJob', RemoveJob)
exports('UpdateJob', UpdateJob)
exports('AddItem', AddItem)
exports('UpdateItem', UpdateItem)
exports('AddItems', AddItems)
exports('RemoveItem', RemoveItem)
exports('AddGang', AddGang)