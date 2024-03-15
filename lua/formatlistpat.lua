-- ^\\s*\\%(\\(-\\|\\*\\|#\\)\\|\\(\\C\\%(\\d\\+)\\|\\d\\+\\.\\|[ivxlcdm]\\+)\\|[IVXLCDM]\\+)\\|\\l\\{1,2})\\|\\u\\{1,2})\\)\\)\\)\\s\\+\\%(\\[\\([ ¼½¾X-]\\)\\]\\s\\)\\?

function string:on()
  return self .. "\\_^\\s*"
end

function string:off()
  return self .. "\\s\\+"
end

function string:separator()
  return self .. [[\|]]
end

function string:group(pattern)
  return self .. "\\%(" .. pattern .. "\\)"
end

function string:bullets()
  return self .. [[\%(-\|\*\|\#\|—\|·\|•|‣\)]]
end

function string:numlist()
  return self .. [[\d\+\%(\.\d\+\)*\.\|\d\+)\|\d\+\.]]
  -- \(
  --  \C\%(
  --      \d\+)\|
  --      \d\+\. \|
  --      [ivxlcdm]\+)\|
  --      [IVXLCDM]\+)\|
  --      \l\{1,2})\|
  --      \u\{1,2})
  --    \)
  -- \)
end

function string:alphalist()
  return self .. [[[абвгдежзиклмнопрстуфхцчшщэюя])]]
end

function string:section()
  return self .. [[[A-ZА-Я]\+\([-_#]\(\d\|[A-Z]\|_\|?\|\*\)\)\+\.]]
end
