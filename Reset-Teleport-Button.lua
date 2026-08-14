-- ════════════════════════════════════════════════════════
--  SnowButtons — Velocity Only
--  X = Velocity modify
-- ════════════════════════════════════════════════════════

local Players  = game:GetService("Players")
local UIS      = game:GetService("UserInputService")
local TweenSvc = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local function killCharacter(character)
    local humanoid = character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Dead)
    else
        character:BreakJoints()
    end
end



local ICE = {
    ABYSS        = Color3.fromRGB(  5,   9,  28),
    DEEP         = Color3.fromRGB( 10,  22,  58),
    PURE         = Color3.fromRGB( 80, 168, 238),
    FROST        = Color3.fromRGB(158, 218, 255),
    FLAKE        = Color3.fromRGB(200, 234, 255),
    WHITE        = Color3.fromRGB(230, 245, 255),
    VEL_HOT      = Color3.fromRGB(255, 160,  20),
    VEL_ABYSS    = Color3.fromRGB( 28,  12,   0),
    DRAG_READY   = Color3.fromRGB(120, 225, 255),
    DRAG_GLOW    = Color3.fromRGB( 80, 200, 255),
    TEXT_DIM     = Color3.fromRGB(120, 168, 210),
    TEXT_WHITE   = Color3.new(1, 1, 1),
    STROKE_IDLE  = Color3.fromRGB(255, 255, 255),
    STROKE_VEL   = Color3.fromRGB(255, 180,  30),
}

-- ══════════════════════════════════════════════════════════════════════
--  DIGIT SYSTEM
-- ══════════════════════════════════════════════════════════════════════

