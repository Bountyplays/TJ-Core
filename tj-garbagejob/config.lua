-- Before Using This Config Please Look At The README.MD Provided

Config = {}

-- Set To True If You Want To Toggle QBTarget (Third Eye Support)
Config.ToggleThirdEye = false

-- Set To False If You Do Not Want Players To Recive Items When Picking Up Trash
Config.ToggleReciveItems = true

-- If ToggleReciveItems Is Set To "True" Players Can Find The Listed Items Below
-- NOTE! Add Items By Their Names In QBCore Shared Items.lua
Config.Items = {

}

-- Locations Of All The Trash Objectives, To Add New Locations Add The Vector4 Coords.
Config.Locations = {
    [1] = {
        name = "test",
        coords = vector4(0, 0, 0, 0),
    },
}