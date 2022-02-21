require('orgmode').setup_ts_grammar()

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    -- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
	org_agenda_files = {'~/org/agenda/*',},
	org_default_notes_file = '~/org/agenda/nodes.org',
	org_todo_keywords = { 'TODO(t)', 'NEXT(n)', 'WAIT(w)', '|', 'DONE(d)' },
	-- org_todo_keyword_faces = {},
	org_deadline_warning_days = 14,
	org_agenda_min_height = 16,
	org_agenda_span = 'week', -- day/week/month/year/number of days
	org_agenda_start_on_weekday = 6,
	org_agenda_start_day = nil, -- start from today + this modifier
	org_agenda_templates = {
		t = {
			description = 'TODO',
			template = '* TODO %?\n  %U', target = '~/org/agenda/todo.org',
		},
		n = {
			description = '笔记',
			template = '\n*** %<%Y-%m-%d> %<%A>\n**** %a\n**** %U\n\n* %^{PROMPT}\n%?', target = '~/org/notes/notes.org',
		},
		c = {
			description = 'tcpl',
			template = '\n*** %<%Y-%m-%d> %<%A>\n** 第%^{PROMPT}章\n*** %?', target = '~/org/notes/tcpl.org',
		},
		w = {
			description = 'Englsih Words',
			template = '\n*** %<%Y-%m-%d> %<%A>\n\n** %?', target = '~/org/notes/words.org',
		},
		g = {
			description = 'Englsih Grammer',
			template = '\n*** %<%Y-%m-%d> %<%A>\n\n** %?', target = '~/org/notes/grammer.org',
		},
	},
	org_agenda_skip_scheduled_if_done = false,
	org_agenda_skip_deadline_if_done = false,
	org_agenda_text_search_extra_files = {},
	org_priority_highest = 'A',
	org_priority_default = 'B',
	org_priority_lowest = 'C',
	org_archive_location = '%s_archive::',
	org_use_tag_inheritance = true,
	org_tags_exclude_from_inheritance = {},
	org_hide_leading_stars = true,
	org_hide_emphasis_markers = true,
	org_ellipsis = '...',
	org_log_done = 'time',
	org_highlight_latex_and_related = "native",
	org_custom_exports = {
		h = {
		label = '导出为 HTML 格式',
		action = function(exporter)
			local current_file = vim.api.nvim_buf_get_name(0)
			local target = vim.fn.fnamemodify(current_file, ':t:r')..'.html'
			local command = {'pandoc', current_file, '-o ~/org/html/', target, '&& echo "[', vim.fn.fnamemodify(current_file, ':t:r') ,'](./', target, ')" >> ~/org/html/index.html'}
			local on_success = function(output)
			print('导出成功了，嘿嘿！！')
			vim.api.nvim_echo({{ table.concat(output, '\n') }}, true, {})
			end
			local on_error = function(err)
			print('导出失败咯！！')
			vim.api.nvim_echo({{ table.concat(err, '\n'), 'ErrorMsg' }}, true, {})
			end
			return exporter(command , target, on_success, on_error)
		end
		}
	},
	org_indent_mode = 'indent',
	org_time_stamp_rounding_minutes = 5,
	org_blank_before_new_entry = {
		heading = true,
		plain_list_item = false,
	},
	org_src_window_setup = 'top 16new',
	org_edit_src_content_indentation = 8,
	diagnostics = true,
	notifications = {
		enabled = false,
		cron_enabled = true,
		repeater_reminder_time = false,
		deadline_warning_reminder_time = 0,
		reminder_time = 10,
		deadline_reminder = true,
		scheduled_reminder = true,
	},
	mappings = {
		disable_all = false,
		global = {
		org_agenda = '<Leader>oa',
		org_capture = '<Leader>oc',
	},
	agenda = {
	org_agenda_later = 'f',
	org_agenda_earlier = 'b',
	org_agenda_goto_today = '.',
	org_agenda_day_view = 'vd',
	org_agenda_week_view = 'vw',
	org_agenda_month_view = 'vm',
	org_agenda_year_view = 'vy',
	org_agenda_quit = 'q',
	org_agenda_switch_to = '<CR>',
	org_agenda_goto = { '<TAB>' },
	org_agenda_goto_date = 'J',
	org_agenda_redo = 'r',
	org_agenda_todo = 't',
	org_agenda_clock_goto = '<leader>oxj',
	org_agenda_set_effort = '<leader>oxe',
	org_agenda_clock_in = 'I',
	org_agenda_clock_out = 'O',
	org_agenda_clock_cancel = 'X',
	org_agenda_clockreport_mode = 'R',
	org_agenda_priority = '<leader>o,',
	org_agenda_priority_up = '+',
	org_agenda_priority_down = '-',
	org_agenda_toggle_archive_tag = '<Leader>oA',
	org_agenda_set_tags = '<Leader>ot',
	org_agenda_deadline = '<Leader>oid',
	org_agenda_schedule = '<Leader>ois',
	org_agenda_filter = '/',
	org_agenda_show_help = 'g?',
	},
	capture = {
	org_capture_finalize = '<C-c>',
	org_capture_refile = '<Leader>or',
	org_capture_kill = '<Leader>ok',
	org_capture_show_help = 'g?',
	},
	org = {
	org_refile = '<Leader>or',
	org_timestamp_up_day = '<S-UP>',
	org_timestamp_down_day = '<S-DOWN>',
	org_timestamp_up = '<C-a>',
	org_timestamp_down = '<C-x>',
	org_change_date = 'cid',
	org_priority = '<Leader>o,',
	org_priority_up = 'ciR',
	org_priority_down = 'cir',
	org_todo = 'cit',
	org_todo_prev = 'ciT',
	org_toggle_checkbox = '<C-Space>',
	org_toggle_heading = '<Leader>o*',
	org_open_at_point = '<Leader>oo',
	org_edit_special = [[<Leader>o']],
	org_cycle = '<TAB>',
	org_global_cycle = '<S-TAB>',
	org_archive_subtree = '<Leader>o$',
	org_set_tags_command = '<Leader>ot',
	org_toggle_archive_tag = '<Leader>oA',
	org_do_promote = '<<',
	org_do_demote = '>>',
	org_promote_subtree = '<s',
	org_demote_subtree = '>s',
	org_meta_return = '<Leader><CR>', -- Add headling, item or row
	org_insert_heading_respect_content = '<Leader>oih', -- Add new headling after current heading block with same level
	org_insert_todo_heading = '<Leader>oiT', -- Add new todo headling right after current heading with same level
	org_insert_todo_heading_respect_content = '<Leader>oit', -- Add new todo headling after current heading block on same level
	org_move_subtree_up = '<Leader>oK',
	org_move_subtree_down = '<Leader>oJ',
	org_export = '<Leader>oe',
	org_next_visible_heading = '}',
	org_previous_visible_heading = '{',
	org_forward_heading_same_level = ']]',
	org_backward_heading_same_level = '[[',
	outline_up_heading = 'g{',
	org_deadline = '<Leader>oid',
	org_schedule = '<Leader>ois',
	org_time_stamp = '<Leader>oi.',
	org_time_stamp_inactive = '<Leader>oi!',
	org_clock_in = '<Leader>oxi',
	org_clock_out = '<Leader>oxo',
	org_clock_cancel = '<leader>oxq',
	org_clock_goto = '<leader>oxj',
	org_set_effort = '<leader>oxe',
	org_show_help = 'g?',
	},
	edit_src = {
	org_edit_src_abort = '<Leader>ok',
	org_edit_src_save = '<Leader>ow',
	org_edit_src_show_help = 'g?',
	},
	text_objects = {
	inner_heading = 'ih',
	around_heading = 'ah',
	inner_subtree = 'ir',
	around_subtree = 'ar',
	inner_heading_from_root = 'Oh',
	around_heading_from_root = 'OH',
	inner_subtree_from_root = 'Or',
	around_subtree_from_root = 'OR',
	},
	},
	emacs_config = {
	executable_path = 'emacs',
	config_path = '$HOME/.emacs.d/init.el',
	},
})
