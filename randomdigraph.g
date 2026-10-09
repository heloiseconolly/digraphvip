RandomDigraph := function(_, n, p)
	local adj, n, p;
	if p < 0.0 or p > 1.0 then
	   ErrorNoReturn("the 3rd argument <p> must be between 0 and 1");
	fi;
	adj := List([1...n], i -> []);
	for i  in [1...n] do 
	   for j in [1...n] do
		q := Float(Random(0, 2 ^ 52 - 1)) / Float(2 ^ 52);
		if q < p then
		   Add(adj[i], j);
		fi;
	   od;
	od;
	return DigraphNC(IsMutableDigraph, adj);
end;

	
