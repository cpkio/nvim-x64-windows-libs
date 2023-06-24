-- ^\\s*\\%(\\(-\\|\\*\\|#\\)\\|\\(\\C\\%(\\d\\+)\\|\\d\\+\\.\\|[ivxlcdm]\\+)\\|[IVXLCDM]\\+)\\|\\l\\{1,2})\\|\\u\\{1,2})\\)\\)\\)\\s\\+\\%(\\[\\([ ¼½¾X-]\\)\\]\\s\\)\\?

function string:flp_start()
  return self .. "\\_^\\s*"
end

function string:flp_end()
  return self .. "\\s\\+"
end

function string:flp_sep()
  return self .. [[\|]]
end

function string:flp_group(pattern)
  return self .. "\\%(" .. pattern .. "\\)"
end

function string:flp_bullet()
  return self .. [[\%(-\|\*\|\#\|—\|·\|•|‣\)]]
end

function string:flp_numlist()
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

function string:flp_alphalist()
  return self .. [[[абвгдежзиклмнопрстуфхцчшщэюя])]]
end
