Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C99043E4B74
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 19:57:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DEBE6080E;
	Mon,  9 Aug 2021 17:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7WLJyJBzSWb; Mon,  9 Aug 2021 17:56:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 19B2F607FF;
	Mon,  9 Aug 2021 17:56:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02C4CC000E;
	Mon,  9 Aug 2021 17:56:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23979C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 17:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 054E64044A
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 17:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8nFvnAtErFHx for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 17:56:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5368B40446
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 17:56:56 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so96773pjr.1
 for <iommu@lists.linux-foundation.org>; Mon, 09 Aug 2021 10:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=29igml5xJQT7NZ/zHELD608zwBtMw+CBZNUu6aD3TXw=;
 b=ZCoB9o0cvriAk3/PPGeEVPrIAnIqymJpX+yMC18ujzQkba5lyQWncuyzod11hNntU1
 1bk6U1EvfSLpZGhLCGAu8NGIa9wsSZRoZ9K8ij4t9yrTzMssHz4c12UmzGHuYx3Qqwqe
 5euceZzMuwpmGsvwlu4n571z1nUyoA5EMVamLrK2Fv4kQgex9w+3kQMyU5XErr3GN4CH
 2w3uSc7qIzutfvO/NUn4XoFUmpELqTdpw+eF5ttK+V/67fPZ9sLruj8gW2s9Uld8o0/F
 kbW1vumljR+S/wuC/e/qZtU3IDoreR6eEJ755vt4a2DdwykGjIka2gxZnJUQ0sS84g+E
 rg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=29igml5xJQT7NZ/zHELD608zwBtMw+CBZNUu6aD3TXw=;
 b=JY16biNN5O7X569vlsNfC31jqHNLaZ72B3nJ2Amw9qqw3Forv7vFZawR2iIva+Xmej
 ql/IEf1lYaDtGv0Qcv0LQjX8TOrNCwKx2/snzTlqsutsQrbC6+sLQJb2nAF+ookJu317
 VwOCYJzibeV/1zKECHOmysjclk9348iEC5mj+Wpq3kmqtzHrphbGZE4NNy3oFjeoG/AR
 rIHfW3zexu439S98+UxW2kvLQRoQ4NBCbzL12YjYhbe9B4h8HTbQabUXt/0tbdB8FCS0
 7TWNAacm/bJDLuQ1h+UyQVAu+UGvCX8bvB+x29hE2JSHnIcinZw3wXFff1bKR3kny9d1
 4xBw==
X-Gm-Message-State: AOAM5333rcvA8PQJmhQ06800qPC/HznnqhA7MJ53P3HxWd8xkIr6ADBy
 TcwJt4WEbgkuhCtx2p8xcsI=
X-Google-Smtp-Source: ABdhPJyrAc9rzm4dB2lw3/nEgFaiXcijpmPD2rziJMns8K4uV1C97emxRFnkmN6KdkTyhlwj4rqtkA==
X-Received: by 2002:a17:90a:a112:: with SMTP id
 s18mr323042pjp.27.1628531815828; 
 Mon, 09 Aug 2021 10:56:55 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:2:106e:6ed1:5da1:2ac4])
 by smtp.gmail.com with ESMTPSA id x14sm20589708pfa.127.2021.08.09.10.56.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 10:56:55 -0700 (PDT)
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
 pgonda@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, sfr@canb.auug.org.au,
 saravanand@fb.com, krish.sadhukhan@oracle.com, aneesh.kumar@linux.ibm.com,
 xen-devel@lists.xenproject.org, rientjes@google.com, hannes@cmpxchg.org,
 tj@kernel.org, michael.h.kelley@microsoft.com
Subject: [PATCH V3 13/13] HV/Storvsc: Add Isolation VM support for storvsc
 driver
Date: Mon,  9 Aug 2021 13:56:17 -0400
Message-Id: <20210809175620.720923-14-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809175620.720923-1-ltykernel@gmail.com>
References: <20210809175620.720923-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, parri.andrea@gmail.com,
 linux-hyperv@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dave.hansen@intel.com,
 iommu@lists.linux-foundation.org, vkuznets@redhat.com
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

In Isolation VM, all shared memory with host needs to mark visible
to host via hvcall. vmbus_establish_gpadl() has already done it for
storvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
mpb_desc() still need to handle. Use DMA API to map/umap these
memory during sending/receiving packet and Hyper-V DMA ops callback
will use swiotlb function to allocate bounce buffer and copy data
from/to bounce buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 drivers/scsi/storvsc_drv.c | 68 +++++++++++++++++++++++++++++++++++---
 1 file changed, 63 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/storvsc_drv.c b/drivers/scsi/storvsc_drv.c
index 328bb961c281..78320719bdd8 100644
--- a/drivers/scsi/storvsc_drv.c
+++ b/drivers/scsi/storvsc_drv.c
@@ -21,6 +21,8 @@
 #include <linux/device.h>
 #include <linux/hyperv.h>
 #include <linux/blkdev.h>
