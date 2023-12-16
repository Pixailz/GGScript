local	template = {}

template.running = true

-- template.mn_money			= "1"
-- template.mn_money_pad		= 0x2a

function	template.hack_money()
	gg.clearResults()
	gg.setRanges(gg.REGION_ANONYMOUS)
	gg.searchNumber(template.mn_money, gg.TYPE_QWORD, false)
	local	choice = gg.prompt(
		{'How much do you want ?'},
		{[1]=999},
		{[1]='number'}
	)

	local	result_count = gg.getResultsCount()
	gg.toast("[MN:MONEY] founded: "..result_count)
	ret = gg.getResults(result_count)
	for k, v in ipairs(ret) do
		v.address = v.address + template.mn_money_pad
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

function	template.exit()
	print("CMD EXIT")
	template.running = false
end

function	template.menu()
	while template.running do
		if gg.isClickedUiButton() then
			gg.hideUiButton()
			local	ret = gg.choice({
				'💰 (must have at least 1)',
				'Exit'
			}, nil, "template")

			if ret == 1 then
				template.hack_money()
			elseif ret == 2 then
				template.exit()
			end
			gg.showUiButton()
		end
		gg.sleep(100)
	end
end

if gg.getTargetPackage() ~= "com.blindsidedgames.countingsheep" then
	gg.alert("This script is only for template.")
	return 1
end

gg.showUiButton()

template.menu()

gg.hideUiButton()

return 0
