Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 634773D90FC
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 16:53:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5267A83B26;
	Wed, 28 Jul 2021 14:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K5w7QT3-Rh6F; Wed, 28 Jul 2021 14:53:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 61FA483AE9;
	Wed, 28 Jul 2021 14:53:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C2CBC0022;
	Wed, 28 Jul 2021 14:53:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36C40C000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 14:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1564083AE1
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 14:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQ0E3UzPZQhx for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 14:53:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7652C83AE9
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 14:53:17 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id t21so2954605plr.13
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 07:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+XJfA3AqCHkXuREWq5JYX1SJ1GS8dmwfVs7cs/uDyzo=;
 b=JTfxH2MI6lr3vhghm+bYn1lDtWC6S40YgGpd2n5ZBE0WXJ57nPRp/vMeCnq6SmO90h
 UPiRb39uM4iMAgW0slMgb6ATsLC4Z0lW9pf+AZc7pl5WJGMDawbbzgXKBt1Z+GuOXtly
 9TYhzeKXWg55tjzDSrNqnVlbyUVgZ1VhgspLUJ3MDp7VmLIaFpFkVzlACYJoXgx4h9W9
 y5VivpznJ4FNs2S4rqNSmRUG+RlcTHOQjC6dLg1qrzPm0TcGvPf/VqvCVComHCJhCA2P
 7AXzP0K57z4DE458hjOtv6x4NMiUz3iK84iyApsE6NxjF0AupgOoBJTCCu7r53H4pSie
 WfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+XJfA3AqCHkXuREWq5JYX1SJ1GS8dmwfVs7cs/uDyzo=;
 b=jM0sBcHpsfZ3QfYresxC9Ecq9uxB7oBg+ykEpWXOvnGrG14lqUkyfkSKkabFN6u6Vs
 6cqGagI1o4DnTn9uq6wsO5M3EEDURm686xnvLvhdr9C/lZ8Z2tb7Vw/jDnYy5xPCh1hh
 47PQLQKAphPAMP+t0Cp1bKkgVTTjAfposJRDKIQL5K96Ip9336W/396jmb1kqjTq0Yql
 MGLQf+pRF2pA32p6NuiNkvbV+pOjvOyssZ1oAOWF1CT/WD0VaaR/HhzRvDMEsM+fQ4Z9
 1j/b/DgtfcBo9uSdzm4XHyRICql4Qe+UZfKS/6wYliEUkYH5Pyg8R5t3C3j9I7UxXXEs
 kcnw==
X-Gm-Message-State: AOAM531PiF1179ELgKIA/3obxHdEYhHurKFtVXliBtASjllgBJ0Gl3ze
 diBJ2aThEKejliR4lmJBXAI=
X-Google-Smtp-Source: ABdhPJz4j/vsLQnZny1GE3WB7JJRgcpBrn921B99u5//TBJ+oOZxL5FLeGsOUc3yuQEVykF8bbeFJQ==
X-Received: by 2002:a65:654c:: with SMTP id a12mr224730pgw.118.1627483996980; 
 Wed, 28 Jul 2021 07:53:16 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:16 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 rientjes@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com
Subject: [PATCH 04/13] HV: Mark vmbus ring buffer visible to host in Isolation
 VM
Date: Wed, 28 Jul 2021 10:52:19 -0400
Message-Id: <20210728145232.285861-5-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728145232.285861-1-ltykernel@gmail.com>
References: <20210728145232.285861-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 anparri@microsoft.com, vkuznets@redhat.com
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

Mark vmbus ring buffer visible with set_memory_decrypted() when
establish gpadl handle.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/hv/channel.c   | 38 ++++++++++++++++++++++++++++++++++++--
 include/linux/hyperv.h | 10 ++++++++++
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index f3761c73b074..01048bb07082 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -17,6 +17,7 @@
 #include <linux/hyperv.h>
 #include <linux/uio.h>
 #include <linux/interrupt.h>
+#include <linux/set_memory.h>
 #include <asm/page.h>
 #include <asm/mshyperv.h>
 
@@ -465,7 +466,7 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	struct list_head *curr;
 	u32 next_gpadl_handle;
 	unsigned long flags;
-	int ret = 0;
+	int ret = 0, index;
 
 	next_gpadl_handle =
 		(atomic_inc_return(&vmbus_connection.next_gpadl_handle) - 1);
@@ -474,6 +475,13 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	if (ret)
 		return ret;
 
+	ret = set_memory_decrypted((unsigned long)kbuffer,
+				   HVPFN_UP(size));
+	if (ret) {
+		pr_warn("Failed to set host visibility.\n");
+		return ret;
+	}
+
 	init_completion(&msginfo->waitevent);
 	msginfo->waiting_channel = channel;
 
@@ -539,6 +547,15 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	/* At this point, we received the gpadl created msg */
 	*gpadl_handle = gpadlmsg->gpadl;
 
+	if (type == HV_GPADL_BUFFER)
+		index = 0;
+	else
+		index = channel->gpadl_range[1].gpadlhandle ? 2 : 1;
+
+	channel->gpadl_range[index].size = size;
+	channel->gpadl_range[index].buffer = kbuffer;
+	channel->gpadl_range[index].gpadlhandle = *gpadl_handle;
+
 cleanup:
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
 	list_del(&msginfo->msglistentry);
@@ -549,6 +566,11 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	}
 
 	kfree(msginfo);
+
+	if (ret)
+		set_memory_encrypted((unsigned long)kbuffer,
+				     HVPFN_UP(size));
+
 	return ret;
 }
 
@@ -811,7 +833,7 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 	struct vmbus_channel_gpadl_teardown *msg;
 	struct vmbus_channel_msginfo *info;
 	unsigned long flags;
-	int ret;
+	int ret, i;
 
 	info = kzalloc(sizeof(*info) +
 		       sizeof(struct vmbus_channel_gpadl_teardown), GFP_KERNEL);
@@ -859,6 +881,18 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 	spin_unlock_irqrestore(&vmbus_connection.channelmsg_lock, flags);
 
 	kfree(info);
+
+	/* Find gpadl buffer virtual address and size. */
+	for (i = 0; i < VMBUS_GPADL_RANGE_COUNT; i++)
+		if (channel->gpadl_range[i].gpadlhandle == gpadl_handle)
+			break;
+
+	if (set_memory_encrypted((unsigned long)channel->gpadl_range[i].buffer,
+			HVPFN_UP(channel->gpadl_range[i].size)))
+		pr_warn("Fail to set mem host visibility.\n");
+
+	channel->gpadl_range[i].gpadlhandle = 0;
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vmbus_teardown_gpadl);
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 2e859d2f9609..06eccaba10c5 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -809,6 +809,14 @@ struct vmbus_device {
 
 #define VMBUS_DEFAULT_MAX_PKT_SIZE 4096
 
+struct vmbus_gpadl_range {
+	u32 gpadlhandle;
+	u32 size;
+	void *buffer;
+};
+
+#define VMBUS_GPADL_RANGE_COUNT		3
+
 struct vmbus_channel {
 	struct list_head listentry;
 
@@ -829,6 +837,8 @@ struct vmbus_channel {
 	struct completion rescind_event;
 
 	u32 ringbuffer_gpadlhandle;
+	/* GPADL_RING and Send/Receive GPADL_BUFFER. */
+	struct vmbus_gpadl_range gpadl_range[VMBUS_GPADL_RANGE_COUNT];
 
 	/* Allocated memory for ring buffer */
 	struct page *ringbuffer_page;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
