#
#	$Id: CMakeLists.txt 570 2018-07-27 00:25:30Z sandwell $
#

set (GMTSAR_LINK_LIBS ${GMT_LIBRARY} ${TIFF_LIBRARY} ${LAPACK_LIBRARIES})

if (HAVE_M_LIBRARY)
	# link the math library
	set (GMTSAR_LINK_LIBS ${GMTSAR_LINK_LIBS} m)
endif (HAVE_M_LIBRARY)

include_directories (${GMT_INCLUDE_DIR} ${TIFF_INCLUDE_DIR})

add_library (gmtsar aastretch.c acpatch.c calc_dop.c conv2d.c do_freq_xcorr.c
	do_time_int_xcorr.c fft_bins.c fft_interpolate_routines.c file_stuff.c
	geoxyz.c get_locations.c get_params.c hermite_c.c highres_corr.c
	interpolate_orbit.c intp_coef.c ldr_orbit.c parse_xcorr_input.c plxyz.c
	polyfit.c print_results.c radopp.c read_orb.c read_xcorr_data.c
	SAT_llt2rat_sub.c rmpatch.c rng_cmp.c rng_ref.c set_prm_defaults.c shift.c
	sio_struct.c siocomplex.c spline.c trans_col.c utils.c utils_complex.c
	write_orb.c sbas_utils.c gmtsar.h lib_functions.h llt2xyz.h orbit.h
	sarleader_ALOS.h sarleader_fdr.h sfd_complex.h siocomplex.h soi.h xcorr.h)
target_link_libraries (gmtsar ${GMTSAR_LINK_LIBS})

set (GMTSAR_LINK_LIBS ${GMTSAR_LINK_LIBS} gmtsar)

add_executable (bperp bperp.c gmtsar.h)
target_link_libraries (bperp ${GMTSAR_LINK_LIBS})

add_executable (calc_dop_orb calc_dop_orb.c gmtsar.h orbit.h)
target_link_libraries (calc_dop_orb ${GMTSAR_LINK_LIBS})

add_executable (conv conv.c gmtsar.h)
target_link_libraries (conv ${GMTSAR_LINK_LIBS})

add_executable (esarp esarp.c soi.h gmtsar.h)
target_link_libraries (esarp ${GMTSAR_LINK_LIBS})

add_executable (extend_orbit extend_orbit.c gmtsar.h orbit.h lib_functions.h)
target_link_libraries (extend_orbit ${GMTSAR_LINK_LIBS})

add_executable (make_gaussian_filter make_gaussian_filter.c PRM.h lib_functions.h)
target_link_libraries (make_gaussian_filter ${GMTSAR_LINK_LIBS})

add_executable (offset_topo offset_topo.c gmtsar.h)
target_link_libraries (offset_topo ${GMTSAR_LINK_LIBS})

add_executable (phase2topo phase2topo.c gmtsar.h)
target_link_libraries (phase2topo ${GMTSAR_LINK_LIBS})

add_executable (phasediff phasediff.c gmtsar.h)
target_link_libraries (phasediff ${GMTSAR_LINK_LIBS})

add_executable (phasefilt phasefilt.c gmtsar.h)
target_link_libraries (phasefilt ${GMTSAR_LINK_LIBS})

add_executable (resamp resamp.c gmtsar.h lib_functions.h)
target_link_libraries (resamp ${GMTSAR_LINK_LIBS})

add_executable (SAT_baseline SAT_baseline.c gmtsar.h orbit.h)
target_link_libraries (SAT_baseline ${GMTSAR_LINK_LIBS})

add_executable (SAT_llt2rat SAT_llt2rat.c gmtsar.h orbit.h llt2xyz.h)
target_link_libraries (SAT_llt2rat ${GMTSAR_LINK_LIBS})

add_executable (SAT_look SAT_look.c gmtsar.h orbit.h llt2xyz.h)
target_link_libraries (SAT_look ${GMTSAR_LINK_LIBS})

add_executable (sbas sbas.c gmtsar.h sbas.h)
target_link_libraries (sbas ${GMTSAR_LINK_LIBS})

add_executable (xcorr xcorr.c gmtsar.h)
target_link_libraries (xcorr ${GMTSAR_LINK_LIBS})

# add the install targets
install (TARGETS gmtsar bperp calc_dop_orb conv esarp extend_orbit make_gaussian_filter offset_topo phase2topo phasediff phasefilt resamp SAT_baseline SAT_llt2rat SAT_look sbas xcorr
	ARCHIVE DESTINATION lib
	COMPONENT Runtime
	LIBRARY DESTINATION lib
	COMPONENT Runtime
	RUNTIME DESTINATION bin
	COMPONENT Runtime)

install (PROGRAMS align.csh align_ALOS2_SCAN.csh align_ALOS_SLC.csh align_batch.csh align_batch_ALOS2_SCAN.csh
	align_batch_ALOS_SLC.csh align_tops.csh align_tops_6par.csh align_tops_esd.csh baseline_table.csh
	cleanup.csh create_frame_tops.csh dem2topo_ra.csh dem2topo_ra_ALOS2.csh detrend_before_unwrap.csh
	filter.csh fitoffset.csh geocode.csh gmtsar.csh gmtsar_sharedir.csh grd2geotiff.csh grd2kml.csh intf.csh
	intf_batch.csh intf_batch_ALOS2_SCAN.csh intf_tops.csh landmask.csh landmask_ALOS2.csh m2s.csh
	make_a_offset.csh make_dem.csh make_los_ascii.csh make_profile.csh merge_batch.csh
	merge_unwrap_geocode_tops.csh p2p_ALOS.csh p2p_ALOS2_SCAN_SLC.csh p2p_ALOS2_SLC.csh p2p_ALOS_SLC.csh
	p2p_CSK.csh p2p_CSK_SLC.csh p2p_ENVI.csh p2p_ENVI_SLC.csh p2p_ERS.csh p2p_RS2_SLC.csh p2p_S1A_SLC.csh
	p2p_S1A_TOPS.csh p2p_S1A_TOPS_Frame.csh p2p_SAT_SLC.csh p2p_TSX_SLC.csh pre_proc.csh pre_proc_batch.csh
	pre_proc_batch_ALOS2_SCAN.csh pre_proc_batch_ALOS_SLC.csh pre_proc_init.csh preproc_batch_tops.csh
	preproc_batch_tops_esd.csh proj_ll2ra.csh proj_ll2ra_ascii.csh proj_model.csh proj_ra2ll.csh
	proj_ra2ll_ascii.csh sarp.csh slc2amp.csh snaphu.csh snaphu_interp.csh stack.csh stack_corr.csh 
	update_PRM.csh select_pairs.csh
	RUNTIME DESTINATION bin
	COMPONENT Runtime)

# vim: textwidth=78 noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
