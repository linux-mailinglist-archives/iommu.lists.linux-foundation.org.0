Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AD78E35F67C
	for <lists.iommu@lfdr.de>; Wed, 14 Apr 2021 16:50:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C1A440EAD;
	Wed, 14 Apr 2021 14:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z1tDCblhu-Va; Wed, 14 Apr 2021 14:50:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id B786340E4E;
	Wed, 14 Apr 2021 14:50:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9608C0012;
	Wed, 14 Apr 2021 14:50:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67422C000A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 14:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 433814055E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 14:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RNkp46beRld5 for <iommu@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 14:50:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7933E405D8
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 14:50:32 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id m11so13907549pfc.11
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVkRTqUPBzQHoWP1iz19JnEvLpWiwpbLKKeUDMKlliw=;
 b=E+2cIG4luSiauZCXt8F0KkKTk61dfk7whIIE/VHBZpNK6ARjyQdSQbpdQClQ4sSrp/
 dGr6hJu/fS4Ac4GvGFZRUctlN3UoGYzjwv/J4NIfKYbBrLXDX0DII3Kqd0z13GyzT7N9
 3K8eWfVsyRnUmawlgrvkAxuuTExFaWpsJRH42W4ZrmtKgAL9Ko81HY7WIxnfJaEZ8aiH
 Re9gsUe5b3chBVWCDNntU9qAIDzO3tUL22enF3c2ium4ZddwWgTLyh5yVJnZkUplcHhN
 5Di+lzE1Zg2G82MYEnz9s+UIXemJpVVS+BIdIcbJOLkBiyzwWmhzx/daa53C594lB6Z4
 MjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVkRTqUPBzQHoWP1iz19JnEvLpWiwpbLKKeUDMKlliw=;
 b=thfbruVQOQxItNIslAjcRkZERO7LBxS4GGwnYXkc65i7Y/g6C3LJ0u6DN0kKtmW3wx
 TUD2UC/ZrVUW5/2VWcG6s5RPaNyhR9QqDaHYJ3UgHaMwgw7oQdPCL2AhKhWQgxo5xBBl
 J4YGSWMYGpgA2m5hoOGM74ShdtW+l6FwdE9c+qcHakllk0Dzb2QgPNZU9q/rfXWBXZi7
 GQKlkwlfb2jMojj1640StKBBkl8bsq6f1EFwVqUBZF1xcqRgoUm0eCkYKlVa+mDmnxKN
 GzH3ABrxCm2/LeJN2Kt0RhUOh3abITWhkesFH8TbbLvDVH4gSn09Xk14IHNhQnqPwsNe
 tBbw==
X-Gm-Message-State: AOAM532/Km3icF0WX3rANis1LfIAuBxCfrvXzDV8KPzex4PhS+rRgk73
 SwyKel1pzGqHnSANMYtQyko=
X-Google-Smtp-Source: ABdhPJyJQo3QYxkwZd2R/2jbCS/20DZeDnEWp76po+53FmLx6JhMmfhewCcVF2Q2CCy9ma7VhRrp6w==
X-Received: by 2002:a63:4e47:: with SMTP id o7mr37301695pgl.286.1618411832013; 
 Wed, 14 Apr 2021 07:50:32 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:35:ebad:12c1:f579:e332])
 by smtp.gmail.com with ESMTPSA id w67sm17732522pgb.87.2021.04.14.07.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 07:50:31 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, arnd@arndb.de, akpm@linux-foundation.org,
 gregkh@linuxfoundation.org, konrad.wilk@oracle.com, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, joro@8bytes.org,
 will@kernel.org, davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com
Subject: [Resend RFC PATCH V2 08/12] UIO/Hyper-V: Not load UIO HV driver in
 the isolation VM.
Date: Wed, 14 Apr 2021 10:49:41 -0400
Message-Id: <20210414144945.3460554-9-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210414144945.3460554-1-ltykernel@gmail.com>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, thomas.lendacky@amd.com,
 linux-hyperv@vger.kernel.org, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, brijesh.singh@amd.com, vkuznets@redhat.com,
 sunilmut@microsoft.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

UIO HV driver should not load in the isolation VM for security reason.
Return ENOTSUPP in the hv_uio_probe() in the isolation VM.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/uio/uio_hv_generic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index 0330ba99730e..678b021d66f8 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -29,6 +29,7 @@
 #include <linux/hyperv.h>
 #include <linux/vmalloc.h>
 #include <linux/slab.h>
+#include <asm/mshyperv.h>
 
 #include "../hv/hyperv_vmbus.h"
 
@@ -241,6 +242,10 @@ hv_uio_probe(struct hv_device *dev,
 	void *ring_buffer;
 	int ret;
 
+	/* UIO driver should not be loaded in the isolation VM.*/
+	if (hv_is_isolation_supported())
+		return -ENOTSUPP;
+		
 	/* Communicating with host has to be via shared memory not hypercall */
 	if (!channel->offermsg.monitor_allocated) {
 		dev_err(&dev->device, "vmbus channel requires hypercall\n");
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
