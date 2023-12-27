-- https://gameguardian.net/forum/files/file/3738-hempire-mega-multi-menu-x64/

on = [[ON✅️]];
off = [[OFF❌️]];
hack0 = off;
hack1 = off;
hack2 = off;
hack3 = off;
hack4 = off;
hack5 = off;
hack6 = off;
hack7 = off;
hack8 = off;
hack9 = off;
hack10 = off;
hack11 = off;
hack12 = off;
hack13 = off;
function class()
	gg.clearResults();
	gg.setRanges(gg.REGION_OTHER | gg.REGION_C_ALLOC);
	gg.searchNumber(":" .. x, 1);
	if (gg.getResultsCount() == 0) then
		E = 0;
		return;
	end
	apexu = nil;
	apexu = gg.getResults(1);
	gg.getResults(gg.getResultsCount());
	gg.refineNumber(tonumber(apexu[1].value), 1);
	apexu = nil;
	apexu = gg.getResults(gg.getResultsCount());
	gg.clearResults();
	for v0, v1 in ipairs(apexu) do
		apexu[v0].address = apexu[v0].address - 1;
		apexu[v0].flags = 1;
	end
	apexu = gg.getValues(apexu);
	apexa = {};
	apexaa = 1;
	for v4, v5 in pairs(apexu) do
		if (apexu[v4].value == 0) then
			apexa[apexaa] = {};
			apexa[apexaa].address = apexu[v4].address;
			apexa[apexaa].flags = 1;
			apexaa = apexaa + 1;
		end
	end
	if (#apexa == 0) then
		gg.clearResults();
		E = 0;
		return;
	end
	u = nil;
	for v6, v7 in ipairs(apexa) do
		apexa[v6].address = apexa[v6].address + #x + 1;
		apexa[v6].flags = 1;
	end
	apexa = gg.getValues(apexa);
	apexs = nil;
	apexs = {};
	apexbb = 1;
	for v10, v11 in ipairs(apexa) do
		if (apexa[v10].value == 0) then
			apexs[apexbb] = {};
			apexs[apexbb].address = apexa[v10].address;
			apexs[apexbb].flags = 1;
			apexbb = apexbb + 1;
		end
	end
	if (#apexs == 0) then
		gg.clearResults();
		E = 0;
		return;
	end
	apexa = nil;
	for v12, v13 in ipairs(apexs) do
		apexs[v12].address = apexs[v12].address - #x;
		apexs[v12].flags = 1;
	end
	gg.loadResults(apexs);
	apexrange = nil;
	apexrange = gg.getResults(gg.getResultsCount());
	apexrca = nil;
	apexrca = 0;
	apexro = nil;
	apexro = 0;
	apexra = nil;
	for v16, v17 in ipairs(apexrange) do
		apexra = gg.getValuesRange(apexrange[v16]);
		if (apexra.address == "Ca") then
			apexrca = 1;
		end
		if (apexra.address == "O") then
			apexro = 1;
		end
		apexra = nil;
	end
	if ((apexrca == 1) and (apexro == 0)) then
		gg.setRanges(gg.REGION_C_ALLOC);
	end
	if ((apexrca == 0) and (apexro == 1)) then
		gg.setRanges(gg.REGION_OTHER);
	end
	apexrca = nil;
	apexro = nil;
	apexra = nil;
	gg.searchPointer(0);
	if (gg.getResultsCount() == 0) then
		E = 0;
		return;
	end
	apexu = gg.getResults(gg.getResultsCount());
	gg.clearResults();
	if gg.getTargetInfo().x64 then
		apexo1 = 48;
		apexo2 = 56;
		apexvt = 32;
	else
		apexo1 = 24;
		apexo2 = 28;
		apexvt = 4;
	end
	ERROR = 0;
	::TRYAGAIN::;
	apexy = nil;
	apexy = {};
	apexz = nil;
	apexz = {};
	for v18, v19 in ipairs(apexu) do
		apexy[v18] = {};
		apexy[v18].address = apexu[v18].address + apexo1;
		apexy[v18].flags = apexvt;
		apexz[v18] = {};
		apexz[v18].address = apexu[v18].address + apexo2;
		apexz[v18].flags = apexvt;
	end
	apexy = gg.getValues(apexy);
	apexz = gg.getValues(apexz);
	apexp = nil;
	apexp = {};
	apexxx = 1;
	for v26, v27 in ipairs(apexy) do
		if ((apexy[v26].value == apexz[v26].value) and (#(tostring(apexy[v26].value)) >= 8)) then
			apexp[apexxx] = apexy[v26].value;
			apexxx = apexxx + 1;
		end
	end
	apexxx = nil;
	apexy = nil;
	apexz = nil;
	if ((#apexp == 0) and (ERROR == 0)) then
		if gg.getTargetInfo().x64 then
			apexo1 = 32;
			apexo2 = 40;
		else
			apexo1 = 16;
			apexo2 = 20;
		end
		ERROR = 2;
		goto TRYAGAIN;
	end
	if ((#apexp == 0) and (ERROR == 2)) then
		E = 0;
		return;
	end
	gg.setRanges(gg.REGION_ANONYMOUS);
	gg.clearResults();
	apexxxx = 1;
	for v28, v29 in ipairs(apexp) do
		gg.toast("Please Wait...");
		gg.searchNumber(tonumber(apexp[v28]), apexvt);
		if (gg.getResultsCount() ~= 0) then
			apexxx = nil;
			apexxx = gg.getResults(gg.getResultsCount());
			gg.clearResults();
			for v47 = 1, #apexxx do
				apexxx[v47].name = "APEX[GG]v2";
			end
			gg.addListItems(apexxx);
			apexxxx = apexxxx + 1;
		end
		gg.clearResults();
	end
	apexu = nil;
	apexp = nil;
	apexxx = nil;
	apexq = nil;
	if (apexxxx == 1) then
		gg.clearResults();
		E = 0;
		return;
	end
	apexxxx = nil;
	apexload = {};
	apexremove = {};
	apexxx = 1;
	apexu = gg.getListItems();
	for v30, v31 in ipairs(apexu) do
		if (apexu[v30].name == "APEX[GG]v2") then
			apexload[apexxx] = {};
			apexload[apexxx].address = apexu[v30].address + o;
			apexload[apexxx].flags = t;
			apexremove[apexxx] = {};
			apexremove[apexxx] = apexu[v30];
			apexxx = apexxx + 1;
		end
	end
	apexload = gg.getValues(apexload);
	gg.loadResults(apexload);
	gg.removeListItems(apexremove);
end
function start()
	your_choice = gg.multiChoice({"~ [ REWARD ] ","~ [ REWARD ]  [FOR BOXES]~[ CAR MENU ]~[STRAND MENU] ",("~ [ DIAMOND ]  ~" .. hack0 .. " "),("~[ LOOT KEYS ] ~" .. hack1 .. " "),("~ [ FERTALIZER ] ~" .. hack2 .. " "),("~ [ NETWORTH ] ~" .. hack3 .. " "),("~ [ TASKMEDAL ] ~" .. hack4 .. " "),("~ [ LEGENDARYBUD ] ~" .. hack5 .. " "),("~ [ SILVERCREDITS ] ~" .. hack6 .. " "),("~ [ MUTAGENT ] ~" .. hack7 .. " "),("~ [ LEGEND CASE  ] ~" .. hack8 .. " "),("~ [ CAR CASE ] ~" .. hack9 .. " "),("~ [ EPICBUD CASE ] ~" .. hack10 .. " "),("~ [ BUDDABOX ] ~" .. hack11 .. " "),("~ [ RARE BOX ]  ~" .. hack12 .. " "),("~ [ UNQIUE BOX ] ~" .. hack13 .. " "),"~ [ CAR MENU ]","~ [ STRANDS MENU ]","~ [ EXIT MENU ]"}, nil, "✨HEMPIRE V3 SCRIPT✨ [ KUMADEIT ]");
	if (your_choice == nil) then
		while true do
			if gg.isVisible() then
				gg.setVisible(false);
				start();
			end
		end
	end
	if your_choice[1] then
		gg.clearResults();
		x = "RewardItem";
		o = 32;
		t = 4;
		class();
		value1 = gg.prompt({"Type Reward Amount"}), {0};
		gg.refineNumber(value1[1], gg.TYPE_DWORD);
		revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil);
		gg.alert(" (❗ IF HACKING BOXES USE THE REWARD FOR BOXES OPTION❗)");
		revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil);
		gg.editAll("1000", gg.TYPE_DWORD);
		gg.toast("🔵 REWARD HACKED [ ON✅️ ] 🔵");
		gg.sleep(800);
		gg.toast("🔙[  TO RESET THE REWARD VALUE JUST RESTART THE GAME ] 🔙");
		gg.processResume();
		gg.clearResults();
	end
	if your_choice[2] then
		gg.clearResults();
		x = "RewardItem";
		o = 32;
		t = 4;
		class();
		value1 = gg.prompt({"Type Reward Amount"}), {0};
		gg.refineNumber(value1[1], gg.TYPE_DWORD);
		revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil);
		gg.editAll("125", gg.TYPE_DWORD);
		gg.processResume();
		gg.toast("🔵 REWARD FOR BOXES HACK [ ON✅️ ] 🔵");
		gg.sleep(800);
		gg.toast("🔙[  NOW CAN RUN ANY BOX HACK WITHOUT CRASHING ] 🔙");
		gg.processResume();
		gg.clearResults();
	end
	if your_choice[3] then
		if (hack0 == off) then
			gg.clearResults();
			gg.alert("MAKE SURE TO USE MONEY HACK FIRST ! (WILL NOT WORK IF MONEY IS NOT HACKED)");
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("1", gg.TYPE_DWORD);
			gg.toast("✅ [ DIAMOND ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack0 = on;
		else
			gg.searchNumber("1;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("1", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.processResume();
			gg.toast("🟢 [ DIAMOND OFF❌️ ] 🟢");
			gg.clearResults();
			gg.processResume();
			hack0 = off;
		end
	end
	if your_choice[4] then
		if (hack1 == off) then
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("2", gg.TYPE_DWORD);
			gg.toast("✅ [ LOOTKEYS ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack1 = on;
		else
			gg.searchNumber("2;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("2", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.processResume();
			gg.processResume();
			gg.toast("🟢 [ LOOTKEYS OFF❌️ ] 🟢");
			gg.clearResults();
			gg.processResume();
			hack1 = off;
		end
	end
	if your_choice[5] then
		if (hack2 == off) then
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("22", gg.TYPE_DWORD);
			gg.toast("✅ [ FERTALIZER ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack2 = on;
		else
			gg.clearResults();
			gg.searchNumber("22;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("22", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.processResume();
			gg.toast("🟢 [ FERTALIZER OFF❌️ ] 🟢");
			gg.clearResults();
			gg.processResume();
			hack2 = off;
		end
	end
	if your_choice[6] then
		if (hack3 == off) then
			gg.clearResults();
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("3", gg.TYPE_DWORD);
			gg.toast("✅ [ NETWORTH ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack3 = on;
		else
			gg.clearResults();
			gg.searchNumber("3;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("3", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(100, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.processResume();
			gg.toast("🟢 [ NETWORTH OFF❌️ ] 🟢");
			gg.clearResults();
			gg.processResume();
			hack3 = off;
		end
	end
	if your_choice[7] then
		if (hack4 == off) then
			gg.clearResults();
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("496", gg.TYPE_DWORD);
			gg.toast("✅ [ TASK MEDALS ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack4 = on;
		else
			gg.clearResults();
			gg.searchNumber("496;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("496", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ TASK MEDALS OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack4 = off;
		end
	end
	if your_choice[8] then
		if (hack5 == off) then
			gg.clearResults();
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("42000", gg.TYPE_DWORD);
			gg.toast("✅ [ LEGENDARYBUD ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack5 = on;
		else
			gg.clearResults();
			gg.searchNumber("42000;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("42000", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ LEGENDARYBUD OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack5 = off;
		end
	end
	if your_choice[9] then
		if (hack6 == off) then
			gg.clearResults();
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("497", gg.TYPE_DWORD);
			gg.toast("✅ [ SILVER CREDITS ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack6 = on;
		else
			gg.clearResults();
			gg.searchNumber("497;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("497", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ SILVER CREDITS OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack6 = off;
		end
	end
	if your_choice[10] then
		if (hack7 == off) then
			gg.clearResults();
			gg.searchNumber("0;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("801", gg.TYPE_DWORD);
			gg.toast("✅ [ BREEDING LAB MUTAGENT ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack7 = on;
		else
			gg.clearResults();
			gg.searchNumber("801;1000::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("801", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ BREEDING LAB MUTAGENT OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack7 = off;
		end
	end
	if your_choice[11] then
		if (hack8 == off) then
			gg.clearResults();
			gg.searchNumber("0;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("700", gg.TYPE_DWORD);
			gg.toast("✅ [ LEGENDARY TRAIN CASE ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack8 = on;
		else
			gg.clearResults();
			gg.searchNumber("700;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("700", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ LEGENDARY TRAIN CASE OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack8 = off;
		end
	end
	if your_choice[12] then
		if (hack9 == off) then
			gg.clearResults();
			gg.searchNumber("0;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("690", gg.TYPE_DWORD);
			gg.toast("✅ [ KICKASS CAR CASE ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack9 = on;
		else
			gg.clearResults();
			gg.searchNumber("690;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("690", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ KICKASS CAR CASE OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack9 = off;
		end
	end
	if your_choice[13] then
		if (hack10 == off) then
			gg.clearResults();
			gg.searchNumber("0;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("607", gg.TYPE_DWORD);
			gg.toast("✅ [ EPICBUD CASE ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack10 = on;
		else
			gg.clearResults();
			gg.searchNumber("607;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("607", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ EPICBUD CASE OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack10 = off;
		end
	end
	if your_choice[14] then
		if (hack11 == off) then
			gg.clearResults();
			gg.searchNumber("0;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("609", gg.TYPE_DWORD);
			gg.toast("✅ [ BUDDABOX ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack11 = on;
		else
			gg.clearResults();
			gg.searchNumber("609;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("609", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ BUDDABOX OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack11 = off;
		end
	end
	if your_choice[15] then
		if (hack12 == off) then
			gg.clearResults();
			gg.searchNumber("0;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("622", gg.TYPE_DWORD);
			gg.toast("✅ [ RARE ITEM BOX ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack12 = on;
		else
			gg.clearResults();
			gg.searchNumber("622;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("622", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ RARE ITEM BOX OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack12 = off;
		end
	end
	if your_choice[16] then
		if (hack13 == off) then
			gg.clearResults();
			gg.searchNumber("0;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("0", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("619", gg.TYPE_DWORD);
			gg.toast("✅ [ UNQIUE ITEM BOX ON✅️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack13 = on;
		else
			gg.clearResults();
			gg.searchNumber("619;125::5", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			gg.refineNumber("619", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0);
			gg.processResume();
			revert = gg.getResults(200, nil, nil, nil, nil, nil, nil, nil, nil);
			gg.editAll("0", gg.TYPE_DWORD);
			gg.toast("✅ [ UNQIUE ITEM BOX OFF❌️ ] ✅");
			gg.clearResults();
			gg.processResume();
			hack13 = off;
		end
	end
	if your_choice[17] then
		gg.toast("CAR MENU LOADED OPEN GG TO VEIW THE SCRIPT");
		loadfile("/storage/emulated/0/Download/CAR MENU.lua")();
	end
	if your_choice[18] then
		gg.toast("STRANDS MENU LOADED OPEN GG TO VEIW THE SCRIPT");
		loadfile("/storage/emulated/0/Download/STRANDS MENU.lua")();
	end
	if your_choice[19] then
		print("●○●○●○●○●○●●○●○●○●○●○●●○●○●○●○●○●");
		print("●○●○●           THANKS FOR DOWNLOADING");
		print("●○●○●");
		print("●○●○●");
		print("●○●○●");
		print("●○●○●                       LEAVE ME");
		print("●○●○●                   A RATING ON GG");
		print("●○●○●");
		print("●○●○●                Telegram Group");
		print("●○●○●    t.me/KUSCRIPTS101");
		print("●○●○●");
		print("●○●○●            Donate With Cash App");
		print("●○●○●      cashapp.com/$SnappleCapJay");
		print("●○●○●");
		print("●○●○●○●○●○●●○●○●○●○●○●●○●○●○●○●○●");
		os.exit();
	end
end
while true do
	if gg.isVisible() then
		gg.setVisible(false);
		start();
	end
end
