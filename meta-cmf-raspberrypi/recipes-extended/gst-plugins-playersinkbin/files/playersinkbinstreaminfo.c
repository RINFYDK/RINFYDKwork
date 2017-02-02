/* ============================================================================
* RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
* ============================================================================
* This file (and its contents) are the intellectual property of RDK Management, LLC.
* It may not be used, copied, distributed or otherwise disclosed in whole or in
* part without the express written permission of RDK Management, LLC.
* ============================================================================
* Copyright (c) 2016 RDK Management, LLC. All rights reserved.
* ============================================================================
*/

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gst/gst.h>

#include "playersinkbinstreaminfo.h"

enum
{
	PROP_0,
	PROP_PID
};

#ifdef USE_GST1
#define playersinkbin_pmt_stream_info_parent_class parent_class
G_DEFINE_TYPE (PlayerSinkbinPmtStreamInfo, playersinkbin_pmt_stream_info, G_TYPE_OBJECT);
#else
GST_BOILERPLATE (PlayerSinkbinPmtStreamInfo, playersinkbin_pmt_stream_info, GObject,
                 G_TYPE_OBJECT);
#endif

static void playersinkbin_pmt_stream_info_set_property (GObject * object, guint prop_id,
        const GValue * value, GParamSpec * spec);
static void playersinkbin_pmt_stream_info_get_property (GObject * object, guint prop_id,
        GValue * value, GParamSpec * spec);

#ifndef USE_GST1
static void
playersinkbin_pmt_stream_info_base_init (gpointer klass)
{
}
#endif

static void
playersinkbin_pmt_stream_info_class_init (PlayerSinkbinPmtStreamInfoClass *klass)
{
#ifdef USE_GST1
	GObjectClass *gobject_klass = G_OBJECT_CLASS (klass);
#else
	GObjectClass *gobject_klass = (GObjectClass *) klass;
#endif

	gobject_klass->set_property = playersinkbin_pmt_stream_info_set_property;
	gobject_klass->get_property = playersinkbin_pmt_stream_info_get_property;

	g_object_class_install_property (gobject_klass, PROP_PID,
	                                 g_param_spec_uint ("pid", "PID carrying this stream",
	                                         "PID which carries this stream", 1, G_MAXUINT16, 1,
	                                         G_PARAM_READABLE));
}

static void
#ifdef USE_GST1
playersinkbin_pmt_stream_info_init (PlayerSinkbinPmtStreamInfo *pmt_stream_info)
#else
playersinkbin_pmt_stream_info_init (PlayerSinkbinPmtStreamInfo *pmt_stream_info, PlayerSinkbinPmtStreamInfoClass *klass)
#endif
{
}

PlayerSinkbinPmtStreamInfo *playersinkbin_pmt_stream_info_new (guint16 pid)
{
	PlayerSinkbinPmtStreamInfo *info;

	info = g_object_new (PLAYERSINKBIN_TYPE_PMT_STREAM_INFO, NULL);

	info->pid = pid;

	return info;
}

static void
playersinkbin_pmt_stream_info_set_property (GObject * object, guint prop_id,
                                    const GValue * value, GParamSpec * spec)
{
	g_return_if_fail (PLAYERSINKBIN_IS_PMT_STREAM_INFO (object));

	/* No settable properties */
	G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, spec);
}

static void
playersinkbin_pmt_stream_info_get_property (GObject * object, guint prop_id,
                                    GValue * value, GParamSpec * spec)
{
	PlayerSinkbinPmtStreamInfo *si;

	g_return_if_fail (PLAYERSINKBIN_IS_PMT_STREAM_INFO (object));

	si = PLAYERSINKBIN_PMT_STREAM_INFO (object);

	switch (prop_id) {
	case PROP_PID:
		g_value_set_uint (value, si->pid);
		break;
	default:
		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, spec);
		break;
	}
}