+#include <linux/io.h>
+#include <linux/dma-mapping.h>
 #include <scsi/scsi.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_host.h>
@@ -427,6 +429,8 @@ struct storvsc_cmd_request {
 	u32 payload_sz;
 
 	struct vstor_packet vstor_packet;
+	u32 hvpg_count;
+	struct hv_dma_range *dma_range;
 };
 
 
@@ -509,6 +513,14 @@ struct storvsc_scan_work {
 	u8 tgt_id;
 };
 
+#define storvsc_dma_map(dev, page, offset, size, dir) \
+	dma_map_page(dev, page, offset, size, dir)
+
+#define storvsc_dma_unmap(dev, dma_range, dir)		\
+		dma_unmap_page(dev, dma_range.dma,	\
+			       dma_range.mapping_size,	\
+			       dir ? DMA_FROM_DEVICE : DMA_TO_DEVICE)
+
 static void storvsc_device_scan(struct work_struct *work)
 {
 	struct storvsc_scan_work *wrk;
@@ -1260,6 +1272,7 @@ static void storvsc_on_channel_callback(void *context)
 	struct hv_device *device;
 	struct storvsc_device *stor_device;
 	struct Scsi_Host *shost;
+	int i;
 
 	if (channel->primary_channel != NULL)
 		device = channel->primary_channel->device_obj;
@@ -1314,6 +1327,15 @@ static void storvsc_on_channel_callback(void *context)
 				request = (struct storvsc_cmd_request *)scsi_cmd_priv(scmnd);
 			}
 
+			if (request->dma_range) {
+				for (i = 0; i < request->hvpg_count; i++)
+					storvsc_dma_unmap(&device->device,
+						request->dma_range[i],
+						request->vstor_packet.vm_srb.data_in == READ_TYPE);
+
+				kfree(request->dma_range);
+			}
+
 			storvsc_on_receive(stor_device, packet, request);
 			continue;
 		}
@@ -1810,7 +1832,9 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 		unsigned int hvpgoff, hvpfns_to_add;
 		unsigned long offset_in_hvpg = offset_in_hvpage(sgl->offset);
 		unsigned int hvpg_count = HVPFN_UP(offset_in_hvpg + length);
+		dma_addr_t dma;
 		u64 hvpfn;
+		u32 size;
 
 		if (hvpg_count > MAX_PAGE_BUFFER_COUNT) {
 
@@ -1824,6 +1848,13 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 		payload->range.len = length;
 		payload->range.offset = offset_in_hvpg;
 
+		cmd_request->dma_range = kcalloc(hvpg_count,
+				 sizeof(*cmd_request->dma_range),
+				 GFP_ATOMIC);
+		if (!cmd_request->dma_range) {
+			ret = -ENOMEM;
+			goto free_payload;
+		}
 
 		for (i = 0; sgl != NULL; sgl = sg_next(sgl)) {
 			/*
@@ -1847,9 +1878,29 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 			 * last sgl should be reached at the same time that
 			 * the PFN array is filled.
 			 */
-			while (hvpfns_to_add--)
-				payload->range.pfn_array[i++] =	hvpfn++;
+			while (hvpfns_to_add--) {
+				size = min(HV_HYP_PAGE_SIZE - offset_in_hvpg,
+					   (unsigned long)length);
+				dma = storvsc_dma_map(&dev->device, pfn_to_page(hvpfn++),
+						      offset_in_hvpg, size,
+						      scmnd->sc_data_direction);
+				if (dma_mapping_error(&dev->device, dma)) {
+					ret = -ENOMEM;
+					goto free_dma_range;
+				}
+
+				if (offset_in_hvpg) {
+					payload->range.offset = dma & ~HV_HYP_PAGE_MASK;
+					offset_in_hvpg = 0;
+				}
+
+				cmd_request->dma_range[i].dma = dma;
+				cmd_request->dma_range[i].mapping_size = size;
+				payload->range.pfn_array[i++] = dma >> HV_HYP_PAGE_SHIFT;
+				length -= size;
+			}
 		}
+		cmd_request->hvpg_count = hvpg_count;
 	}
 
 	cmd_request->payload = payload;
@@ -1860,13 +1911,20 @@ static int storvsc_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *scmnd)
 	put_cpu();
 
 	if (ret == -EAGAIN) {
-		if (payload_sz > sizeof(cmd_request->mpb))
-			kfree(payload);
 		/* no more space */
-		return SCSI_MLQUEUE_DEVICE_BUSY;
+		ret = SCSI_MLQUEUE_DEVICE_BUSY;
+		goto free_dma_range;
 	}
 
 	return 0;
+
+free_dma_range:
+	kfree(cmd_request->dma_range);
+
+free_payload:
+	if (payload_sz > sizeof(cmd_request->mpb))
+		kfree(payload);
+	return ret;
 }
 
 static struct scsi_host_template scsi_driver = {
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
