require_game_build(3095) -- GTA Online v1.68 (build 3095)
SilentNight = menu.add_submenu("ツ Silent Night")


--Required Functions--

local function MPX()
    return "MP" .. stats.get_int("MPPLY_LAST_MP_CHAR") .. "_"
end

local function PlayerID()
    return globals.get_int(2672761)
    --return localplayer:get_player_id()
end

local function TP(x, y, z, yaw, roll, pitch)
    if localplayer ~= nil then
        localplayer:set_position(x, y, z)
        localplayer:set_rotation(yaw, roll, pitch)
    end
end

local function ChangeSession(session)
    globals.set_int(CSg1, session)
    if session == -1 then
        globals.set_int(CSg3, -1)
    end
    sleep(0.5)
    globals.set_int(CSg2, 1)
    sleep(0.5)
    globals.set_int(CSg2, 0)
end

local function FormatMoney(n)
    n = tostring(n)
    return n:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

local function null() end

--Required Scripts--

    ASS = script("appsecuroserv")
    GCS = script("gb_contraband_sell")
    GCB = script("gb_contraband_buy")
    AMW = script("am_mp_warehouse")
    GB = script("gb_gunrunning")
    FMC = script("fm_mission_controller")
    FMC20 = script("fm_mission_controller_2020")
    HIP = script("heist_island_planning")
    AMN = script("am_mp_nightclub")
    CLW = script("casino_lucky_wheel")
    BJ = script("blackjack")
    CR = script("casinoroulette")
    CS = script("casino_slots")
    TCP = script("three_card_poker")
    AMSY = script("am_mp_salvage_yard")

