currentPosition = "castle"
edgeLength = 10

Nodes = {}
NodesIndex = {}
Edges = {}
SizeNodes = 1
SizeEdges = 0
StartNode = nil

local function NewNode(name)
	  node = {}
	  node.name = name
  node.isCheck = false
	  node.Pre = nil
	  node.Dist = -1
	  node.vis = false
	  Nodes[SizeNodes] = node
	  NodesIndex[name] = SizeNodes
	  SizeNodes = SizeNodes+1
end

local function NewEdge(Node1,Node2,edgeName,EdgeVal)
	  edge = {}
	  edge.N1 = Node1
	  edge.N2 = Node2
  edge.name = edgeName
	  edge.Dist = EdgeVal
	  Edges[SizeEdges] = edge
	  SizeEdges = SizeEdges+1
end

function SetStartNode(name)
	  Nodes[NodesIndex[name]].Dist = 0
	  StartNode = name
end

local function EdgeConnectsNodes(E,N1,N2)
	  return E.N1 == N1 and E.N2 == N2 or E.N1 == N2 and E.N2 == N1
end

local function GetDistance(N1,N2)
	  for i=0,SizeEdges-1,1 do
	    	if EdgeConnectsNodes(Edges[i],N1,N2) then
	      		return Edges[i].Dist
	    	end
	  end
	  return -1
end

local function GetNumOfUnVisNodes()
	  local NOUVN = 0
	  for i=1,SizeNodes-1,1 do
	    	if not Nodes[i].vis then
	    		NOUVN = NOUVN + 1
	    	end
	  end
	  return NOUVN
end

local function GetAllAdjcentNodes(N,AdjNodes)
	  AdjNodes.size = 0
	  for i=0,SizeEdges-1,1 do
	    	if Edges[i].N1 == N and not Nodes[NodesIndex[Edges[i].N2]].vis then
	      		AdjNodes[AdjNodes.size] = Edges[i].N2
	      		AdjNodes.size = AdjNodes.size + 1
	    	elseif Edges[i].N2 == N and not Nodes[NodesIndex[Edges[i].N1]].vis then
	      		AdjNodes[AdjNodes.size] = Edges[i].N1
	      		AdjNodes.size = AdjNodes.size + 1
	    	end
	  end
end

local function VisitClosestNode()
	  local index=0
	  local Dist=0
	  for i=1,SizeNodes-1,1 do
	    	if not Nodes[i].vis and Nodes[i].Dist >= 0 then
	      		Dist = Nodes[i].Dist
	      		index=i
	      		break
	    	end
	  end
	  for i=1,SizeNodes-1,1 do
	    	if Nodes[i].Dist < Dist and not Nodes[i].vis and Nodes[i].Dist >= 0 then
	      		Dist = Nodes[i].Dist
	      		index = i
	    	end
	  end
	  Nodes[index].vis = true
	  return index
end

function Dijkstra()
	  while GetNumOfUnVisNodes()>0 do
	    	local ClosetsNode = Nodes[VisitClosestNode()]
	    	local MyAdjNodes = {}
	    	GetAllAdjcentNodes(ClosetsNode.name,MyAdjNodes)
	    	local SizeAdj = MyAdjNodes.size
	    	for i=0,SizeAdj-1,1  do
	      		local Distance = ClosetsNode.Dist + GetDistance(ClosetsNode.name,MyAdjNodes[i])
	      		if Nodes[NodesIndex[MyAdjNodes[i]]].Dist >= 0 then
	        			if Distance < Nodes[NodesIndex[MyAdjNodes[i]]].Dist then
	          				Nodes[NodesIndex[MyAdjNodes[i]]].Dist = Distance
	          				Nodes[NodesIndex[MyAdjNodes[i]]].Pre = ClosetsNode.name
	        			end
	        		else
	          			Nodes[NodesIndex[MyAdjNodes[i]]].Dist = Distance
	          			Nodes[NodesIndex[MyAdjNodes[i]]].Pre = ClosetsNode.name
	        		end
	    	end
	  end
end

function tableLength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function GetPathTo(N,Path)
	  local CN = N
	  while CN~=StartNode do
		    local Temp = CN
		
		    table.insert(Path,1,Temp)
		    CN = Nodes[NodesIndex[CN]].Pre
	  end
	  table.insert(Path,1,StartNode)
end

function searchNodeByName(name)
  for i=1, tableLength(Nodes), 1 do
    if Nodes[i].name == name then return Nodes[i] end
  end
end

function getCheckNodes()
  checkedNodes = {}
  count = 1
  for i=1, tableLength(Nodes), 1 do
    if Nodes[i].isCheck then 
      checkedNodes[count] = Nodes[i].name
      count = count+1
    end
  end
  return checkedNodes
end

function checkUserRoute(correctPath)
  userPath = getCheckNodes()
  local userPathSize = tableLength(userPath)
  local correctPathSize = tableLength(correctPath)
  print("okay")
  if userPathSize ~= correctPathSize then return false end
  print("Stessa lunghezza")
  local present = false
  for i=1, userPathSize, 1 do
    for j=1, correctPathSize, 1 do
      print(" CPU: "..correctPath[j])
      if userPath[i] == correctPath[j] then present = true end  -- Ho trovato un elemento che corrisponde
    end
    if not present then return false end
    present = false
  end
  return true
end

--------------------- Main ---------------------

-- Generazione del peso casuale dei cammini
math.randomseed(os.time())

edgeLength = {}

local woodsToCave = math.random(1, 10)
edgeLength[6] = woodsToCave
local woodsToArrive = math.random(1, 10)
edgeLength[7] = woodsToArrive
local montainToCave = math.random(1, 10)
edgeLength[8] = montainToCave
local montainToRiver = math.random(1, 10)
edgeLength[9] = montainToRiver
local caveToRiver = math.random(1, 10)
edgeLength[10] = caveToRiver
local caveToArrive = math.random(1, 10)
edgeLength[11] = caveToArrive
local riverToArrive = math.random(1, 10)
edgeLength[12] = riverToArrive

local castleToHills = math.random(1, 10)
edgeLength[1] = castleToHills
local hillsToWoodenHouse = math.random(1, 10)
edgeLength[2] = hillsToWoodenHouse
local hillsToWoods = math.random(1, 10)
edgeLength[3] = hillsToWoods
local hillsToMontain = math.random(1, 10)
edgeLength[4] = hillsToMontain
local woodenHouseToWoods = math.random(1, 10)
edgeLength[5] = woodenHouseToWoods

-- Creazione dei nodi
NewNode("castle")
NewNode("winter_hills")
NewNode("woods")
NewNode("winter_montains")
NewNode("wooden_house")
NewNode("cave")
NewNode("river")
NewNode("arrive")

-- Creazione degli archi
NewEdge("castle", "winter_hills", "c_h_", castleToHills)
NewEdge("winter_hills","wooden_house", "h_h_", hillsToWoodenHouse)
NewEdge("winter_hills", "woods", "h_w_", hillsToWoods)
NewEdge("winter_hills", "winter_montains", "h_m_", hillsToMontain)
NewEdge("woods", "wooden_house", "w_h_", woodenHouseToWoods)
NewEdge("woods", "cave", "w_c_", woodsToCave)
NewEdge("woods","arrive", "w_ct_", woodsToArrive)
NewEdge("winter_montains", "cave", "m_c_", montainToCave)
NewEdge("winter_montains", "river", "m_r_", montainToRiver)
NewEdge("cave", "river", "c_r_", caveToRiver)
NewEdge("cave", "arrive", "c_ct_", caveToArrive)
NewEdge("river", "arrive", "r_ct_", riverToArrive)
