# Made By: TJ Developments (TKiljoy & KingJamesTheDev)*


# THANK YOU!
**Thanks For Downloading Our Script! This Script Is A ReCoded Version Of The QBCore Garbage Job With Extended Features.**
**Please Read Below This Message To See Instructions And Guidlines To Our Resources.**


# GuidLines:
**You May NOT Repost This Script On ANY platform Without Our Written Consent To Do So.**
**You May NOT Take This Script And Say The Contents Are Yours And You Made It.**
**You May Make Your Own Addtions To This Script But You May NOT Repost This Script With Your Addtions To ANY Platform.**


# Notes:
* **Just A Little Note That We Are Always Open To Any Additions You Want To Make, But For Them To Be Added Publicly You May** 
* **Send Us These Additions So We Can Add Them To Our Updates With Credits To The Respective Collaborators.**


# Dependencies
* [QBCore-Framework] https://github.com/qbcore-framework
* [QB-Target] https://github.com/BerkieBb/qb-target



# How To Install:

**1:  Before Starting tj-garbagejob You Must Add The Job First, To Do So Go Into [qb]/qb-core/shared/jobs.lua**
    **And Paste The Following**
    ['garbageman'] = {
		label = 'GarbageMan',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Garbage Man',
                payment = 10
            },
        },
	},

**2: For tj-garbagejob to work you must also add this to your [qb]/qb-radialmenu/config.lua under Config.JobInteractions**
    ```lua
    ["garbageman"] = {
        {
            id = 'startroute',
            title = 'Start Route',
            icon = 'car',
            type = 'client',
            event = 'tj-garbagejob:client:startroute',
            shouldClose = true
        }
    },
    ```

**3: Install qb-target as this is a dependency if you want to use 'Third Eye Support"**
    **Info On How To Use Third Eye Support Will Be on The "How To Use" Section Of This README.MD**

**4: Paste tj-garbagejob In Your [qb] Folder In Resources And Ensure It To Your Server.cfg If [qb] Is Not Already Ensured** 






# How To Use:

**1: Open The config.lua

**To Enable Third Eye Support Go Into The config.lua And Set "Config.ToggleThirdEye = false" To "Config.ToggleThirdEye = true"**
