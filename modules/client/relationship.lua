local config <const> = require 'config.client.relationship'

if #config < 1 then return end

return function()
    CreateThread(function()
        for i = 1, #config do
            local r = config[i]
            if type(r.group1) == 'table' then
                if type(r.group2) == 'table' then
                    for l = 1, #r.group1 do
                        local g1 = r.group1[l]
                        for x = 1, #r.group2 do
                            local g2 = r.group2[x]
                            SetRelationshipBetweenGroups(r.relation, g1, g2)
                        end
                    end
                else
                    for l = 1, #r.group1 do
                        local g1 = r.group1[l]
                        SetRelationshipBetweenGroups(r.relation, g1, r.group2)
                    end
                end
            else
                if type(r.group2) == 'table' then
                    for x = 1, #r.group2 do
                        local g2 = r.group2[x]
                        SetRelationshipBetweenGroups(r.relation, r.group1, g2)
                    end
                else
                    SetRelationshipBetweenGroups(r.relation, r.group1, r.group2)
                end
            end
        end
    end)
end