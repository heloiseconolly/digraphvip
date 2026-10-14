RandomDigraph := function(_, rs, n, p)
	local adj, n, p;

#Checking if p is a valid probability

	if p < 0.0 or p > 1.0 then
	   ErrorNoReturn("the 3rd argument <p> must be between 0 and 1");
	fi;

#Creating list of length n of empty lists 

	adj := List([1...n], i -> []);

#Adding edge between vertices i and j with probability p 

	for i  in [1...n] do 
	   for j in [1...n] do
		q := Float(Random(rs, 0, 2 ^ 52 - 1 + n ^ 2)) / Float(2 ^ 52); #we think adding n^2 will create fine enough resolution for graphs of any reasonable size
		if q < p then
		   Add(adj[i], j);
		fi;
	   od;
	od;
	return DigraphNC(IsMutableDigraph, adj);
end;

	
