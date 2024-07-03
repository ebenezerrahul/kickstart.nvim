local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local language = 'cpp'
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

local list_snips = function()
  local ft_list = require('luasnip').available()[vim.o.filetype]
  local ft_snips = {}
  for _, item in pairs(ft_list) do
    ft_snips[item.trigger] = item.name
  end
  print(vim.inspect(ft_snips))
end

vim.api.nvim_create_user_command('SnipList', list_snips, {})
vim.keymap.set('i', '<C-c>', function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

ls.add_snippets('all', {
  s(
    'todo',
    fmt(
      [[
        {}
        ]],
      {
        c(1, { t 'TODO', t 'TODO:', t 'DONE', t 'DONE:', t 'WARN:', t 'ERROR:' }),
      }
    )
  ),
})

local fori = s(
  'fori',
  fmt(
    [[
    for(int {} = {}; {} < {};{}++){{
      {}
    }}
    ]],
    {
      i(1, 'i'),
      i(2, '0'),
      rep(1),
      i(3, 'n'),
      rep(1),
      i(0),
    }
  )
)
local beg = s(
  'beg',
  fmt(
    [[

    #include <bits/stdc++.h>
    #define sz(a) ((int)a.size())
    using ch = unsigned char;
    using PII = std::pair<int, int>;
    using ll = int64_t;
    using vi = std::vector<int>;
    using vc = std::vector<ch>;
    using vl = std::vector<ll>;
    using vpii = std::vector<PII>;
    using vvi = std::vector<vi>;
    using vvc = std::vector<vc>;


    template<typename... Args>
    void
    dbg_out_impl(char const* const func,
                 char const* const file,
                 int const& line,
                 Args&&... args)
    {{
        std::cout << func << ' ' << ':' << line;
        ((std::cout << ' ' << args), ...) << '\n';
    }}

    #ifdef ONPC
        #define dbg(...) dbg_out_impl(__func__, __FILE__, __LINE__, __VA_ARGS__)
    #else
        #define dbg(...)
    #endif

    using namespace std;
    // mt19937 rnd(chrono::steady_clock_now().epoch().count());

    void
    solve()
    {{
        {}
    }}

    int32_t
    main()
    {{
        ios::sync_with_stdio(false);
        cin.tie(0);
        int32_t t = 1;
        // std::cin >> t;
        for (int i{{ t }}; t > 0; t--) {{
            solve();
            dbg("-----------------------------------------");
        }}
        dbg("took ", clock() * 1.0 / CLOCKS_PER_SEC, "sec\n");
        return 0;
    }}
    ]],
    {
      i(1),
    }
  )
)

local dbg_impl = s(
  'dbg_impl',
  fmt(
    [[
    template<typename... Args>
    void
    dbg_out_impl(char const* const func,
                 char const* const file,
                 int const& line,
                 Args&&... args)
    {{
        std::cout << func << ' ' << file << ':' << line;
        ((std::cout << ' ' << args), ...) << '\n';
    }}
    #define dbg(...) dbg_out_impl(__func__, __FILE__, __LINE__, __VA_ARGS__)
]],
    {}
  )
)
local make_snippet = ls.parser.parse_snippet
local sort = make_snippet('sort', 'sort(${1:arr}.begin(), $1.end());\n$0')
local all = make_snippet('all', '${1:arr}.begin(), $1.end()')
local mysnippets = { fori, beg, sort, all, dbg_impl }
ls.add_snippets(language, mysnippets)

vim.keymap.set('n', '<leader><leader>s', '<cmd> source ~/.config/nvim/lua/snippets/cf-cpp.lua<CR>')
