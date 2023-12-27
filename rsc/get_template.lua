local	info = gg.getTargetInfo()
local	file_path = "/storage/emulated/0/Documents/"..info.packageName..".lua"
local	file = io.open(file_path, "w")

local	tw = string.format([==[
local	script = {}
local	target = {}

script.name			= [=[%s %s]=]
script.version		= "0.0.0"
script.author		= "Pixailz"
script.start_toast	= ""

-- 0 - no check; 1 - check package only, 2 - check package and build
script.check_target	= 1

target.name		= [=[%s]=]
target.pkg		= "%s"
target.version	= [=[%s]=]
target.build	= %d

-- init
gg.require("%s", %d)

if script.start_toast ~= "" then
	script.start_toast = "\n"..script.start_toast
end

gg.toast(script.name..' v'..script.version..' by '..script.author..script.start_toast)

if script.check_target ~= 0 then
	local info = gg.getTargetInfo()
	local check = false
	local current = false
	if script.check_target >= 1 then
		check = target.pkg
		current = info.packageName
	end
	if script.check_target >= 2 then
		check = check..' '..target.version..' ('..target.build..')'
		current = current..' '..info.versionName..' ('..info.versionCode..')'
	end
	if check ~= current then
		gg.alert('This script for "'..target.name..'" ['..check..'].\nYou select "'..info.label..'" ['..current..'].\nNow script exit.')
		os.exit()
	end
end

script.running = true

target.mn_gem_num	= "4857413673095800593"
target.mn_gem_pad	= 0x44

-- functions
function	script.hack_mn(
	region,
	src_num,
	src_type,
	pad,
	dst_num,
	dst_type,
	dst_name
)
	gg.clearResults()
	gg.setRanges(region)
	gg.searchNumber(src_num, src_type, false)
	local	result_count = gg.getResultsCount()
	gg.toast("[MN:"..dst_name.."] founded: "..result_count)
	ret = gg.getResults(result_count)

	-- apply offset + change type
	for k, v in ipairs(ret) do
		v.address = v.address + pad
		v.flags = dst_type
	end

	gg.loadResults(ret)
	--gg.refineNumber('1~2000000000', gg.TYPE_QWORD)
	--local	result_count = gg.getResultsCount()
	--ret = gg.getResults(result_count)

	for k, v in ipairs(ret) do
		v.value = dst_num
		v.name = dst_name
	end
	gg.setValues(ret)
	gg.addListItems(ret)
	gg.clearResults()
end

function	script.exit()
	script.running = false
end

-- target
function	target.hack_gem()
	local	choice = gg.prompt(
		{'How much do you want ?'},
		{[1]=999},
		{[1]='number'}
	)
	script.hack_mn(
		gg.REGION_ANONYMOUS,
		target.mn_gem_num, gg.TYPE_QWORD, target.mn_gem_pad,
		choice, gg.TYPE_FLOAT, "💎 GEM"
	)
end

-- main
function	script.menu()
	while script.running do
		if gg.isClickedUiButton() then
			gg.hideUiButton()
			local	ret = gg.choice({
				'Exit',
				'💎 GEM',
			}, nil, target.name)

			if ret == 1 then
				script.exit()
			elseif ret == 2 then
				target.hack_gem()
			end
			gg.showUiButton()
		end
		gg.sleep(100)
	end
end

gg.showUiButton()

script.menu()

gg.hideUiButton()

return 0
]==],
	info.label, info.versionName,
	info.label,
	info.packageName,
	info.versionName,
	info.versionCode,
	gg.VERSION, gg.BUILD
)

file:write(tw)
print("Successfully created "..file_path)
