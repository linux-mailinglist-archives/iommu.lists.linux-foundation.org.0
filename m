Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9692774E0
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 17:09:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9EC2B2E100;
	Thu, 24 Sep 2020 15:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3G5Dvr8RyTfn; Thu, 24 Sep 2020 15:09:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E0D62E122;
	Thu, 24 Sep 2020 15:09:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 870FDC0859;
	Thu, 24 Sep 2020 15:09:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 321C4C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 14:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1F01485620
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 14:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ym1RE7iKX6F0 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 14:58:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F28A385582
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 14:58:35 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OEriXw101671;
 Thu, 24 Sep 2020 14:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=3RB2GjK9ADEmAIr+xoSAWhTF8Rk2yEY/ISVfaoeNfBs=;
 b=i47qAal2g2PSZT09qgQ22BTMzKVLAaudUpojAuRafVDiFoWkCs9/nyqtZmW65zzD9DC5
 2U/rwye04mKjbGyGKdvJGX5/JjyssqYgdsyVSgyrEFy7Vom8dMb47tV2lucyYKIBebmV
 qWiotEMA1JCEmqQIsyyHvJrtd4BMFDb39vbN8KUHTy1IFfK0YER3DgRGDIpt+5p85lR1
 SVadiDJRRr82xNt4TkCqLxbUZZxV5wa2JnuChyxMcNA2EhsSAUbPOnb0NZwlSJMDh9lx
 eoFCN79O1LyDe81uG8/kVKa8d6e+3nWCxjjFgRdYFu+vpvhy6cXz8fwVZ3/CWeYzDF/8 og== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 33qcpu5qcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 24 Sep 2020 14:58:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08OEuT6E126286;
 Thu, 24 Sep 2020 14:58:18 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 33nujr18dk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Sep 2020 14:58:18 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08OEwD0q016152;
 Thu, 24 Sep 2020 14:58:13 GMT
