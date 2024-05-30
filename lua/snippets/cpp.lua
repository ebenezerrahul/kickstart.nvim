local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local language = 'cpp'
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep
-- NOTE: Start Templates

ls.add_snippets(language, {
  s(
    'beg',
    fmt(

      [[
      #include <bits/stdc++.h>
      
      using PII = std::pair<int, int>;
      using ll = int64_t;
      using vi = std::vector<int>;
      using vc = std::vector<char>;
      using vl = std::vector<ll>;
      using vpii = std::vector<PII>;
      using vvi = std::vector<vi>;
      using vvc = std::vector<vc>;
      
      void
      solve()
      {{
      {}
      }}
      
      int32_t
      main()
      {{
        int32_t t;
        std::cin >> t;
        for (int i{{ t }}; t >= 0; t--) {{
          solve();
        }}
        return 0;
      }}
      ]],
      {
        i(1),
      }
    )
  ),
  s('hello', fmt([[std::cout << 'Hello' << endl;]], {})),
  s(
    'leet',
    fmt(
      [[
  #include <bits/stdc++.h>
  using namespace std;
  ]],
      {}
    )
  ),
})
