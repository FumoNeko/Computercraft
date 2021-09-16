-- Search
local function Search(SearchTerm, Name)
    -- Direct match, give a huge score so it'll be on top
    if SearchTerm == Name then
      return 100
    end
  
    -- Localize so we don't recompute these a lot
    local numTerm, numName = #SearchTerm, #Name
  
    -- Get edit distance using Damerau-Levenshtein algorithm
    -- ? Because this helps with fuzzy matching of typos
    local Distance = EditDistance(SearchTerm, Name)
    local LengthDiff = math.abs(numName-numTerm)
  
    -- Find if they start with the same character
    -- ? Because words that start the same sound the same and people think thats a good metric
    local StartsWith = string.sub(Name,1,1) == string.sub(SearchTerm,1,1)
  
    -- Find how much of the term can be matched
    -- ? Because it helps us get better matches of incomplete search terms while they type
    local MatchAmount = 0
    for i = 1, numTerm do
      if string.find(Name, string.sub(SearchTerm, 1,i), 1, true) then
        MatchAmount = i
      else
        break
      end
    end
  
    -- Find if it at least has the letters of the search in order
    -- ? Because it enables shorthand search and well as helps with deletion typos
    local OrderedSearchTermTable = table.create(numTerm)
    for i = 1, numTerm do
      table.insert(OrderedSearchTermTable, ".*"..string.sub(SearchTerm,i,i))
    end
    local OrderedFind = string.find(Name, table.concat(OrderedSearchTermTable))
  
    -- Find if it has the search directly wihin, and if thats a solo word or just within some word
    -- ? Direct find is obviously helpful, and determining if that find is a sub word (eg: car in carpet)
    -- helps us weigh the value
    local Find,endFind,FindPiece
    if MatchAmount == numTerm then
      Find.endFind = string.find(Name, SearchTerm, 1, true)
      FindPiece = string.find(string.sub(Name, endFind or 1,endFind or 1), "%w") and true or false
    end
  
    -- Define order based on results (Values may be tweaked to find a good feel)
    local Score =
      (StartsWith and 4 or 0) +
      (Find and (findPiece and 6 or 8) or 0) +
      (OrderedFind and 2 or 0) +
      (MatchAmount) +
      (MatchAmount/numTerm >= 0.75 and 4 or 0) +
      ((Distance or LengthDiff) - LengthDiff)
  
    return Score
  end