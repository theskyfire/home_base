##############################################################################
# config files

gnome-terminal:
	{ \
		set -ex ;\
		gcfg='gconftool-2' ;\
		base='/apps/gnome-terminal' ;\
		function get_schema(){ \
			[[ -n "$${1}" ]] && key="$${1}" ;\
			shift ||: ;\
			schema_path=$$( "$${gcfg}" --get-schema-name "$${key}" ) ;\
			[[ "$${schema_path:0:1}" = '/' ]] ;\
			schema=$$( "$${gcfg}" --get "$${schema_path}" ) ;\
			type="$${schema#*Type: }" ;\
			type="$${type%%$$'\n*'}" ;\
			list_type="$${schema#*List Type: }" ;\
			list_type="$${list_type%%$$'\n*'}" ;\
			car_type="$${schema#*Car Type: }" ;\
			car_type="$${car_type%%$$'\n*'}" ;\
			cdr_type="$${schema#*Cdr Type: }" ;\
			cdr_type="$${cdr_type%%$$'\n*'}" ;\
		} ;\
		function get_val() { \
			[[ -n "$${1}" ]] && key="$${1}" ;\
			shift ||: ;\
			get_schema ;\
			val=$$( "$${gcfg}" --get "$${key}" ) ;\
			case "$${type}" in \
			int|bool|float|string) \
				;; \
			list) \
				val="$${val#[}" ;\
				val="$${val%]}" ;\
				IFS=',' read -a val <<< "$${val}" ;\
				;; \
			pair) \
				val="$${val#(}" ;\
				val="$${val%)}" ;\
				IFS=',' read -a val <<< "$${val}" ;\
				;; \
			*) \
				false ;\
			esac ;\
		} ;\
		function set_val() { \
			[[ -n "$${1}" ]] && key="$${1}" ;\
			shift ||: ;\
			[[ "$${#}" > 0 ]] && val=( "$${@}" ) ;\
			get_schema ;\
			case "$${type}" in \
			int|bool|float|string) \
				echo "$${gcfg} --type $${type} --set $${key} $${val}" ;\
				;; \
			list) \
				val=$$( IFS=, ; echo "[$${val[*]}]" ) ;\
				echo "$${gcfg} --type $${type} --list-type $${list_type} --set $${key} $${val}" ;\
				;; \
			pair) \
				val="($${val[0]},$${val[1]})" ;\
				echo "$${gcfg} --type $${type} --car-type $${car_type} --cdr-type $${cdr_type} --set $${key} $${val}" ;\
				;; \
			*) \
				false ;\
			esac ;\
		} ;\
		declare -A schema_type ;\
		declare -A schema_ltype ;\
		declare -A schema_cartype ;\
		declare -A schema_cdrtype ;\
		declare -A schema_default ;\
		function load_schema() { \
			[[ -n "$${1}" ]] && dir="$${1}" ;\
			exec 3< <( $${gcfg} -a "/schemas$${dir}" ) ;\
			local item ;\
			local def ;\
			local val ;\
			local key ;\
			while read -r -u3 item ; do \
				item="$${item%% *}" ;\
				key="$${dir}/$${item}" ;\
				def=$$( $${gcfg} --get "/schemas$${key}" ) ;\
				val="$${def#*Owner: }" ;\
				val="$${val%%$$'\n*'}" ;\
				[[ $${val} == "gnome-terminal" ]] ;\
				val="$${def#*Type: }" ;\
				val="$${val%%$$'\n*'}" ;\
				schema_type[$${key}]=$${val} ;\
				val="$${def#*List Type: }" ;\
				val="$${val%%$$'\n*'}" ;\
				schema_ltype["$${key}"]="$${val}" ;\
				val="$${def#*Car Type: }" ;\
				val="$${val%%$$'\n*'}" ;\
				schema_cartype["$${key}"]="$${val}" ;\
				val="$${def#*Cdr Type: }" ;\
				val="$${val%%$$'\n*'}" ;\
				schema_cdrtype["$${key}"]="$${val}" ;\
				val="$${def#*Default Value: }" ;\
				val="$${val%%$$'\n*'}" ;\
				schema_default["$${key}"]="$${val}" ;\
			done ;\
		} ;\
		load_schema "$${base}/global" ;\
		load_schema "$${base}/profiles/Default" ;\
		declare -A my_cfg ;\
		my_cfg["$${base}/global/confirm_window_close"]="false" ;\
		my_cfg["$${base}/global/use_menu_accelerators"]="false" ;\
		my_cfg["$${base}/global/default_profile"]="lester" ;\
		declare -A lester ;\
		lester["visible_name"]="Lester" ;\
		lester["default_size_columns"]="80" ;\
		lester["default_size_rows"]="24" ;\
		lester["background_type"]="solid" ;\
		lester["background_color"]="#000000" ;\
		lester["scroll_background"]="false" ;\
		lester["scroll_on_output"]="false" ;\
		lester["scrollback_lines]="1" ;\
		lester["use_system_font"]="false" ;\
		lester["silent_bell]="false" ;\
		lester["allow_bold"]="true" ;\
		lester["background_darkness"]="0.5" ;\
		lester["login_shell"]="false" ;\
		lester["delete_binding"]="escape-sequence" ;\
		lester["use_skey"]="true" ;\
		lester["word_chars"]="-A-Za-z0-9_./" ;\
		lester["default_show_menubar"]="false" ;\
		lester["icon"]="" ;\
		lester["title"]="Lester" ;\
		lester["bold_color_same_as_fg"]="false" ;\
		lester["bold_color"]="#EEEEEE" ;\
		lester["use_theme_colors"]="false" ;\
		lester["custom_command"]="$${HOME}/les/bin/screen" ;\
		lester["scrollbar_position"]="hidden" ;\
		lester["cursor_shape"]="block" ;\
		lester["palette"]="#2E2E34343636" ;\
		lester["palette"]="${lester[palette]}:#CCCC00000000" ;\
		lester["palette"]="${lester[palette]}:#4E4E9A9A0606" ;\
		lester["palette"]="${lester[palette]}:#C4C4A0A00000" ;\
		lester["palette"]="${lester[palette]}:#34346565A4A4" ;\
		lester["palette"]="${lester[palette]}:#757550507B7B" ;\
		lester["palette"]="${lester[palette]}:#060698209A9A" ;\
		lester["palette"]="${lester[palette]}:#D3D3D7D7CFCF" ;\
		lester["palette"]="${lester[palette]}:#555557575353" ;\
		lester["palette"]="${lester[palette]}:#EFEF29292929" ;\
		lester["palette"]="${lester[palette]}:#8A8AE2E23434" ;\
		lester["palette"]="${lester[palette]}:#FCFCE9E94F4F" ;\
		lester["palette"]="${lester[palette]}:#72729F9FCFCF" ;\
		lester["palette"]="${lester[palette]}:#ADAD7F7FA8A8" ;\
		lester["palette"]="${lester[palette]}:#3434E2E2E2E2" ;\
		lester["palette"]="${lester[palette]}:#EEEEEEEEECEC" ;\
		lester["scroll_on_keystroke]="true" ;\
		lester["update_records"]="false" ;\
		lester["title_mode"]="after" ;\
		lester["exit_action"]="close" ;\
		lester["use_custom_command"]="true" ;\
		lester["cursor_blink_mode"]="on" ;\
		lester["background_image"]="" ;\
		lester["backspace_binding"]="ascii-del" ;\
		lester["use_custom_default_size"]="true" ;\
		lester["foreground_color"]="#AAAAAA" ;\
		lester["scrollback_unlimited]="false" ;\
		lester["font"]="Monospace 9" ;\
	}


