" Vim syntax file
" Language: Quantum Espresso
" Maintainer: Leandro Seixas Rocha <seixasle@gmail.com>
" Last Change: 2015 dec 09

if exists("b:current_syntax")
  finish
endif

" Integer with +,- or nothing in front
syntax match espressoNumber '\d\+'
syntax match espressoNumber '[-+]\d\+'

" Floating number
syntax match espressoNumber '\d\+.\d*'
syntax match espressoNumber '[-+]\d\+.\d*'
syntax match espressoNumber '[-+]\=\d[[:digit:]]*[dD][\-+]\=\d\+'
syntax match espressoNumber '\d[[:digit:]]*[dD][\-+]\=\d\+'
syntax match espressoNumber '[-+]\=\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'
syntax match espressoNumber '\d[[:digit:]]*\.\d*[dD][\-+]\=\d\+'

" String
syntax region espressoString start="'" end="'"

" Boolean value (.true. /.false.)
syntax match espressoBoolean '\.[tT][rR][uU][eE]\.'
syntax match espressoBoolean '\.[fF][aA][lL][sS][eE]\.'

" CONTROL namelist
syntax keyword espressoNameDesc CONTROL SYSTEM ELECTRONS IONS CELL skipwhite
syntax keyword espressoKey calculation prefix title verbosity nextgroup=espressoString skipwhite
syntax keyword espressoKey restart_mode pseudo_dir wf_collect outdir wfcdir nextgroup=espressoString skipwhite
syntax keyword espressoKey tstress tprnfor lkpoint_dir nextgroup=espressoBoolean skipwhite
syntax keyword espressoKey etot_conv_thr forc_conv_thr dt max_seconds nstep nextgroup=espressoNumber skipwhite
syntax keyword espressoKey disk_io tefield dipfield lelfield lorbm lberry nextgroup=espressoBoolean skipwhite
syntax keyword espressoKey iprint nberrycyc gdir nppstr lfcpopt nextgroup=espressoNumber skipwhite

" SYSTEM namelist
syntax keyword espressoKey ibrav nat ntyp nspin nbnd tot_charge tot_magnetization report use_all_frac Hubbard_U Hubbard_J0 Hubbard_alpha Hubbard_beta nextgroup=espressoNumber skipwhite
syntax keyword espressoKey ecutwfc ecutrho degauss ecutfock exx_fraction screening_parameter one_atom_occupations q2sigma qcutz ecfixed ecutvcut nextgroup=espressoNumber skipwhite
syntax keyword espressoKey lda_plus_u_kind edir emaxpos eamp lambda london_s6 london_rcut fixed_magnetization x_gamma_extrapolation nqx1 nqx2 nqx3 nextgroup=espressoNumber skipwhite
syntax keyword espressoKey nosym noinv force_symmorphic lda_plus_u noncolin lspinorb london nosym_evc no_t_rev space_group uniqueb origin_choice rhombohedral nextgroup=espressoBoolean skipwhite
syntax keyword espressoKey occupations smearing input_dft exxdiv_treatment U_projection_type constrained_magnetization starting_magnetization angle1 angle2 nextgroup=espressoString skipwhite
syntax keyword espressoKey starting_ns_eigenvalue Hubbard_J eopreg assume_isolated esm_bc esm_w esm_efield esm_nfit fcp_mu vdw_corr london_c6 xdm1 xdm2 nextgroup=espressoString skipwhite
 
" ELECTRONS namelist
syntax keyword espressoKey electron_maxstep conv_thr mixing_beta mixing_ndim diago_david_ndim efield nextgroup=espressoNumber skipwhite
syntax keyword espressoKey mixing_mode diagonalization startingpot startingwfc nextgroup=espressoString skipwhite
syntax keyword espressoKey diago_full_acc nextgroup=espressoBoolean skipwhite

" IONS namelist
syntax keyword espressoKey ion_dynamics ion_positions phase_space pot_extrapolation wfc_extrapolation nextgroup=espressoString skipwhite
syntax keyword espressoKey bfgs_ndim trut_radius_max trust_radius_ini nextgroup=espressoNumber skipwhite

" CELL namelist
syntax keyword espressoKey cell_dynamics cell_dofree nextgroup=espressoString skipwhite
syntax keyword espressoKey press cell_factor press_conv_thr nextgroup=espressoNumber skipwhite

syntax region espressoNamelist start="&" end="/" fold transparent contains=espressoNumber,espressoKey,espressoString,espressoBoolean

let b:current_syntax = "espresso"

hi def link espressoNamelist    PreProc
hi def link espressoKey         Statement
hi def link espressoNumber      Constant
hi def link espressoString      Type
hi def link espressoBoolean     Constant
