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

#ifndef __PLAYERSINKBIN_PMT_INFO_H__
#define __PLAYERSINKBIN_PMT_INFO_H__

#include <glib.h>
#include "playersinkbinstreaminfo.h"

G_BEGIN_DECLS

typedef struct PlayerSinkbinPmtInfoClass {
	GObjectClass parent_class;
} PlayerSinkbinPmtInfoClass;

typedef struct PlayerSinkbinPmtInfo {
	GObject parent;

	guint16 program_no;
	guint16 pcr_pid;

	guint8 version_no;

	GValueArray *descriptors;
	GValueArray *streams;
} PlayerSinkbinPmtInfo;

PlayerSinkbinPmtInfo *playersinkbin_pmt_info_new (guint16 program_no, guint16 pcr_pid, guint8 version);
void playersinkbin_pmt_info_add_stream (PlayerSinkbinPmtInfo *pmt_info, PlayerSinkbinPmtStreamInfo *stream);
void playersinkbin_pmt_info_add_descriptor (PlayerSinkbinPmtInfo *pmt_info,
                                    const gchar *descriptor, guint length);

GType playersinkbin_pmt_info_get_type (void);

#define PLAYERSINKBIN_TYPE_PMT_INFO (playersinkbin_pmt_info_get_type ())
#define PLAYERSINKBIN_IS_PMT_INFO(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), PLAYERSINKBIN_TYPE_PMT_INFO))
#define PLAYERSINKBIN_PMT_INFO(obj) (G_TYPE_CHECK_INSTANCE_CAST((obj),PLAYERSINKBIN_TYPE_PMT_INFO, PlayerSinkbinPmtInfo))

G_END_DECLS

#endif