Received: from disposition.us.oracle.com (/10.152.32.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 24 Sep 2020 07:58:12 -0700
From: Ross Philipson <ross.philipson@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [PATCH 06/13] x86: Add early general TPM interface support for Secure
 Launch
Date: Thu, 24 Sep 2020 10:58:34 -0400
Message-Id: <1600959521-24158-7-git-send-email-ross.philipson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
References: <1600959521-24158-1-git-send-email-ross.philipson@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 spamscore=0 suspectscore=2
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009240114
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9753
 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2
 mlxlogscore=999
 adultscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009240114
X-Mailman-Approved-At: Thu, 24 Sep 2020 15:09:23 +0000
Cc: dpsmith@apertussolutions.com, ross.philipson@oracle.com,
 luto@amacapital.net, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 tglx@linutronix.de, trenchboot-devel@googlegroups.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

This commit exposes a minimal general interface for the compressed
kernel to request the required TPM operations to send measurements to
a TPM.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
---
 arch/x86/boot/compressed/Makefile  |   2 +-
 arch/x86/boot/compressed/tpm/tpm.c | 145 +++++++++++++++++++++++++++++++++++++
 2 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 arch/x86/boot/compressed/tpm/tpm.c

diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index a4308d5..35947b9 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -101,7 +101,7 @@ vmlinux-objs-$(CONFIG_SECURE_LAUNCH_SHA256) += $(obj)/early_sha256.o
 vmlinux-objs-$(CONFIG_SECURE_LAUNCH_SHA512) += $(obj)/early_sha512.o
 vmlinux-objs-$(CONFIG_SECURE_LAUNCH) += $(obj)/tpm/tpmio.o $(obj)/tpm/tpm_buff.o \
 	$(obj)/tpm/tis.o $(obj)/tpm/crb.o $(obj)/tpm/tpm1_cmds.o \
-	$(obj)/tpm/tpm2_cmds.o $(obj)/tpm/tpm2_auth.o
+	$(obj)/tpm/tpm2_cmds.o $(obj)/tpm/tpm2_auth.o $(obj)/tpm/tpm.o
 
 # The compressed kernel is built with -fPIC/-fPIE so that a boot loader
 # can place it anywhere in memory and it will still run. However, since
diff --git a/arch/x86/boot/compressed/tpm/tpm.c b/arch/x86/boot/compressed/tpm/tpm.c
new file mode 100644
index 0000000..0fe62d2
--- /dev/null
+++ b/arch/x86/boot/compressed/tpm/tpm.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2020 Apertus Solutions, LLC
+ *
+ * Author(s):
+ *      Daniel P. Smith <dpsmith@apertussolutions.com>
+ *
+ */
+
+#include <linux/types.h>
+#include <linux/const.h>
+#include <linux/string.h>
+#include <linux/errno.h>
+#include "tpm.h"
+#include "tpmbuff.h"
+#include "tis.h"
+#include "crb.h"
+#include "tpm_common.h"
+#include "tpm1.h"
+#include "tpm2.h"
+#include "tpm2_constants.h"
+
+static struct tpm tpm;
+
+static void find_interface_and_family(struct tpm *t)
+{
+	struct tpm_interface_id intf_id;
+	struct tpm_intf_capability intf_cap;
+
+	/* Sort out whether if it is 1.2 */
+	intf_cap.val = tpm_read32(TPM_INTF_CAPABILITY_0);
+	if ((intf_cap.interface_version == TPM12_TIS_INTF_12) ||
+	    (intf_cap.interface_version == TPM12_TIS_INTF_13)) {
+		t->family = TPM12;
+		t->intf = TPM_TIS;
+		return;
+	}
+
+	/* Assume that it is 2.0 and TIS */
+	t->family = TPM20;
+	t->intf = TPM_TIS;
+
+	/* Check if the interface is CRB */
+	intf_id.val = tpm_read32(TPM_INTERFACE_ID_0);
+	if (intf_id.interface_type == TPM_CRB_INTF_ACTIVE)
+		t->intf = TPM_CRB;
+}
+
+struct tpm *enable_tpm(void)
+{
+	struct tpm *t = &tpm;
+
+	find_interface_and_family(t);
+
+	switch (t->intf) {
+	case TPM_TIS:
+		if (!tis_init(t))
+			return NULL;
+		break;
+	case TPM_CRB:
+		if (!crb_init(t))
+			return NULL;
+		break;
+	}
+
+	return t;
+}
+
+u8 tpm_request_locality(struct tpm *t, u8 l)
+{
+	u8 ret = TPM_NO_LOCALITY;
+
+	ret = t->ops.request_locality(l);
+
+	if (ret < TPM_MAX_LOCALITY)
+		t->buff = alloc_tpmbuff(t->intf, ret);
+
+	return ret;
+}
+
+void tpm_relinquish_locality(struct tpm *t)
+{
+	t->ops.relinquish_locality();
+
+	free_tpmbuff(t->buff, t->intf);
+}
+
+#define MAX_TPM_EXTEND_SIZE 70 /* TPM2 SHA512 is the largest */
+int tpm_extend_pcr(struct tpm *t, u32 pcr, u16 algo,
+		u8 *digest)
+{
+	int ret = 0;
+
+	if (t->buff == NULL)
+		return -EINVAL;
+
+	if (t->family == TPM12) {
+		struct tpm_digest d;
+
+		if (algo != TPM_ALG_SHA1)
+			return -EINVAL;
+
+		d.pcr = pcr;
+		memcpy((void *)d.digest.sha1.digest,
+			digest, SHA1_DIGEST_SIZE);
+
+		ret = tpm1_pcr_extend(t, &d);
+	} else if (t->family == TPM20) {
+		struct tpml_digest_values *d;
+		u8 buf[MAX_TPM_EXTEND_SIZE];
+
+		d = (struct tpml_digest_values *) buf;
+		d->count = 1;
+		d->digests->alg = algo;
+		switch (algo) {
+		case TPM_ALG_SHA1:
+			memcpy(d->digests->digest, digest, SHA1_SIZE);
+			break;
+		case TPM_ALG_SHA256:
+			memcpy(d->digests->digest, digest, SHA256_SIZE);
+			break;
+		case TPM_ALG_SHA384:
+			memcpy(d->digests->digest, digest, SHA384_SIZE);
+			break;
+		case TPM_ALG_SHA512:
+			memcpy(d->digests->digest, digest, SHA512_SIZE);
+			break;
+		case TPM_ALG_SM3_256:
+			memcpy(d->digests->digest, digest, SM3256_SIZE);
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		ret = tpm2_extend_pcr(t, pcr, d);
+	} else
+		ret = -EINVAL;
+
+	return ret;
+}
+
+void free_tpm(struct tpm *t)
+{
+	tpm_relinquish_locality(t);
+}
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