--Required Variables--

    FMg = 262145 -- free mode global ("CASH_MULTIPLIER")
    APg = 32466 -- agency payout global ("CLO_FXM_L_1_0")
    AIFl1 = 38397 -- agency instant finish local 1 (outdated)
    AIFl2 = 39772 -- agency instant finish local 2 (outdated)
    ACKg = 32500 -- agency cooldown killer global ("CLO_FXM_L_3_5")
    ASPg1 = 31602 -- auto shop payout global 1 (outdated)
    ASPg2 = 31610 -- auto shop payout global 2 (outdated)
    ASIFl1 = 48513 + 1 -- auto shop instant finish local 1
    ASIFl2 = 48513 + 1378 + 1 -- auto shop finish local 2
    ACg1 = 1928233 + 1 + 1 -- global apartment player 1 cut global
    ACg2 = 1928233 + 1 + 2 -- global apartment player 2 cut global
    ACg3 = 1928233 + 1 + 3 -- global apartment player 3 cut global
    ACg4 = 1928233 + 1 + 4 -- global apartment player 4 cut global
    ACg5 = 1930201 + 3008 + 1 -- local apartment player 1 cut global
    AIFl3 = 19728 -- apartment instant finish local 1
    AIFl4 = 28347 + 1 -- apartment instant finish local 2
    AIFl5 = 31603 + 69 -- apartment instant finish local 3
    AFHl = 11776 + 24 -- apartment fleeca hack local
    AFDl = 10067 + 11 -- apartment fleeca drill local
    AUAJg = 2635522 -- apartment unlock all jobs global ("HEIST_REPLAY_FIN")
    CPRBl = 1544 -- cayo perico reset board local
    CPCg1 = 1970744 + 831 + 56 + 1 -- cayo perico player 1 cut global
    CPCg2 = 1970744 + 831 + 56 + 2 -- cayo perico player 2 cut global
    CPCg3 = 1970744 + 831 + 56 + 3 -- cayo perico player 3 cut global
    CPCg4 = 1970744 + 831 + 56 + 4 -- cayo perico player 4 cut global
    GCg = 2685249 + 6615 -- global cut global (value2 = value2 * (num / 100f);)
    CPBl = 30009 -- cayo perico bag local (1859395035)
    CPFHl = 24333 -- cayo perico fingerprint hack local
    CPPCCl = 30357 + 3 -- cayo perico plasma cutter cut local
    CPSTCl = 29118 -- cayo perico sewer tunnel cut local
    CPIFl1 = 48513 -- cayo perico instant finish local 1
    CPIFl2 = 49892 -- cayo perico instant finish local 2
    DCCg1 = 1963945 + 1497 + 736 + 92 + 1 -- diamond casino player 1 cut global
    DCCg2 = 1963945 + 1497 + 736 + 92 + 2 -- diamond casino player 2 cut global
    DCCg3 = 1963945 + 1497 + 736 + 92 + 3 -- diamond casino player 3 cut global
    DCCg4 = 1963945 + 1497 + 736 + 92 + 4 -- diamond casino player 4 cut global
    DCFHl = 52985 -- diamond casino fingerprint hack local
    DCKHl = 54047 -- diamond casino keypad hack local
    DCDVDl1 = 10122 + 7 -- diamond casino drill vault door local 1
    DCDVDl2 = 10122 + 37 -- diamond casino drill vault door local 2
    DCg1 = 1959865 + 812 + 50 + 1 -- doomsday player 1 cut global
    DCg2 = 1959865 + 812 + 50 + 2 -- doomsday player 2 cut global
    DCg3 = 1959865 + 812 + 50 + 3 -- doomsday player 3 cut global
    DCg4 = 1959865 + 812 + 50 + 4 -- doomsday player 4 cut global
    DDBHl = 1512 -- doomsday data breaches hack local (outdated)
    DDSHl = 1269 + 135 -- doomsday doomsday scenario hack local
    DIFl1 = 19728, 12 -- doomsday instant finish local 1
    DIFl2 = 19728 + 2686 -- doomsday instant finish local 2
    DIFl3 = 28347 + 1 -- doomsday instant finish local 3
    DIFl4 = 31603 + 69 -- doomsday instant finish local 4
    SYRTg = 34080 -- salvage yard robbery type global ("SALV23_VEHICLE_ROBBERY_0")
    SYCKg = 34084 -- salvage yard can keep global ("SALV23_VEHICLE_ROBBERY_CAN_KEEP_0")
    SYVTg1 = 34088 + 1 -- salvage yard vehicle type global ("SALV23_VEHICLE_ROBBERY_ID_0")
    SYVTg2 = 34088 + 2 -- salvage yard vehicle type global ("SALV23_VEHICLE_ROBBERY_ID_1")
    SYVTg3 = 34088 + 3 -- salvage yard vehicle type global ("SALV23_VEHICLE_ROBBERY_ID_2")
    SYWCg = 34108 -- salvage yard weekly cooldown global (488207018)
    SYCg1 = 34118 --  salvage yard cooldown global ("SALV23_VEH_ROB_COOLDOWN_TIME")
    SYCg2 = 34119 --  salvage yard cooldown global ("SALV23_CFR_COOLDOWN_TIME")
    SYCPg = 34129 -- salvage yard claim price global ("SALV23_VEHICLE_CLAIM_PRICE")
    SYCPDg = 34130 -- salvage yard claim price discount global ("SALV23_VEHICLE_CLAIM_PRICE_FORGERY_DISCOUNT")
    SYSMg = 34100 -- salvage yard salvage multiplier global ("SALV23_VEHICLE_SALVAGE_VALUE_MULTIPLIER")
    BCISl = 1983 -- bunker crash instant sell local
    CMACLg1 = 27237 -- casino master acquire chips limit global 1 ("VC_CASINO_CHIP_MAX_BUY")
    CMACLg2 = 27238 -- casino master acquire chips limit global 2 ("VC_CASINO_CHIP_MAX_BUY_PENTHOUSE")
    CMBJCl = 114 -- casino master bjackjack cards local
    CMBJDl = 846 -- casino master bjackjack decks local
    CMBJPTl = 1774 -- casino master bjackjack player's table local
    CMBJPTSl = 8 -- casino master bjackjack player's table size local
    CMGLPl1 = 278 + 14 -- casino master lucky wheel win state local
    CMGLPl2 = 278 + 45 -- casino master lucky wheel prize state local
    CMPTl = 747 -- casino master poker table local
    CMPTSl = 9 -- casino master poker table size local
    CMPCl = 114 -- casino master poker cards local
    CMPCDl = 168 -- casino master poker current deck local
    CMPACl = 1036 -- casino master poker anti cheat local
    CMPACDl = 799 -- casino master poker anti cheat deck local
    CMPDSl = 55 -- casino master poker deck size local
    CMRMTl = 122 -- casino master roulette master table local
    CMROTl = 1357 -- casino master roulette outcomes table local
    CMRBTl = 153 -- casino master roulette ball table local
    CMSRRTl = 1346 -- casino master slots random results table local
    CRg = 2707037 + 36 -- cash remover global (/*You paid $~1~ to repair this vehicle for storage.*/)
    NHCNSg = 24599 -- nightclub helper cargo n shipments global (1162393585)
    NHSGg = 24593 -- nightclub helper sporting goods global (-1523050891)
    NHSAIg = 24594 -- nightclub helper s.a. imports global (147773667)
    NHPRg = 24595 -- nightclub helper pharmaceutical reseacrh global (-1188700671)
    NHOPg = 24596 -- nightclub helper organic produce global (-1188963032)
    NHPNCg = 24597 -- nightclub helper printing n copying global (967514627)
    NHCCg = 24598 -- nightclub helper cash creation global (1983962738)
    NHCKg1 = 24659 -- nightclub helper cooldown killer global 1 (1763921019)
    NHCKg2 = 24701 -- nightclub helper cooldown killer global 2 (-1004589438)
    NHCKg3 = 24702 -- nightclub helper cooldown killer global 3 (464940095)
    CSg1 = 1575032 -- change session (type) global 1 (NETWORK::UGC_SET_USING_OFFLINE_CONTENT(false);)
    CSg2 = 1574589 -- change session (switch) global 2 ("MP_POST_MATCH_TRANSITION_SCENE")
    CSg3 = 1574589 + 2 -- change session (quit) global 3 ("MP_POST_MATCH_TRANSITION_SCENE")
    SCVPg = 15991 -- special cargo vip price global ("EXEC_CONTRABAND_SALE_VALUE_THRESHOLD1")
    SCVCKg1 = 15756 -- special cargo vip cooldown global 1 ("EXEC_BUY_COOLDOWN")
    SCVCKg2 = 15757 -- special cargo vip cooldown global 2 ("EXEC_SELL_COOLDOWN")
    BTEg1 = 4537356 -- bypass transaction error global 1
    BTEg2 = 4537357 -- bypass transaction error global 2
    BTEg3 = 4537358 -- bypass transaction error global 3
    SCVAl1 = 739 -- special cargo vip appsecuroserv local 1 ("MP_WH_SELL")
    SCVAl2 = 740 -- special cargo vip appsecuroserv local 2 ("MP_WH_SELL")
    SCVAl3 = 558 -- special cargo vip appsecuroserv local 3 ("MP_WH_SELL")
    SCVAl4 = 1136 -- special cargo vip additional local 1
    SCVAl5 = 596 -- special cargo vip additional local 2
    SCVAl6 = 1125 -- special cargo vip additional local 3
    SCVMTl = 543 + 7 -- special cargo vip mission type local
    SCVISl = 543 + 1 -- special cargo vip instant sell local
    SCVIBl1 = 601 + 5 -- special cargo vip instant buy local 1
    SCVIBl2 = 601 + 1 -- special cargo vip instant buy local 2
    SCVIBl3 = 601 + 191 -- special cargo vip instant buy local 3
    SCVIBl4 = 601 + 192 -- special cargo vip instant buy local 4
    CLg = 1963515 -- cheap loop global ("MPPLY_CASINO_MEM_BONUS")
    TTg = 4537212 -- trigger transaction global
    TTg1 = TTg + 1 -- trigger transaction global 1
    TTg2 = TTg + 7 -- trigger transaction global 2
    TTg3 = TTg + 6 -- trigger transaction global 3
    TTg4 = TTg + 5 -- trigger transaction global 4
    TTg5 = TTg + 3 -- trigger transaction global 5
    TTg6 = TTg + 2 -- trigger transaction global 6
    NLCl = 183 + 32 + 1 -- night loop collect local
    NLSCg = 24257 -- night loop safe capacity global ("NIGHTCLUBMAXSAFEVALUE")
    NLISg = 24234 -- night loop income start global ("NIGHTCLUBINCOMEUPTOPOP5")
    NLIEg = 24253 -- night loop income end global ("NIGHTCLUBINCOMEUPTOPOP100")
    ORg = 1961347 -- orbital refund global ("ORB_CAN_QUIT1")
    AUg = 4543283 + 1 -- achievements unlocker global (/*Cheats have been activated.)
    CUg = 2707706 -- collectibles unlocker global ("DLC_VINEWOOD/DLC_VW_HIDDEN_COLLECTIBLES")
    AFg = 209 -- action figures offset
    LDOg = 593 -- ld organics offset
    PCg = 210 -- plating cards offset
    SJg = 211 -- signal jammers offset
    TCg = 506 -- treasure chests offset
    Sg = 600 -- snowmen offset
    BSg = 553 -- burried stashes offset
    HCg = 504 -- hidden caches offset
    MPg = 494 -- movie props offset
    JOLg = 591 -- jack o lanterns offset
    SCCg = 19321 -- sex changer change appearance cooldown global ("CHARACTER_APPEARANCE_COOLDOWN")
    BUCg1 = 21505 -- bunker unlocker cooldown global 1 (946764522)
    BUCg2 = 21757 -- bunker unlocker cooldown global 2 ("GR_RESEARCH_CAPACITY")
    BUCg3 = 21758 -- bunker unlocker cooldown global 3 ("GR_RESEARCH_PRODUCTION_TIME")
    BUCg4 = 21759 -- bunker unlocker cooldown global 4 ("GR_RESEARCH_UPGRADE_EQUIPMENT_REDUCTION_TIME")
    BUAg1 = 21761 -- bunker unlocker additional global 1 (1485279815)
    BUAg2 = 21762 -- bunker unlocker additional global 2 (2041812011)
    LSCMMg1 = 31844 -- ls car meet multiplier global 1 ("TUNER_SPRINT_FIRST_TIME_BONUS_XP_MULTIPLIER")
    LSCMMg2 = 31873 -- ls car meet multiplier global 2 (-137848070)
    GSIg1 = 1662873 + 1 -- get supplies (cash) instantly global ("OR_PSUP_DEL)
    GSIg2 = 1662873 + 2 -- get supplies (coke) instantly global ("OR_PSUP_DEL)
    GSIg3 = 1662873 + 3 -- get supplies (weed) instantly global ("OR_PSUP_DEL)
    GSIg4 = 1662873 + 4 -- get supplies (meth) instantly global ("OR_PSUP_DEL)
    GSIg5 = 1662873 + 5 -- get supplies (documents) instantly global ("OR_PSUP_DEL)
    GSIg6 = 1662873 + 6 -- get supplies (bunker) instantly global ("OR_PSUP_DEL)
    GSIg7 = 1662873 + 7 -- get supplies (acid) instantly global ("OR_PSUP_DEL)
    GVWSg1 = 34328 + 1 -- modify gun van weapon slot 1 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_1")
    GVWSg2 = 34328 + 2 -- modify gun van weapon slot 2 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_2")
    GVWSg3 = 34328 + 3 -- modify gun van weapon slot 3 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_3")
    GVWSg4 = 34328 + 4 -- modify gun van weapon slot 4 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_4")
    GVWSg5 = 34328 + 5 -- modify gun van weapon slot 5 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_5")
    GVWSg6 = 34328 + 6 -- modify gun van weapon slot 6 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_6")
    GVWSg7 = 34328 + 7 -- modify gun van weapon slot 7 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_7")
    GVWSg8 = 34328 + 8 -- modify gun van weapon slot 8 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_8")
    GVWSg9 = 34328 + 9 -- modify gun van weapon slot 9 global ("XM22_GUN_VAN_SLOT_WEAPON_TYPE_9")
    GVTSg1 = 34350 + 1 -- modify gun van throwable slot 1 global ("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_0")
    GVTSg2 = 34350 + 2 -- modify gun van throwable slot 2 global ("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_1")
    GVTSg3 = 34350 + 3 -- modify gun van throwable slot 3 global ("XM22_GUN_VAN_SLOT_THROWABLE_TYPE_2")
    GVWDg = 34339 -- modify gun van weapon discount global ("XM22_GUN_VAN_SLOT_WEAPON_DISCOUNT_0")
    GVTDg = 34354 -- modify gun van throwable discount global ("XM22_GUN_VAN_SLOT_THROWABLE_DISCOUNT_0")
    GVADg = 34358 -- modify gun van armor discount global ("XM22_GUN_VAN_SLOT_ARMOUR_DISCOUNT_0")
    GVSg = 34365 -- modify gun van skins for knife and bat (1490225691)
    ERVg1 = 14936 -- enable removed vehicles global 1 ("ENABLE_LOWRIDER2_VIRGO3")
    ERVg2 = 14941 -- enable removed vehicles global 2 ("ENABLE_LOWRIDER2_SLAMVAN")
    ERVg3 = 17682 -- enable removed vehicles global 3 ("ENABLE_BIKER_DEFILER")
    ERVg4 = 17703 -- enable removed vehicles global 4 ("ENABLE_BIKER_RATBIKE")
    ERVg5 = 21304 -- enable removed vehicles global 5 ("ENABLE_XA21")
    ERVg6 = 21309 -- enable removed vehicles global 6 ("ENABLE_NIGHTSHARK")
    ERVg7 = 22103 -- enable removed vehicles global 7 ("ENABLE_ULTRALIGHT")
    ERVg8 = 22122 -- enable removed vehicles global 8 ("ENABLE_LAZER")
    ERVg9 = 23071 -- enable removed vehicles global 9 ("ENABLE_DELUXO")
    ERVg10 = 23098 -- enable removed vehicles global 10 ("ENABLE_KAMACHO")
    ERVg11 = 24292 -- enable removed vehicles global 11 ("ENABLE_HOTRING")
    ERVg12 = 24307 -- enable removed vehicles global 12 ("ENABLE_JESTER3")
    ERVg13 = 35402 -- enable removed vehicles global 13 (1271028567)
    ERVg14 = 35678 -- enable removed vehicles global 14 (-1579554442)
    EDVg1 = 36285 -- enable dripfeed vehicles global 1 (-1457330312)
    EDVg2 = 36304 -- enable dripfeed vehicles global 2 (-605332225)

    MoneyTool = SilentNight:add_submenu("♣ Money Tool")
    LSC = SilentNight:add_submenu("♣ LS Customs Tool")
    UnlockV = SilentNight:add_submenu("♣ Unlock Vehicle Tool")
--OP Loop--

OPLoop = MoneyTool:add_submenu("OP Loop (Safe)")

DefDelay5 = 1
a87 = 1
OPLoop:add_array_item("Delay", {"Default", "Faster", "Flash"},
function()
return a87
end,
function(Del)
if Del == 1 then
    DefDelay5 = 1
elseif Del == 2 then
    DefDelay5 = 0.66
elseif Del == 3 then
    DefDelay5 = 0.33
end
a87 = Del
end)

MoneyCount3 = 0
DefCash3 = 0
a90 = 0
OPLoop:add_int_range("Required Cash (0 - inf)", 1000000, 0, 2147483646,
function()
return a90
end,
function(ReqCash)
DefCash3 = ReqCash
a90 = ReqCash
MoneyCount3 = 0
end)

MoneyMade3 = 0
a75 = false
local function OPLoop1()
if not localplayer then
    return
end
while a75 do
    if DefCash3 > 0 then
        if MoneyCount3 >= DefCash3 then
            a75 = false
            a90 = 0
            DefCash3 = 0
            break
        end
    end
    MoneyMade3 = MoneyMade3 + 1000000
    MoneyCount3 = MoneyCount3 + 1000000
    globals.set_int(TTg1, 2147483646)
    globals.set_int(TTg2, 2147483647)
    globals.set_int(TTg3, 0)
    globals.set_int(TTg4, 0)
    globals.set_int(TTg5, 0x615762F1)
    globals.set_int(TTg6, 1000000)
    globals.set_int(TTg, 1)
    sleep(DefDelay5)
end
end
OPLoop:add_toggle("$1m/1s (AFK)", function() return a75 end, function() a75 = not a75 OPLoop1() end)

OPLoop:add_bare_item("",
function()
return "Money Made: $" .. FormatMoney(MoneyMade3)
end, null, null, null)

OPLoop:add_action("", null)

OPLoopNote = OPLoop:add_submenu("Read Me")

OPLoopNote:add_action("                     Required Cash:", null)
OPLoopNote:add_action("     Сhoose amount of money you want", null)
OPLoopNote:add_action("               to get with AFK mode", null)
OPLoopNote:add_action("", null)
OPLoopNote:add_action("                       Money Made:", null)
OPLoopNote:add_action("     Reselect the option to see the result;", null)
OPLoopNote:add_action("       works better with «Default» delay", null)

--Plate Num--


CustomPlate = LSC:add_submenu("Custom Plate")

PlateChar = {".", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"}

DefNum21 = PlateChar[1]
DefNum21Cur = 1
CustomPlate:add_array_item("Symbol #1", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    return DefNum21Cur
end
end,
function(NewNum21)
DefNum21 = PlateChar[NewNum21]
DefNum21Cur = NewNum21
end)

DefNum22 = PlateChar[1]
DefNum22Cur = 1
CustomPlate:add_array_item("Symbol #2", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    return DefNum22Cur
end
end,
function(NewNum22)
DefNum22 = PlateChar[NewNum22]
DefNum22Cur = NewNum22
end)

DefNum23 = PlateChar[1]
DefNum23Cur = 1
CustomPlate:add_array_item("Symbol #3", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle()
    then return DefNum23Cur
end
end,
function(NewNum23)
DefNum23 = PlateChar[NewNum23]
DefNum23Cur = NewNum23
end)

DefNum24 = PlateChar[1]
DefNum24Cur = 1
CustomPlate:add_array_item("Symbol #4", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    return DefNum24Cur
end
end,
function(NewNum24)
DefNum24 = PlateChar[NewNum24]
DefNum24Cur = NewNum24
end)

DefNum25 = PlateChar[1]
DefNum25Cur = 1
CustomPlate:add_array_item("Symbol #5", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    return DefNum25Cur
end
end,
function(NewNum25)
DefNum25 = PlateChar[NewNum25]
DefNum25Cur = NewNum25
end)

DefNum26 = PlateChar[1]
DefNum26Cur = 1
CustomPlate:add_array_item("Symbol #6", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    return DefNum26Cur
end
end,
function(NewNum26)
DefNum26 = PlateChar[NewNum26]
DefNum26Cur = NewNum26
end)

DefNum27 = PlateChar[1]
DefNum27Cur = 1
CustomPlate:add_array_item("Symbol #7", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    return DefNum27Cur
end
end,
function(NewNum27)
DefNum27 = PlateChar[NewNum27]
DefNum27Cur = NewNum27
end)

DefNum28 = PlateChar[1]
DefNum28Cur = 1
CustomPlate:add_array_item("Symbol #8", PlateChar,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    return DefNum28Cur
end
end,
function(NewNum28)
DefNum28 = PlateChar[NewNum28]
DefNum28Cur = NewNum28
end)

local function CheckPlate(IfSpace)
if IfSpace == "." then
    return " "
else
    return IfSpace
end
end

CustomPlate:add_bare_item("",
function()
return "Apply Plate: " .. CheckPlate(DefNum21) .. CheckPlate(DefNum22) .. CheckPlate(DefNum23) .. CheckPlate(DefNum24) .. CheckPlate(DefNum25) .. CheckPlate(DefNum26) .. CheckPlate(DefNum27) .. CheckPlate(DefNum28)
end,
function()
if localplayer ~= nil and localplayer:is_in_vehicle() then
    localplayer:get_current_vehicle():set_number_plate_text(DefNum21 .. DefNum22 .. DefNum23 .. DefNum24 .. DefNum25 .. DefNum26 .. DefNum27 .. DefNum28)
end
if b3 == true then
    sleep(1)
    DefNum21Cur = 1
    DefNum22Cur = 1
    DefNum23Cur = 1
    DefNum24Cur = 1
    DefNum25Cur = 1
    DefNum26Cur = 1
    DefNum27Cur = 1
    DefNum28Cur = 1
    DefNum21 = PlateChar[1]
    DefNum22 = PlateChar[1]
    DefNum23 = PlateChar[1]
    DefNum24 = PlateChar[1]
    DefNum25 = PlateChar[1]
    DefNum26 = PlateChar[1]
    DefNum27 = PlateChar[1]
    DefNum28 = PlateChar[1]
end
end, null, null)

b3 = true
CustomPlate:add_toggle("Reset Value", function() return b3 end, function() b3 = not b3 end)

CustomPlate:add_action("", null)

CustomPlateNote = CustomPlate:add_submenu("Read Me")

CustomPlateNote:add_action("                        «.» = space;", null)
CustomPlateNote:add_action("      Use in LSC and buy a plate to save", null)
CustomPlateNote:add_action("", null)
CustomPlateNote:add_action("                        Reset Value:", null)
CustomPlateNote:add_action("    Resets «Apply Plate» value after using", null)


-- Unlock 1.68 vehicles --

UnlockV:add_action("Unlock 1.68 New Vehicles", function()
	globals.set_int(262145 + 36301, 1)
	globals.set_int(262145 + 36286, 1)
	globals.set_int(262145 + 36291, 1)
	globals.set_int(262145 + 36302, 1)
	globals.set_int(262145 + 36296, 1)
	globals.set_int(262145 + 36295, 1)
	globals.set_int(262145 + 36300, 1)
	globals.set_int(262145 + 36293, 1)
	globals.set_int(262145 + 36296, 1)
	globals.set_int(262145 + 36298, 1)
	globals.set_int(262145 + 36292, 1)
	globals.set_int(262145 + 36287, 1)
	globals.set_int(262145 + 36285, 1)
	globals.set_int(262145 + 36297, 1)
	globals.set_int(262145 + 36304, 1)
	globals.set_int(262145 + 36303, 1)
	globals.set_int(262145 + 36289, 1)
	globals.set_int(262145 + 36288, 1)
	globals.set_int(262145 + 36290, 1)
end)
