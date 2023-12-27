local	script = {}
local	target = {}

script.name			= [=====[Script for Idle Canon The Tower Geometry 1.0.93]=====]
script.version		= "0.0.0"
script.author		= "Pixailz"
script.start_toast	= ""

-- 0 - no check; 1 - check package only, 2 - check package and build
script.check_target	= 1

target.name		= [=====[Idle Canon The Tower Geometry]=====]
target.pkg		= "com.idle.canon.the.tower.geometry.td.game"
target.version	= [=====[1.0.93]=====]
target.build	= 93

-- init
gg.require('101.1', 16142)

if script.start_toast ~= "" then
	script.start_toast = "\n"..script.start_toast
end

gg.toast(scripts.name..' v'..script.version..' by '..script.author..script.start_toast)

if script.check_target ~= 0 then
	local info = gg.getTargetInfo()
	local check = false
	local current = false
	if script.check_target >= 1 then
		check = targetPkg
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

--4986238519899848704
--4956366987996440336
--1112086261226536960

--6E0F6ECCD8
--6F51D5EC98

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
	dst_name,
)
	gg.clearResults()
	gg.setRanges(region)
	gg.searchNumber(src_num, src_type, false)
	local	result_count = gg.getResultsCount()
	gg.toast("[MN:GEM] founded: "..result_count)
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
	while IdleCanonTheTower.running do
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
