-- Settaglio elementi grafici visibili in gioco
-- Pongo inizialmente tutti gli oggetti come invisibili
for i=0,11,1 do
    for j=1,10,1 do
      getObject("Objects["..Edges[i].name..j.."]"):setValue(VObjectVisibility,100)
    end
end
for i=0,11,1 do
    for j=1,10,1 do
      getObject("Objects["..Edges[i].name..j.."]"):setValue(VObjectVisibility,-100)
    end
end

-- Rendo visibili solo gli elementi necessari
for i=0,11,1 do
    for j=1,10,1 do
      if edgeLength[i+1] == j then getObject("Objects["..Edges[i].name..j.."]"):setValue(VObjectVisibility,100) end
    end
end

-- Applicazione di dijkstra
SetStartNode("winter_hills")

Dijkstra()

myPath = {}
GetPathTo("arrive", myPath)
