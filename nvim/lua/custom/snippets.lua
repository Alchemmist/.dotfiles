local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

ls.add_snippets("python", {
	s("pprint", {
		t({ "from pprint import pprint", "pprint(" }),
		i(1),
		t(")"),
	}),
})

ls.add_snippets("tex", {
	s("not", {
		t({ "\\overline{" }),
		i(1),
		t("}"),
	}),
})

ls.add_snippets("tex", {
	s("fr", {
		t({ "\\frac{" }),
		i(1),
		t("}{"),
		i(2),
		t("}"),
	}),
})


ls.add_snippets("tex", {
	s("an", {
		t({ "\\begin{align}", "\t" }),
		i(1),
		t({ "", "\\end{align}" }),
	}),
})


ls.add_snippets("tex", {
	s("a", {
		t({ "\\begin{align*}", "\t" }),
		i(1),
		t({ "", "\\end{align*}" }),
	}),
})

ls.add_snippets("tex", {
	s("div", {
		t("\\ \\vdots \\ "),
        i(1)
	}),
})

ls.add_snippets("tex", {
	s(">=", {
		t("\\geqslant "),
        i(1)
	}),
})

ls.add_snippets("tex", {
	s("<=", {
		t("\\eqslantless "),
        i(1)
	}),
})

ls.add_snippets("tex", {
	s("<=>", {
		t("\\Leftrightarrow "),
        i(1)
	}),
})

ls.add_snippets("tex", {
	s("->", {
		t("\\longrightarrow "),
        i(1)
	}),
})

ls.add_snippets("tex", {
	s("<-", {
		t("\\longleftarrow "),
        i(1)
	}),
})

ls.add_snippets("tex", {
    s("bf", {
            t("\\textbf{"),
            i(1), 
            t("}")
        }),
})

ls.add_snippets("tex", {
	s("enum", {
		t({ "\\begin{enumerate}", "\t" }),
		i(1),
		t({ "", "\\end{enumerate}" }),
	}),
})

ls.add_snippets("tex", {
	s("sys", {
		t({ "\\begin{cases}", "\t" }),
		i(1),
		t({ "", "\\end{cases}" }),
	}),
})


ls.add_snippets("tex", {
	s("lim", {
		t("\\lim\\limits_{"),
        i(1),
		t(" \\longrightarrow "),
        i(2),
		t("}{"),
        i(3),
		t("} "),
        i(4)
	}),
})


ls.add_snippets("tex", {
	s("8", {
		t("\\infty"),
        i(1)
	}),
})
