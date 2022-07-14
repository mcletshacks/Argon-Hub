local Notification =
    loadstring(
    game:HttpGet("https://raw.githubusercontent.com/Jxereas/UI-Libraries/main/notification_gui_library.lua", true)
)()


local ArgonDCInvite = "dsc.gg/argon-hub"

--Notification.new("error", "Error Heading", "Error body message.", "deleteTimeout(3)") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
--Notification.new("success", "Success Heading", "Success body message.", "deleteTimeout(3)") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
--Notification.new("info", "Information Heading", "Information body message.", "deleteTimeout(3)") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
--Notification.new("warning", "Warning Heading", "Warning body message.", "deleteTimeout(3)") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)
--Notification.new("message", "Message Heading", "Message body message.", "deleteTimeout(3)") -- Args(<string> Type, <string> Heading, <string> Body, <boolean?> AutoRemoveNotif, <number?> AutoRemoveTime, <function?> OnCloseFunction)

Notification.new("success", "Argon 3.3", "Argon Hub loaded.", "deleteTimeout(3)")

wait()

Notification.new("info", "Info", "Discord server invite copied to your clipboard.", "deleteTimeout(3)")

wait()

Notification.new(
    "warning",
    "Info!",
    "Please wait 3 seconds befor move after teleport to avoid ban!",
    "deleteTimeout(4)"
)

setclipboard(ArgonDCInvite)
