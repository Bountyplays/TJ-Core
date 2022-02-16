-- Before Using This Config Please Look At The README.MD Provided

Config = {}

-- Set To True If You Want To Toggle QBTarget (Third Eye Support)
Config.ToggleThirdEye = false

-- Set To False If You Do Not Want Players To Recive Items When Picking Up Trash
Config.ToggleReciveItems = true

-- Change How Much Money A Player Can Make Per Stop
Config.MoneyPerStop = 110

-- If ToggleReciveItems Is Set To "True" Players Can Find The Listed Items Below
-- NOTE! Add Items By Their Names In QBCore Shared Items.lua
Config.Items = {

}

-- Locations Of All The Trash Objectives, To Add New Locations Add The Vector4 Coords.
Config.Locations = {
    [1] = {
        name = "Location1",
        coords = vector4(789.01, -809.14, 26.21, 344.33),
        name = "Location2",
        coords = vector4(318.25, -182.23, 57.46, 129.99),
        name = "Location3",
        coords = vector4(-101.57, 45.68, 71.81, 227.26),
        name = "Location4",
        coords = vector4(-592.48, 245.02, 82.32, 173.03),
        name = "Location5",
        coords = vector4(-407.94, 295.07, 83.83, 265.82),
        name = "Location6",
        coords = vector4(-178.94, 203.87, 87.81, 190.98),
        name = "Location7",
        coords = vector4(-1177.91, -747.75, 20.26, 141.96),
        name = "Location8",
        coords = vector4(-1298.6, -622.87, 26.93, 122.12),
        name = "Location9",
        coords = vector4(-1990.24, -487.19, 12.33, 207.29),
        name = "Location10",
        coords = vector4(-1647.04, -984.93, 7.57, 143.21),
    },
}