local SPEC = {
    { text="80085",       col=Color3.fromRGB( 50,220, 80),  type="green",   sz=5  },
    { text="043d8c5",     col=Color3.fromRGB(170, 60,255),  type="enchant", sz=4  },
    { text="34494",       col=Color3.fromRGB(200, 80,255),  type="enchant", sz=4  },
    { text="16/16/16",    col=Color3.fromRGB(100,100,100),  type="bytes",   sz=4  },
    { text="24/7",        col=Color3.fromRGB(  0,255,220),  type="always",  sz=5  },
    { text="192.168.0.1", col=Color3.fromRGB( 80,220,120),  type="ip",      sz=4  },
    { text="+380",        col=Color3.fromRGB(  0,160,255),  type="phone",   sz=5  },
    { text="+7",          col=Color3.fromRGB(220, 50, 50),  type="phone",   sz=7  },
    { text="+34",         col=Color3.fromRGB(255,195,  0),  type="phone",   sz=6  },
    { text="+49",         col=Color3.fromRGB(220,180,  0),  type="phone",   sz=6  },
    { text="12277",       col=Color3.fromRGB(180,255,120),  type="lime",    sz=5  },
    { text="10000",       col=Color3.fromRGB(255,255,255),  type="ultra",   sz=5  },
    { text="0451",        col=Color3.fromRGB( 70,120,200),  type="sys",     sz=5  },
    { text="h3006",       col=Color3.fromRGB(150,120,255),  type="enchant", sz=4  },
    { text="3057",        col=Color3.fromRGB(120,100,255),  type="enchant", sz=5  },
    { text="9000",        col=Color3.fromRGB(255,120, 20),  type="over9k",  sz=6  },
    { text="8888",        col=Color3.fromRGB(255, 60, 60),  type="lucky8",  sz=6  },
    { text="8192",        col=Color3.fromRGB( 40, 80,200),  type="pow2",    sz=6  },
    { text="8000",        col=Color3.fromRGB(255,100,200),  type="rose",    sz=6  },
    { text="7890",        col=Color3.fromRGB( 40,255,160),  type="seq",     sz=6  },
    { text="7777",        col=Color3.fromRGB(255,230,  0),  type="gold7",   sz=6  },
    { text="5/7",         col=Color3.fromRGB(140,180, 60),  type="meme",    sz=5  },
    { text="7000",        col=Color3.fromRGB(200,160,  0),  type="gold",    sz=6  },
    { text="6969",        col=Color3.fromRGB(255, 50,150),  type="pink",    sz=6  },
    { text="6767",        col=Color3.fromRGB(255,140, 40),  type="amber",   sz=6  },
    { text="6000",        col=Color3.fromRGB(220, 30, 30),  type="blood",   sz=6  },
    { text="5318008",     col=Color3.fromRGB(255,100,200),  type="pink",    sz=5  },
    { text="5000",        col=Color3.fromRGB(255,170,  0),  type="amber",   sz=6  },
    { text="4444",        col=Color3.fromRGB( 70,200,255),  type="blue",    sz=6  },
    { text="4096",        col=Color3.fromRGB( 80, 60,220),  type="pow2",    sz=6  },
    { text="4000",        col=Color3.fromRGB( 20, 80,200),  type="blue",    sz=6  },
    { text="3434",        col=Color3.fromRGB(  0,200,160),  type="teal",    sz=6  },
    { text="3333",        col=Color3.fromRGB(160,160,160),  type="bw",      sz=6  },
    { text="3147",        col=Color3.fromRGB(160, 80,255),  type="violet",  sz=6  },
    { text="3131",        col=Color3.fromRGB(255,120,100),  type="coral",   sz=6  },
    { text="3008",        col=Color3.fromRGB(255,135, 20),  type="amber",   sz=6  },
    { text="3000",        col=Color3.fromRGB(255,120,  0),  type="amber",   sz=6  },
    { text="2487",        col=Color3.fromRGB(150, 60,255),  type="violet",  sz=6  },
    { text="2319",        col=Color3.fromRGB(255,220,  0),  type="yellow",  sz=6  },
    { text="2222",        col=Color3.fromRGB(180, 80,255),  type="violet",  sz=6  },
    { text="2137",        col=Color3.fromRGB(255,215,  0),  type="gold",    sz=6  },
    { text="2048",        col=Color3.fromRGB(255,180,  0),  type="amber",   sz=6  },
    { text="2026",        col=Color3.fromRGB(255,220, 80),  type="year",    sz=6  },
    { text="2025",        col=Color3.fromRGB(220,200, 80),  type="year",    sz=6  },
    { text="2024",        col=Color3.fromRGB(200,220, 80),  type="year",    sz=6  },
    { text="2023",        col=Color3.fromRGB(180,220,100),  type="year",    sz=6  },
    { text="2022",        col=Color3.fromRGB(100,200,255),  type="year",    sz=6  },
    { text="2021",        col=Color3.fromRGB( 80,180,255),  type="year",    sz=6  },
    { text="2020",        col=Color3.fromRGB( 80,220,120),  type="year",    sz=6  },
    { text="2019",        col=Color3.fromRGB(255,160, 80),  type="year",    sz=6  },
    { text="2018",        col=Color3.fromRGB(255,140, 60),  type="year",    sz=6  },
    { text="2017",        col=Color3.fromRGB(255,120, 60),  type="year",    sz=6  },
    { text="2016",        col=Color3.fromRGB(255,100, 80),  type="year",    sz=6  },
    { text="2015",        col=Color3.fromRGB(200, 80,200),  type="year",    sz=6  },
    { text="2014",        col=Color3.fromRGB(180, 60,200),  type="year",    sz=6  },
    { text="2013",        col=Color3.fromRGB(160, 60,180),  type="year",    sz=6  },
    { text="2012",        col=Color3.fromRGB(140, 60,160),  type="year",    sz=6  },
    { text="2011",        col=Color3.fromRGB(120, 60,140),  type="year",    sz=6  },
    { text="2010",        col=Color3.fromRGB(100, 60,120),  type="year",    sz=6  },
    { text="2009",        col=Color3.fromRGB(120, 80,180),  type="year",    sz=6  },
    { text="2008",        col=Color3.fromRGB(100, 80,200),  type="year",    sz=6  },
    { text="2007",        col=Color3.fromRGB( 80,100,220),  type="year",    sz=6  },
    { text="2006",        col=Color3.fromRGB( 60,120,220),  type="year",    sz=6  },
    { text="2005",        col=Color3.fromRGB( 60,140,220),  type="year",    sz=6  },
    { text="2004",        col=Color3.fromRGB( 60,160,200),  type="year",    sz=6  },
    { text="2003",        col=Color3.fromRGB( 60,180,180),  type="year",    sz=6  },
    { text="2002",        col=Color3.fromRGB( 60,200,160),  type="year",    sz=6  },
    { text="2001",        col=Color3.fromRGB(160,100,255),  type="year",    sz=6  },
    { text="2000",        col=Color3.fromRGB(100,255, 60),  type="lime",    sz=6  },
    { text="1939",        col=Color3.fromRGB(150,140,110),  type="history", sz=6  },
    { text="1488",        col=Color3.fromRGB(180,110, 40),  type="brown",   sz=6  },
    { text="146%",        col=Color3.fromRGB(200,100,255),  type="percent", sz=6  },
    { text="1414",        col=Color3.fromRGB(  0,200,255),  type="blue",    sz=7  },
    { text="1337",        col=Color3.fromRGB(200, 80,255),  type="rainbow", sz=7  },
    { text="1313",        col=Color3.fromRGB(180, 10, 10),  type="blood",   sz=7  },
    { text="1234",        col=Color3.fromRGB( 80,240,220),  type="cyan",    sz=7  },
    { text="1212",        col=Color3.fromRGB(255, 80,200),  type="pink",    sz=7  },
    { text="1111",        col=Color3.fromRGB(255,220, 80),  type="yellow",  sz=7  },
    { text="1024",        col=Color3.fromRGB(100, 50,255),  type="pow2",    sz=7  },
    { text="10/10",       col=Color3.fromRGB(255,210,  0),  type="gold",    sz=6  },
    { text="1000",        col=Color3.fromRGB(255,200, 50),  type="gold",    sz=7  },
    { text="999",         col=Color3.fromRGB(  0,230,200),  type="teal",    sz=7  },
    { text="1000-7",      col=Color3.fromRGB(255,100, 20),  type="meme",    sz=6  },
    { text="900",         col=Color3.fromRGB(160,  0, 40),  type="blood",   sz=7  },
    { text="888",         col=Color3.fromRGB(255,105,180),  type="pink",    sz=7  },
    { text="800",         col=Color3.fromRGB(200, 40, 40),  type="blood",   sz=7  },
    { text="777",         col=Color3.fromRGB(255,210,  0),  type="gold",    sz=7  },
    { text="700",         col=Color3.fromRGB(180,150,  0),  type="gold",    sz=7  },
    { text="007",         col=Color3.fromRGB(255,215,  0),  type="spy",     sz=7  },
    { text="666",         col=Color3.fromRGB(200, 10, 10),  type="blood",   sz=7  },
    { text="600",         col=Color3.fromRGB(  0,180,160),  type="teal",    sz=7  },
    { text="555",         col=Color3.fromRGB(255,160, 30),  type="amber",   sz=7  },
    { text="516",         col=Color3.fromRGB( 80,200,180),  type="teal",    sz=7  },
    { text="505",         col=Color3.fromRGB(255, 60, 60),  type="blood",   sz=7  },
    { text="504",         col=Color3.fromRGB(100,140,220),  type="blue",    sz=7  },
    { text="500",         col=Color3.fromRGB(255,130,  0),  type="amber",   sz=7  },
    { text="49.5",        col=Color3.fromRGB(255,200, 80),  type="yellow",  sz=7  },
    { text="444",         col=Color3.fromRGB( 77,184,255),  type="blue",    sz=7  },
    { text="420",         col=Color3.fromRGB( 80,200, 60),  type="green",   sz=7  },
    { text="12:00",       col=Color3.fromRGB(180, 60,200),  type="enchant", sz=6  },
    { text="7:00",        col=Color3.fromRGB( 90,180,255),  type="enchant", sz=6  },
    { text="4:20",        col=Color3.fromRGB( 60,230, 40),  type="green",   sz=7  },
    { text="4:19",        col=Color3.fromRGB(130, 40,220),  type="enchant", sz=7  },
    { text="410",         col=Color3.fromRGB(180,180,180),  type="bw",      sz=7  },
    { text="404",         col=Color3.fromRGB( 57,255, 20),  type="toxic",   sz=7  },
    { text="400",         col=Color3.fromRGB( 40,100,255),  type="blue",    sz=7  },
    { text="333",         col=Color3.fromRGB(188,188,188),  type="bw",      sz=6  },
    { text="322",         col=Color3.fromRGB(160, 40,255),  type="violet",  sz=6  },
    { text="303",         col=Color3.fromRGB(240,245,255),  type="white",   sz=6  },
    { text="300",         col=Color3.fromRGB(255,100,140),  type="pink",    sz=7  },
    { text="267",         col=Color3.fromRGB(  0,210,190),  type="teal",    sz=7  },
    { text="256",         col=Color3.fromRGB( 50,100,255),  type="blue",    sz=7  },
    { text="228",         col=Color3.fromRGB( 80,200, 60),  type="weed",    sz=7  },
    { text="224",         col=Color3.fromRGB(255,140, 40),  type="amber",   sz=7  },
    { text="222",         col=Color3.fromRGB(160, 60,255),  type="violet",  sz=7  },
    { text="200",         col=Color3.fromRGB(100,255,100),  type="green",   sz=7  },
    { text="128",         col=Color3.fromRGB(  0,220,255),  type="cyan",    sz=7  },
    { text="117",         col=Color3.fromRGB( 80,200, 80),  type="green",   sz=7  },
    { text="111",         col=Color3.fromRGB(200,210,225),  type="silver",  sz=7  },
    { text="100",         col=Color3.fromRGB(255,215,  0),  type="gold",    sz=7  },
    { text="99",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="96",          col=Color3.fromRGB(160,  0,200),  type="violet",  sz=7  },
    { text="89",          col=Color3.fromRGB(  0,220,180),  type="teal",    sz=7  },
    { text="88",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="83",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="77",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="69",          col=Color3.fromRGB(255, 50,150),  type="pink",    sz=7  },
    { text="67",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="66",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="64",          col=Color3.fromRGB(220, 50, 50),  type="blood",   sz=7  },
    { text="56",          col=Color3.fromRGB(120,200, 80),  type="green",   sz=7  },
    { text="55",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="54",          col=Color3.fromRGB(180,200,100),  type="lime",    sz=7  },
    { text="52",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="49",          col=Color3.fromRGB(255,140,  0),  type="amber",   sz=7  },
    { text="47",          col=Color3.fromRGB(130,140,130),  type="bw",      sz=7  },
    { text="44",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="42",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="34",          col=Color3.fromRGB( 50,220, 80),  type="green",   sz=7  },
    { text="33",          col=Color3.fromRGB(160,160,180),  type="silver",  sz=7  },
    { text="32",          col=Color3.fromRGB(  0,255,140),  type="cyan",    sz=7  },
    { text="31",          col=Color3.fromRGB(255, 50,100),  type="coral",   sz=7  },
    { text="27",          col=Color3.fromRGB(200,160, 40),  type="gold",    sz=7  },
    { text="24",          col=Color3.fromRGB(120,220,255),  type="blue",    sz=7  },
    { text="23",          col=Color3.fromRGB(255,200,100),  type="yellow",  sz=7  },
    { text="22",          col=Color3.fromRGB(100,180,255),  type="blue",    sz=7  },
    { text="10+9=21",     col=Color3.fromRGB(255,150, 80),  type="coral",   sz=5  },
    { text="19",          col=Color3.fromRGB(180,255, 60),  type="lime",    sz=7  },
    { text="16",          col=Color3.fromRGB( 30,150,255),  type="blue",    sz=7  },
    { text="14",          col=Color3.fromRGB(100,220,200),  type="teal",    sz=7  },
    { text="13",          col=Color3.fromRGB(200, 80,255),  type="violet",  sz=7  },
    { text="12",          col=Color3.fromRGB( 80,200,230),  type="cyan",    sz=7  },
    { text="11",          col=Color3.fromRGB(220,240,255),  type="white",   sz=7  },
}
local SPEC_CHANCE = {
    4/80085, 4/61234, 4/34494, 4/16161, 4/247, 4/19216,
    4/380, 4/7, 4/34, 4/49, 4/12277,
    4/10000, 4/451, 4/53006, 4/3057, 4/9000, 4/8888,
    4/8192, 4/8000, 4/7890, 4/7777, 4/57, 4/7000,
    4/6969, 4/6767, 4/6000, 4/53180, 4/5000, 4/4444,
    4/4096, 4/4000, 4/3434, 4/3333, 4/3147, 4/3131, 4/3008, 4/3000,
    4/2487, 4/2319, 4/2222, 4/2137, 4/2048, 4/2026,
    4/2025, 4/2024, 4/2023, 4/2022, 4/2021, 4/2020,
    4/2019, 4/2018, 4/2017, 4/2016, 4/2015, 4/2014,
    4/2013, 4/2012, 4/2011, 4/2010, 4/2009, 4/2008,
    4/2007, 4/2006, 4/2005, 4/2004, 4/2003, 4/2002,
    4/2001, 4/2000, 4/1939, 4/1488, 4/1460, 4/1414,
    4/1337, 4/1313, 4/1234, 4/1212, 4/1111, 4/1024,
    4/1010, 4/1000, 4/999, 4/993, 4/900, 4/888,
    4/800, 4/777, 4/700, 4/700, 4/666, 4/600,
    4/555, 4/516, 4/505, 4/504, 4/500, 4/495,
    4/444, 4/420, 4/1200, 4/719, 4/420, 4/419,
    4/410, 4/404, 4/400, 4/333, 4/322, 4/303,
    4/300, 4/267, 4/256, 4/228, 4/224, 4/222, 4/200,
    4/128, 4/117, 4/111, 4/100, 4/99, 4/96,
    4/89, 4/88, 4/83, 4/77, 4/69, 4/67, 4/66,
    4/64, 4/56, 4/55, 4/54, 4/52, 4/49,
    4/47, 4/44, 4/42, 4/34, 4/33, 4/32,
    4/31, 4/27, 4/24, 4/23, 4/22, 4/21,
    4/19, 4/16, 4/14, 4/13, 4/12, 4/11,
}

