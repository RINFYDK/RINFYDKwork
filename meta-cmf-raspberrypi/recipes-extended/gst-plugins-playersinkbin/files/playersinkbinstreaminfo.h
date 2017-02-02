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

#ifndef __PLAYERSINKBIN_PMT_STREAM_INFO_H__
#define __PLAYERSINKBIN_PMT_STREAM_INFO_H__

#include <glib.h>

G_BEGIN_DECLS


typedef struct PlayerSinkbinPmtStreamInfoClass {
	GObjectClass parent_class;
} PlayerSinkbinPmtStreamInfoClass;

typedef struct PlayerSinkbinPmtStreamInfo {
	GObject parent;
	guint16 pid;
} PlayerSinkbinPmtStreamInfo;

PlayerSinkbinPmtStreamInfo *playersinkbin_pmt_stream_info_new (guint16 pid);

GType playersinkbin_pmt_stream_info_get_type (void);

#define PLAYERSINKBIN_TYPE_PMT_STREAM_INFO (playersinkbin_pmt_stream_info_get_type ())

#define PLAYERSINKBIN_IS_PMT_STREAM_INFO(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), PLAYERSINKBIN_TYPE_PMT_STREAM_INFO))
#define PLAYERSINKBIN_PMT_STREAM_INFO(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj),PLAYERSINKBIN_TYPE_PMT_STREAM_INFO, PlayerSinkbinPmtStreamInfo))

G_END_DECLS

#endif
