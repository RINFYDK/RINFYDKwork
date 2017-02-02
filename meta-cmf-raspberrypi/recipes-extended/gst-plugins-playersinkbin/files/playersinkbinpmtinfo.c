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

#include "playersinkbinpmtinfo.h"

enum
{
    PROPERTY_0,
    PROPERTY_PROGRAM_NO,
    PROPERTY_VERSION_NO,
    PROPERTY_PCR_PID,
    PROPERTY_STREAMINFO
};

#ifdef USE_GST1
#define playersinkbin_pmt_info_parent_class parent_class
G_DEFINE_TYPE (PlayerSinkbinPmtInfo, playersinkbin_pmt_info, G_TYPE_OBJECT);
#else
GST_BOILERPLATE (PlayerSinkbinPmtInfo, playersinkbin_pmt_info, GObject, G_TYPE_OBJECT);
#endif

static void playersinkbin_pmt_info_finalize (GObject *object);
static void playersinkbin_pmt_info_set_property (GObject * object, guint prop_id,
        const GValue * value, GParamSpec * spec);
static void playersinkbin_pmt_info_get_property (GObject * object, guint prop_id,
        GValue * value, GParamSpec * spec);

#ifndef USE_GST1
static void
playersinkbin_pmt_info_base_init (gpointer klass)
{
}
#endif

static void
playersinkbin_pmt_info_class_init (PlayerSinkbinPmtInfoClass *klass)
{
#ifdef USE_GST1
    GObjectClass *gobj_klass = G_OBJECT_CLASS (klass);
#else
    GObjectClass *gobj_klass = (GObjectClass *) klass;
#endif
    GParamSpec *pProNumber, *pPcrPid, *pStreamInfo, *pVersionNumber;

    gobj_klass->finalize = playersinkbin_pmt_info_finalize;
    gobj_klass->set_property = playersinkbin_pmt_info_set_property;
    gobj_klass->get_property = playersinkbin_pmt_info_get_property;

    pProNumber =  g_param_spec_uint ( "program-number",
				      "Program Number",
				      "This parameter represents the Program Number of this program",
				      0,
				      G_MAXUINT16,
				      1,
				      G_PARAM_READABLE);

    pPcrPid =   g_param_spec_uint ("pcr-pid",
				   "PID carrying the PCR for this program",
				   "This Parameter represents PID which carries the PCR for this program",
				   1,
				   G_MAXUINT16,
				   1,
				   G_PARAM_READABLE);

    pStreamInfo = g_param_spec_value_array ("stream-info",
				            "GValueArray containing GObjects with properties",
				            "This parameter is an Array of GObjects containing information about the program streams",
					    g_param_spec_object ("flu-pmt-streaminfo",
					    "FluPMTStreamInfo",
					    "This parameter represents the Fluendo TS Demuxer PMT Stream info object",
					    PLAYERSINKBIN_TYPE_PMT_STREAM_INFO,
					    G_PARAM_READABLE),
				            G_PARAM_READABLE);

    pVersionNumber =  g_param_spec_uint ("version-number",
				         "Version Number",
				         "The parameter represents version number of this program information",
				         0,
				         G_MAXUINT8,
				         1,
				         G_PARAM_READABLE);



    g_object_class_install_property (gobj_klass,
                                     PROPERTY_PROGRAM_NO,
                                     pProNumber);

    g_object_class_install_property (gobj_klass,
                                     PROPERTY_PCR_PID,
				     pPcrPid);

    g_object_class_install_property (gobj_klass,
                                     PROPERTY_STREAMINFO,
				     pStreamInfo);

    g_object_class_install_property (gobj_klass,
                                     PROPERTY_VERSION_NO,
				     pVersionNumber);
}

static void
#ifdef USE_GST1
playersinkbin_pmt_info_init (PlayerSinkbinPmtInfo *pmtInfo)
#else
playersinkbin_pmt_info_init (PlayerSinkbinPmtInfo *pmtInfo, PlayerSinkbinPmtInfoClass *klass)
#endif
{
    pmtInfo->streams = g_value_array_new (0);
}

PlayerSinkbinPmtInfo *playersinkbin_pmt_info_new (guint16 program_no, guint16 pcr_pid,
                                  guint8 version_no)
{
    PlayerSinkbinPmtInfo *pmtInfo;

    pmtInfo = g_object_new (PLAYERSINKBIN_TYPE_PMT_INFO, NULL);

    pmtInfo->program_no = program_no;
    pmtInfo->pcr_pid = pcr_pid;
    pmtInfo->version_no = version_no;

    return pmtInfo;
}

static void
playersinkbin_pmt_info_finalize (GObject *obj)
{
    PlayerSinkbinPmtInfo *pmtInfo = PLAYERSINKBIN_PMT_INFO (obj);

    g_value_array_free (pmtInfo->streams);

    G_OBJECT_CLASS (parent_class)->finalize (obj);
}

static void playersinkbin_pmt_info_set_property (GObject * obj, guint prop_id,
        const GValue * value, GParamSpec * spec)
{
    g_return_if_fail (PLAYERSINKBIN_IS_PMT_INFO (obj));

    G_OBJECT_WARN_INVALID_PROPERTY_ID (obj, prop_id, spec);
}

static void playersinkbin_pmt_info_get_property (GObject * obj, guint propId,
        GValue * value, GParamSpec * spec)
{
    PlayerSinkbinPmtInfo *pmtInfo;

    g_return_if_fail (PLAYERSINKBIN_IS_PMT_INFO (obj));

    pmtInfo = PLAYERSINKBIN_PMT_INFO (obj);

    switch (propId) {
    case PROPERTY_PROGRAM_NO:
        g_value_set_uint (value, pmtInfo->program_no);
        break;
    case PROPERTY_PCR_PID:
        g_value_set_uint (value, pmtInfo->pcr_pid);
        break;
    case PROPERTY_STREAMINFO:
        g_value_set_boxed (value, pmtInfo->streams);
        break;
    case PROPERTY_VERSION_NO:
        g_value_set_uint (value, pmtInfo->version_no);
        break;
    default:
        G_OBJECT_WARN_INVALID_PROPERTY_ID (obj, propId, spec);
        break;
    }
}

void
playersinkbin_pmt_info_add_stream (PlayerSinkbinPmtInfo *pmtInfo, PlayerSinkbinPmtStreamInfo *strm)
{
    GValue val = { 0, };

    g_return_if_fail (PLAYERSINKBIN_IS_PMT_INFO (pmtInfo));
    g_return_if_fail (PLAYERSINKBIN_IS_PMT_STREAM_INFO (strm));

    g_value_init (&val, G_TYPE_OBJECT);
    g_value_take_object (&val, strm);
    g_value_array_append (pmtInfo->streams, &val);
}

