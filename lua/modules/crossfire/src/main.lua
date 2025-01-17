local config = {}
config.moduleName = "Crossfire Configuration"
config.moduleDir = "/scripts/crossfire/"
config.useCompiler = true

compile = assert(loadfile(config.moduleDir .. "compile.lua"))(config)
elrs = assert(compile.loadScript(config.moduleDir .. "crossfire.lua"))(config, compile)

local function create()
    return crossfire.create()
end

local function wakeup()
    return crossfire.wakeup()
end

local function event(widget, category, value, x, y)
    return crossfire.event(widget, category, value, x, y)
end

local function close()
    return crossfire.close()
end

local function init()
    system.registerCrossfireModule({configure = {name = config.moduleName, create = create, wakeup = wakeup, event = event, close = close}})
end

return {init = init}
