SQL = nil

local sql_host = "localhost"
local sql_port = 3306
local sql_user = "root"
local sql_pass = "toor"
local sql_db = "codzombies"


function init_database()
    mariadb_log('debug')

    SQL = mariadb_connect(sql_host .. ":" .. sql_port, sql_user, sql_pass, sql_db )

    if (SQL ~= nil) then
        print("Established Connection to the database sucessfully")
    else
        print("Failed")
        ServerExit()
    end
end
AddEvent("OnPackageStart", init_database)


function cmd_hello(player)
    local query = mariadb_prepare(SQL, "SELECT CURRENT_TIMESTAMP()")
    mariadb_async_query(SQL, query, cb_gettimestamp, player)
end
AddCommand("hello", cmd_hello)

function cb_gettimestamp(player)
    local timestamp = mariadb_get_value_index(1, 1)
    AddPlayerChat(player, "Hello World we are currently on " .. timestamp)
end