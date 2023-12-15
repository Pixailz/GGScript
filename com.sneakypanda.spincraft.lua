local	SpinCraft = {}

SpinCraft.running = true

SpinCraft.mn_money			= "-854727628962136064"
SpinCraft.mn_money_pad		= -0x14

-- SpinCraft.mn_xp				= "487272610880"
-- SpinCraft.mn_xp_pad			= 0x18
SpinCraft.mn_xp				= "8337847636954447872"
SpinCraft.mn_xp_pad			= 0x1C

function	SpinCraft.hack_money()
	gg.clearResults()
	gg.setRanges(gg.REGION_ANONYMOUS)
	gg.searchNumber(SpinCraft.mn_money, gg.TYPE_QWORD, false)
	local	choice = gg.prompt(
		{'How much do you want ?'},
		{[1]=999},
		{[1]='number'}
	)

	local	result_count = gg.getResultsCount()
	gg.toast("[MN:MONEY] founded: "..result_count)
	ret = gg.getResults(result_count)
	for k, v in ipairs(ret) do
		v.address = v.address + SpinCraft.mn_money_pad
	end
	gg.loadResults(ret)
	gg.refineNumber('1~2000000000', gg.TYPE_QWORD)
	local	result_count = gg.getResultsCount()
	ret = gg.getResults(result_count)
	for k, v in ipairs(ret) do
		v.value = choice[1]
		v.name = "Money"
	end
	gg.setValues(ret)
	gg.addListItems(ret)
	gg.clearResults()
end

function	SpinCraft.hack_xp()
	gg.clearResults()
	gg.setRanges(gg.REGION_ANONYMOUS)
	gg.searchNumber(SpinCraft.mn_xp, gg.TYPE_QWORD, false)
	local	choice = gg.prompt(
		{'How much do you want ?'},
		{[1]=999},
		{[1]='number'}
	)
	local	result_count = gg.getResultsCount()
	gg.toast("[MN:XP] founded: "..result_count)
	ret = gg.getResults(result_count)
	for k, v in ipairs(ret) do
		v.address = v.address + SpinCraft.mn_xp_pad
	end
	gg.loadResults(ret)
	gg.refineNumber('1~2000000000', gg.TYPE_QWORD)
	local	result_count = gg.getResultsCount()
	ret = gg.getResults(result_count)
	for k, v in ipairs(ret) do
		v.value = choice[1]
		v.name = "XP"
	end
	gg.setValues(ret)
	gg.addListItems(ret)
	gg.clearResults()
end

function	SpinCraft.exit()
	print("CMD EXIT")
	SpinCraft.running = false
end

function	SpinCraft.menu()
	while SpinCraft.running do
		if gg.isClickedUiButton() then
			gg.hideUiButton()
			local	ret = gg.choice({
				'💰 (must have at least 1)',
				'🆙 (must have at least 1)',
				'Exit'
			}, nil, "SpinCraft")

			if ret == 1 then
				SpinCraft.hack_money()
			elseif ret == 2 then
				SpinCraft.hack_xp()
			elseif ret == 3 then
				SpinCraft.exit()
			end
			gg.showUiButton()
		end
		gg.sleep(100)
	end
end

if gg.getTargetPackage() ~= "com.sneakypanda.spincraft" then
	gg.alert("This script is only for SpinCraft.")
	return 1
end

gg.showUiButton()

SpinCraft.menu()

gg.hideUiButton()

return 0