local DIGIT_COLS = {
    Color3.fromRGB(140,200,255),
    Color3.fromRGB( 26,111,255),
    Color3.fromRGB( 80,168,238),
    Color3.fromRGB( 26, 80,200),
}

local RAINBOW_COLS = {
    Color3.fromRGB(255, 80, 80),
    Color3.fromRGB(255,160, 40),
    Color3.fromRGB(255,240, 50),
    Color3.fromRGB( 80,255, 80),
    Color3.fromRGB( 60,220,255),
    Color3.fromRGB( 80, 80,255),
    Color3.fromRGB(200, 60,255),
    Color3.fromRGB(255, 60,200),
}

-- "Enchanted" — мерцающая фиолетово-розово-голубая палитра (как зачарованный предмет)
local ENCHANT_COLS = {
    Color3.fromRGB(170,  60,255),
    Color3.fromRGB(130,  40,220),
    Color3.fromRGB(200,  80,255),
    Color3.fromRGB(255,  90,220),
    Color3.fromRGB(120, 100,255),
    Color3.fromRGB( 90, 180,255),
    Color3.fromRGB(180,  60,200),
    Color3.fromRGB(150, 120,255),
}

local function pickDigit()
    for i, sp in ipairs(SPEC) do
        if math.random() < SPEC_CHANCE[i] then
            return sp.text, sp.col, sp.type, sp.sz
        end
    end
    return tostring(math.random(0, 9)),
           DIGIT_COLS[math.random(#DIGIT_COLS)],
           "regular",
           math.random(4, 8)
end

-- ══════════════════════════════════════════════════════════════════════

local TW = {
    SNAP    = TweenInfo.new(0.08, Enum.EasingStyle.Quad,    Enum.EasingDirection.Out),
    FAST    = TweenInfo.new(0.16, Enum.EasingStyle.Quad,    Enum.EasingDirection.Out),
    MED     = TweenInfo.new(0.30, Enum.EasingStyle.Quad,    Enum.EasingDirection.Out),
    BOUNCE  = TweenInfo.new(0.45, Enum.EasingStyle.Back,    Enum.EasingDirection.Out),
    SPRING  = TweenInfo.new(0.55, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
    RISE    = TweenInfo.new(0.50, Enum.EasingStyle.Back,    Enum.EasingDirection.Out),
    WOBBLE  = TweenInfo.new(0.10, Enum.EasingStyle.Sine,    Enum.EasingDirection.InOut),
}

local function rnd(a, b)       return a + math.random() * (b - a) end
local function lerp(a, b, t)   return a + (b - a) * t             end
local function clamp(v,mn,mx)  return math.max(mn, math.min(mx, v)) end
local function tw(obj, info, props) TweenSvc:Create(obj, info, props):Play() end
local function delay(t, fn)    task.delay(t, fn) end

local function newCorner(parent, r)
    local c = Instance.new("UICorner", parent); c.CornerRadius = UDim.new(0, r); return c
end
local function newStroke(parent, thick, col, trans)
    local s = Instance.new("UIStroke", parent)
    s.Thickness = thick or 2; s.Color = col or ICE.STROKE_IDLE; s.Transparency = trans or 0
    return s
end
local function newGrad(parent, c1, c2, rot)
    local g = Instance.new("UIGradient", parent)
    g.Color = ColorSequence.new{ColorSequenceKeypoint.new(0,c1), ColorSequenceKeypoint.new(1,c2)}
    g.Rotation = rot or 90; return g
end

local gui = Instance.new("ScreenGui")
gui.Name            = "SnowButtonsVel"
gui.Parent          = (gethui and gethui()) or game:GetService("CoreGui")
gui.ResetOnSpawn    = false
gui.ZIndexBehavior  = Enum.ZIndexBehavior.Sibling
gui.IgnoreGuiInset  = true
gui.DisplayOrder    = 999

local CORNER_RADIUS  = 0
local BTN_W, BTN_H   = 78, 50

local function buildSnowButton(cfg)
    local root = Instance.new("Frame")
    root.Name                   = "BtnRoot"
    root.Parent                 = gui
    root.Size                   = UDim2.new(0, BTN_W, 0, BTN_H)
    root.Position               = UDim2.new(cfg.px, 0, cfg.py, 0)
    root.BackgroundColor3       = ICE.ABYSS
    root.BackgroundTransparency = 0
    root.BorderSizePixel        = 0
    root.ZIndex                 = 10
    root.ClipsDescendants       = true
    root.Active                 = true

    local rootGrad   = newGrad(root, Color3.fromRGB(8,20,80), Color3.fromRGB(2,4,28), 130)
    local rootStroke = newStroke(root, 1.6, cfg.strokeIdle, 0)

    -- Drag ring
    local dragRing = Instance.new("Frame")
    dragRing.Name                   = "DragRing"
    dragRing.Parent                 = root
    dragRing.Size                   = UDim2.new(1, 4, 1, 4)
    dragRing.Position               = UDim2.new(0, -2, 0, -2)
    dragRing.BackgroundTransparency = 1.0
    dragRing.BorderSizePixel        = 0
    dragRing.ZIndex                 = 13
    dragRing.Active                 = false
    local dragRingStroke = newStroke(dragRing, 2.8, ICE.DRAG_READY, 1.0)


    -- Drag hint
    local dragHint = Instance.new("TextLabel")
    dragHint.Parent                 = root
    dragHint.Size                   = UDim2.new(1, 0, 0, 10)
    dragHint.Position               = UDim2.new(0, 0, 0.5, -5)
    dragHint.Text                   = "✥ DRAG"
    dragHint.Font                   = Enum.Font.GothamBold
    dragHint.TextSize               = 7
    dragHint.BackgroundTransparency = 1
    dragHint.TextColor3             = ICE.DRAG_READY
    dragHint.TextTransparency       = 1.0
    dragHint.ZIndex                 = 18
    dragHint.Active                 = false

    -- Ice crystals
    local crystalData = {
        { UDim2.new(0, -1, 0, -1),   "❄",  7,  -25, 0.60 },
        { UDim2.new(1, -8, 0, -1),   "*",  6,   20, 0.62 },
        { UDim2.new(0, -1, 1, -8),   "❄",  5,  -42, 0.65 },
        { UDim2.new(1, -7, 1, -7),   "+",  5,   37, 0.63 },
        { UDim2.new(0.5, -5, 0, -1), ".",  5,    0, 0.70 },
        { UDim2.new(0.5, -5, 1, -6), ",",  5,  180, 0.68 },
    }
    local crystals = {}
    for i, cd in ipairs(crystalData) do
        local cr = Instance.new("TextLabel")
        cr.Parent = root; cr.Size = UDim2.new(0, cd[3], 0, cd[3]); cr.Position = cd[1]
        cr.Text = cd[2]; cr.TextSize = cd[3]; cr.Font = Enum.Font.GothamBold
        cr.BackgroundTransparency = 1; cr.TextColor3 = cfg.crystalColor or ICE.FROST
        cr.TextTransparency = cd[5]; cr.Rotation = cd[4]; cr.ZIndex = 14; cr.Active = false
        crystals[i] = { label = cr, baseTrans = cd[5], baseRot = cd[4], baseSize = cd[3] }
    end

    -- Digit particles (60 штук)
    local snowflakes = {}
    for i = 1, 60 do
        local char, col, spType, tsize = pickDigit()
        local sf = Instance.new("TextLabel")
        sf.Parent                 = root
        sf.Size                   = UDim2.new(0, 26, 0, 12)
        sf.Position               = UDim2.new(rnd(0, 0.72), 0, rnd(-0.2, 1.0), 0)
        sf.Text                   = char
        sf.TextSize               = tsize
        sf.Font                   = Enum.Font.Code
        sf.BackgroundTransparency = 1
        sf.TextColor3             = col
        sf.TextTransparency       = spType == "regular" and rnd(0.20, 0.50) or rnd(0.04, 0.18)
        sf.ZIndex                 = 20
        sf.Active                 = false
        sf.TextTransparency       = 1.0  -- скрыты до спауна
        snowflakes[i] = {
            label    = sf,
            active   = false,
            speedY   = rnd(0.007, 0.026),
            startX   = rnd(0, 0.72),
            wobble   = rnd(0, math.pi * 2),
            wSpeed   = rnd(0.15, 0.55),
            spType   = spType,
            huePhase = rnd(0, math.pi * 2),
        }
    end

    -- Main button
    local btn = Instance.new("TextButton")
    btn.Name                    = "Btn"
    btn.Parent                  = root
    btn.Size                    = UDim2.new(1, -4, 1, -4)
    btn.Position                = UDim2.new(0, 2, 0, 2)
    btn.Text                    = ""
    btn.BackgroundColor3        = ICE.DEEP
    btn.BackgroundTransparency  = 0
    btn.BorderSizePixel         = 0
    btn.ZIndex                  = 15
    btn.AutoButtonColor         = false
    local btnGrad   = newGrad(btn, cfg.idleTopColor, cfg.idleBotColor, 112)
    local btnStroke = newStroke(btn, 1.4, cfg.strokeIdle, 0.10)

    -- Icon
    local icon = Instance.new("TextLabel")
    icon.Parent = btn; icon.Size = UDim2.new(0, 30, 0, 30); icon.Position = UDim2.new(0.5,-15,0,3)
    icon.Text = cfg.iconOff; icon.Font = Enum.Font.GothamBlack; icon.TextScaled = true
    icon.BackgroundTransparency = 1; icon.TextColor3 = cfg.iconColor or ICE.FROST
    icon.ZIndex = 16; icon.Active = false
    local iconGrad = Instance.new("UIGradient", icon)
    iconGrad.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, ICE.WHITE),
        ColorSequenceKeypoint.new(0.5, cfg.iconMidColor or ICE.PURE),
        ColorSequenceKeypoint.new(1, cfg.iconColor or ICE.FROST),
    }; iconGrad.Rotation = 45

    -- Label
    local lbl = Instance.new("TextLabel")
    lbl.Parent = btn; lbl.Size = UDim2.new(1,0,0,12); lbl.Position = UDim2.new(0,0,1,-15)
    lbl.Text = cfg.labelText; lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 8
    lbl.BackgroundTransparency = 1; lbl.TextColor3 = ICE.TEXT_DIM; lbl.ZIndex = 16
    lbl.TextXAlignment = Enum.TextXAlignment.Center; lbl.Active = false

    -- Bottom bar
    local bar = Instance.new("Frame")
    bar.Parent = btn; bar.Size = UDim2.new(0.58,0,0,2); bar.Position = UDim2.new(0.21,0,1,-5)
    bar.BackgroundColor3 = cfg.barColor or ICE.PURE; bar.BackgroundTransparency = 0.20
    bar.BorderSizePixel = 0; bar.ZIndex = 16; bar.Active = false
    newGrad(bar, ICE.WHITE, cfg.barColor or ICE.PURE, 0)

    return {
        root=root, btn=btn, btnGrad=btnGrad, btnStroke=btnStroke,
        rootGrad=rootGrad, rootStroke=rootStroke, icon=icon, iconGrad=iconGrad,
        lbl=lbl, bar=bar, snowflakes=snowflakes, crystals=crystals,
        dragRing=dragRing, dragRingStroke=dragRingStroke,
        dragHint=dragHint,
        cfg=cfg,
    }
end

-- ── Build VEL button ──────────────────────────────────
local VEL = buildSnowButton({
    px=0.02, py=0.60,
    idleTopColor = Color3.fromRGB(160, 60,  0), idleBotColor = Color3.fromRGB(28, 10,  0),
    strokeIdle = ICE.STROKE_IDLE, strokeOn = ICE.STROKE_VEL,
    iconOff = "⚡", iconOn = "⚡", labelText = "",
    iconColor = ICE.VEL_HOT, iconMidColor = Color3.fromRGB(255,200,60),
    barColor = ICE.VEL_HOT,
    crystalColor = Color3.fromRGB(255,180,60),
    activeHotColor = ICE.VEL_HOT, activeAbyssColor = ICE.VEL_ABYSS,
    activeStroke = ICE.STROKE_VEL,
    dragFillColor = ICE.DRAG_READY, dragGlow = ICE.DRAG_GLOW,
})
VEL.bar.Visible  = false
VEL.lbl.Visible  = false
VEL.icon.Size    = UDim2.new(0,0,0,0)

-- ══════════════════════════════════════════════════════════════════════
--  PARTICLE LOOPS
-- ══════════════════════════════════════════════════════════════════════
local function startParticles(btnData)
    -- Движение активных частиц
    task.spawn(function()
        local time = 0
        while gui.Parent do
            local dt = task.wait(0.033)
            time = time + dt
            for _, sf in ipairs(btnData.snowflakes) do
                if not sf.active then continue end
                local sl = sf.label
                local py = sl.Position.Y.Scale + sf.speedY * dt * 30
                local wobX = math.sin(time * sf.wSpeed + sf.wobble) * 0.006
                local px   = sf.startX + wobX
                if py > 1.15 then
                    -- Вышла за край — деактивируем
                    sf.active = false
                    sl.TextTransparency = 1.0
                else
                    if sf.spType == "rainbow" then
                        sf.huePhase = sf.huePhase + dt * 5
                        local idx = (math.floor(sf.huePhase * 2.5) % #RAINBOW_COLS) + 1
                        sl.TextColor3 = RAINBOW_COLS[idx]
                    elseif sf.spType == "enchant" then
                        sf.huePhase = sf.huePhase + dt * 3
                        local idx = (math.floor(sf.huePhase * 1.7) % #ENCHANT_COLS) + 1
                        sl.TextColor3 = ENCHANT_COLS[idx]
                    end
                    sl.Position = UDim2.new(clamp(px, 0, 0.72), 0, py, 0)
                end
            end
        end
    end)

    -- Спаун: 12 цифр в секунду, каждая в случайный момент в окне 1000мс
    task.spawn(function()
        while gui.Parent do
            local delays = {}
            for i = 1, 12 do delays[i] = rnd(0, 0.95) end
            table.sort(delays)

            for _, d in ipairs(delays) do
                task.delay(d, function()
                    -- Найдём свободную (неактивную) частицу
                    local candidates = {}
                    for _, sf in ipairs(btnData.snowflakes) do
                        if not sf.active then table.insert(candidates, sf) end
                    end
                    if #candidates == 0 then return end
                    local sf = candidates[math.random(#candidates)]
                    local char, col, spType, tsize = pickDigit()
                    sf.active   = true
                    sf.spType   = spType
                    sf.huePhase = rnd(0, math.pi * 2)
                    sf.speedY   = rnd(0.007, 0.026)
                    sf.wobble   = rnd(0, math.pi * 2)
                    sf.wSpeed   = rnd(0.15, 0.55)
                    local px = rnd(0, 0.72)
                    sf.startX = px
                    local sl = sf.label
                    sl.Text     = char
                    sl.TextSize = tsize
                    sl.TextColor3 = col
                    sl.Position = UDim2.new(clamp(px, 0, 0.72), 0, rnd(-0.20, 0), 0)
                    sl.TextTransparency = spType == "regular"
                        and rnd(0.20, 0.50)
                        or  rnd(0.04, 0.18)
                end)
            end

            task.wait(1.0)
        end
    end)
end

-- Спаун одной цифры в точке экрана при клике (с шансами как у обычных частиц)
local function spawnClickDigit(screenX, screenY)
    local char, col, spType, tsize = pickDigit()
    local lbl = Instance.new("TextLabel")
    lbl.Parent                 = gui
    lbl.Size                   = UDim2.new(0, 30, 0, 14)
    lbl.Position               = UDim2.new(0, screenX - 15, 0, screenY - 7)
    lbl.Text                   = char
    lbl.TextSize               = tsize + 3
    lbl.Font                   = Enum.Font.Code
    lbl.BackgroundTransparency = 1
    lbl.TextColor3             = col
    lbl.TextTransparency       = spType == "regular" and 0.30 or 0.05
    lbl.ZIndex                 = 30
    lbl.Active                 = false

    local speedY    = rnd(35, 65)
    local wobOffset = rnd(0, math.pi * 2)
    local wobSpeed  = rnd(1.5, 3.0)
    local huePhase  = rnd(0, math.pi * 2)
    local startX    = screenX
    local time      = 0

    task.spawn(function()
        while lbl.Parent do
            local dt = task.wait(0.033)
            time = time + dt
            local nx = startX + math.sin(time * wobSpeed + wobOffset) * 14
            local ny = screenY + speedY * time
            lbl.Position = UDim2.new(0, nx - 15, 0, ny - 7)
            if spType == "rainbow" then
                huePhase = huePhase + dt * 5
                local idx = (math.floor(huePhase * 2.5) % #RAINBOW_COLS) + 1
                lbl.TextColor3 = RAINBOW_COLS[idx]
            elseif spType == "enchant" then
                huePhase = huePhase + dt * 3
                local idx = (math.floor(huePhase * 1.7) % #ENCHANT_COLS) + 1
                lbl.TextColor3 = ENCHANT_COLS[idx]
            end
            lbl.TextTransparency = math.min(1.0, time * 1.4)
            if lbl.TextTransparency >= 1.0 then
                lbl:Destroy()
                break
            end
        end
    end)
end

local function startCrystals(btnData)
    task.spawn(function()
        local time = 0
        while gui.Parent do
            time = time + task.wait(0.04)
            for i, cd in ipairs(btnData.crystals) do
                local phase = time * 0.62 + i * 1.1
                local s = 0.5 + 0.5 * math.sin(phase)
                cd.label.TextTransparency = lerp(cd.baseTrans, cd.baseTrans - 0.32, s)
                cd.label.Rotation = cd.baseRot + math.sin(phase * 0.8) * 13
                cd.label.TextSize = math.max(4, math.floor(cd.baseSize * lerp(0.88, 1.0, s) + 0.5))
            end
        end
    end)
end

local function startIconBreathe(btnData)
    task.spawn(function()
        local time = 0
        while gui.Parent do
            time = time + task.wait(0.04)
            btnData.icon.Position = UDim2.new(0.5, -15, 0, lerp(3, 6, 0.5 + 0.5*math.sin(time*0.68)))
        end
    end)
end

startParticles(VEL)
startCrystals(VEL)
startIconBreathe(VEL)

-- ══════════════════════════════════════════════════════════════════════
--  VISUAL EFFECTS
-- ══════════════════════════════════════════════════════════════════════
local function spawnRipple(parent, x, y, color)
    local ripple = Instance.new("Frame")
    ripple.Parent = parent; ripple.Size = UDim2.new(0,6,0,6)
    ripple.Position = UDim2.new(0,x-3,0,y-3); ripple.BackgroundColor3 = color or ICE.PURE
    ripple.BackgroundTransparency = 0.22; ripple.BorderSizePixel = 0
    ripple.ZIndex = 18; ripple.Active = false

    local sz = 94
    TweenSvc:Create(ripple, TweenInfo.new(0.54,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {
        Size=UDim2.new(0,sz,0,sz), Position=UDim2.new(0,x-sz/2,0,y-sz/2), BackgroundTransparency=1.0,
    }):Play()
    game:GetService("Debris"):AddItem(ripple, 0.60)
end

local burstCharsDigit = { "0","1","3","4","6","7","8","9","❄","*" }

local function spawnBurst(parent, color, chars)
    chars = chars or burstCharsDigit
    local cx, cy = BTN_W/2-2, BTN_H/2-2
    for i = 1, 8 do
        local angle = (i-1)*(math.pi*2/8) + rnd(-0.28,0.28)
        local dist  = rnd(16, 36)
        local shard = Instance.new("TextLabel")
        shard.Parent = parent; shard.Size = UDim2.new(0,14,0,11)
        shard.Position = UDim2.new(0,cx-5,0,cy-5)
        shard.Text = chars[math.random(#chars)]; shard.TextSize = math.random(6,10)
        shard.Font = Enum.Font.Code; shard.BackgroundTransparency = 1
        shard.TextColor3 = color or ICE.PURE; shard.TextTransparency = 0
        shard.ZIndex = 19; shard.Active = false; shard.Rotation = 0
        local tx, ty = cx + math.cos(angle)*dist, cy + math.sin(angle)*dist
        TweenSvc:Create(shard, TweenInfo.new(0.52,Enum.EasingStyle.Quad,Enum.EasingDirection.Out), {
            Size=UDim2.new(0,14,0,11), Position=UDim2.new(0,tx-5,0,ty-5), TextTransparency=1.0,
        }):Play()
        game:GetService("Debris"):AddItem(shard, 0.60)
    end
end

local function showDragReady(btnData)
    tw(btnData.dragRingStroke, TW.FAST, { Transparency = 0.0 })
    tw(btnData.dragHint,       TW.FAST, { TextTransparency = 0.18 })
    spawnRipple(btnData.btn, BTN_W/2, BTN_H/2, ICE.DRAG_READY)
    local ox = btnData.root.Position.X.Offset; local oy = btnData.root.Position.Y.Offset
    local sx = btnData.root.Position.X.Scale;  local sy = btnData.root.Position.Y.Scale
    tw(btnData.root, TW.WOBBLE, { Position = UDim2.new(sx,ox+3,sy,oy) })
    delay(0.10, function() tw(btnData.root, TW.WOBBLE, { Position=UDim2.new(sx,ox-3,sy,oy) }) end)
    delay(0.20, function() tw(btnData.root, TW.BOUNCE, { Position=UDim2.new(sx,ox,sy,oy) }) end)
end

local function hideDragReady(btnData)
    tw(btnData.dragRingStroke, TW.MED, { Transparency = 1.0 })
    tw(btnData.dragHint,       TW.MED, { TextTransparency = 1.0 })
end

local pressStates = {}

local function onPressDown(btnData)
    if pressStates[btnData] then return end; pressStates[btnData] = true
    tw(btnData.btn, TW.SNAP, { BackgroundTransparency = 0.22 })
end

local function onPressUp(btnData)
    if not pressStates[btnData] then return end; pressStates[btnData] = false
    tw(btnData.btn, TW.SNAP, { BackgroundTransparency = 0 })
    hideDragReady(btnData)
end

-- ══════════════════════════════════════════════════════════════════════
--  DRAG
-- ══════════════════════════════════════════════════════════════════════
local function makeDraggable(btnData)
    local drag, ds, sp = false, nil, nil
    local moved = false

    btnData.btn.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.Touch
        or i.UserInputType == Enum.UserInputType.MouseButton1 then
            drag = true; ds = i.Position; sp = btnData.root.Position; moved = false
            onPressDown(btnData)
            i.Changed:Connect(function()
                if i.UserInputState == Enum.UserInputState.End then
                    drag = false
                    onPressUp(btnData)
                end
            end)
        end
    end)

    btnData.btn.InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.Touch
                  or i.UserInputType == Enum.UserInputType.MouseMovement) then
            local d = i.Position - ds
            if d.Magnitude > 8 then moved = true end
            btnData.root.Position = UDim2.new(sp.X.Scale, sp.X.Offset+d.X, sp.Y.Scale, sp.Y.Offset+d.Y)
        end
    end)

    return function() return moved end
end

local velMoved = makeDraggable(VEL)

-- ══════════════════════════════════════════════════════════════════════
--  CLICK HANDLER
-- ══════════════════════════════════════════════════════════════════════
VEL.btn.MouseButton1Click:Connect(function()
    if velMoved() then return end
    local touchPos = UIS:GetMouseLocation()
    spawnClickDigit(touchPos.X, touchPos.Y)

    local char = LocalPlayer.Character
    if char then
        -- Сохраняем позицию смерти
        local hrp = char:FindFirstChild("HumanoidRootPart")
        local deathPos = hrp and hrp.Position or nil

        -- Убиваем персонажа
        killCharacter(char)

        -- После респауна телепортируемся на место смерти
        if deathPos then
            local conn
            conn = LocalPlayer.CharacterAdded:Connect(function(newChar)
                conn:Disconnect()
                local newHRP = newChar:WaitForChild("HumanoidRootPart", 10)
                if newHRP then
                    newHRP.CFrame = CFrame.new(deathPos)
                end
            end)
        end
    end
end)



-- ══════════════════════════════════════════════════════════════════════
--  ENTRANCE ANIMATION
-- ══════════════════════════════════════════════════════════════════════
local function spawnEntrance(btnData, waitTime)
    task.spawn(function()
        local op = btnData.root.Position
        btnData.root.Position = UDim2.new(op.X.Scale, op.X.Offset, op.Y.Scale, op.Y.Offset+110)
        btnData.root.BackgroundTransparency = 1.0
        btnData.btn.BackgroundTransparency  = 1.0
        btnData.icon.TextTransparency       = 1.0
        btnData.lbl.TextTransparency        = 1.0
        for _, cd in ipairs(btnData.crystals) do cd.label.TextTransparency = 1.0 end

        task.wait(waitTime)
        tw(btnData.root, TW.RISE, { Position=UDim2.new(op.X.Scale,op.X.Offset,op.Y.Scale,op.Y.Offset), BackgroundTransparency=0 })
        tw(btnData.btn,  TW.MED,    { BackgroundTransparency=0 })
        tw(btnData.icon, TW.BOUNCE, { TextTransparency=0 })
        tw(btnData.lbl,  TW.MED,    { TextTransparency=0 })
        for i, cd in ipairs(btnData.crystals) do
            delay(i*0.055, function() tw(cd.label, TW.SPRING, { TextTransparency=cd.baseTrans }) end)
        end
        delay(0.55, function() end) -- entrance without burst
    end)
end

spawnEntrance(VEL, 0.20)

print("[SnowButtons] готово. X = kill")
