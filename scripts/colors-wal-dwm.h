static const char norm_fg[] = "#c9cac3";
static const char norm_bg[] = "#091416";
static const char norm_border[] = "#8c8d88";

static const char sel_fg[] = "#c9cac3";
static const char sel_bg[] = "#21515A";
static const char sel_border[] = "#c9cac3";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
};
