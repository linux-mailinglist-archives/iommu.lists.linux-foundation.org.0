Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C51963F9D92
	for <lists.iommu@lfdr.de>; Fri, 27 Aug 2021 19:21:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 760A6407E1;
	Fri, 27 Aug 2021 17:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzFFnqr1OTme; Fri, 27 Aug 2021 17:21:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D27F34082E;
	Fri, 27 Aug 2021 17:21:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B93C7C0022;
	Fri, 27 Aug 2021 17:21:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 248CAC000E
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 17:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C77C383B27
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NVXdxPRPTjOF for <iommu@lists.linux-foundation.org>;
 Fri, 27 Aug 2021 17:21:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4DFE835D9
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 17:21:52 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id m4so4386709pll.0
 for <iommu@lists.linux-foundation.org>; Fri, 27 Aug 2021 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eP71HsUL5jIprgafHAa9nr+PcbJTMafwTb0JYXooIkc=;
 b=XjA9RK0diCV/NGST3xrY+yd75EDMjsEGQH/MoBKRQsWG98prw900XXUkrlbVQCqUsQ
 MHaMnEN2Pe1TBwV5HSpMusMKHgOPjJJDZhE8XYHKthbV12ljewMWRv80ALVBlRldp490
 2sekztXz8D83jxYZ1FxlIPO0hq2wjpQo9hhi6k7rnZ+U4VdreZrd65DZqEmNtQ4iA69z
 OfLzvtnocSEsnMg1+wRdnNjowgFs3Qzam2F6tgirRv6C6/YUzrjupd4EDR0bN422QOG7
 CMtR7z4OxOmMiP1InmgQnMFT4IgQbStpJ2yslzTuqG3+eouVXEjyk7XY5T/Ono+Ukm7S
 ckdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eP71HsUL5jIprgafHAa9nr+PcbJTMafwTb0JYXooIkc=;
 b=GSctk+RHNKtGRrzda7Qiy2rOMj0Yhfb9UhqTrkOEY1mPhMQbeajCPf4OMj4KZIsXEX
 t7tsy4I3NinNerABASGNTHDTIARKNcNUYGmz55kb0+Prm3kQSXtCi156IPeGBkLSE1DU
 +Yv0tgOIGZuBJeUcwsBe4GgkCdNxZMjspWNZljizFFuYiC2rWQVHE2m0en90G2NKXsSd
 YlDeMl7rZitRhPPrTCR6wHZJsVAkx3ibJmg1TU0qtgrasB/IE4z6MF5nvBbUNNDoz0y+
 4yAoYQ5L59kdk+NunlY9TdTMz0YeoSwUfozfKjlaQxV8IDxjs1rWcuwrvPfP8jwoQeQx
 3sPw==
X-Gm-Message-State: AOAM53157pgGt3eXcza0a3bDUweXX17/GuC0bFGzcu7zsjwOxCqL1tJo
 FoHuaVDo4D2PwQ+03t0XYvk=
X-Google-Smtp-Source: ABdhPJzzwuvbNkjkSkGeJFwgRJTLC75ZjTV696jyMEv0G8ZUsAhjChdDm2//FEE8VuhUyD1GKzVAhg==
X-Received: by 2002:a17:90a:718c:: with SMTP id
 i12mr3199697pjk.182.1630084912377; 
 Fri, 27 Aug 2021 10:21:52 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:ef50:8fcd:44d1:eb17])
 by smtp.gmail.com with ESMTPSA id f5sm7155015pjo.23.2021.08.27.10.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 10:21:51 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, catalin.marinas@arm.com,
 will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, dave.hansen@linux.intel.com,
 luto@kernel.org, peterz@infradead.org, konrad.wilk@oracle.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 joro@8bytes.org, davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, arnd@arndb.de,
 hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 brijesh.singh@amd.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 pgonda@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 rientjes@google.com, ardb@kernel.org, michael.h.kelley@microsoft.com
Subject: [PATCH V4 12/13] hv_netvsc: Add Isolation VM support for netvsc driver
Date: Fri, 27 Aug 2021 13:21:10 -0400
Message-Id: <20210827172114.414281-13-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827172114.414281-1-ltykernel@gmail.com>
References: <20210827172114.414281-1-ltykernel@gmail.com>
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
netvsc rx/tx ring buffer. The page buffer used by vmbus_sendpacket_
pagebuffer() stills need to be handled. Use DMA API to map/umap
these memory during sending/receiving packet and Hyper-V swiotlb
bounce buffer dma adress will be returned. The swiotlb bounce buffer
has been masked to be visible to host during boot up.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* Add comment to explain why not to use dma_map_sg()
	* Fix some error handle.
---
 arch/x86/hyperv/ivm.c             |   1 +
 drivers/net/hyperv/hyperv_net.h   |   5 ++
 drivers/net/hyperv/netvsc.c       | 135 +++++++++++++++++++++++++++++-
 drivers/net/hyperv/rndis_filter.c |   2 +
 include/linux/hyperv.h            |   5 ++
 5 files changed, 145 insertions(+), 3 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 84563b3c9f3a..08d8e01de017 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -317,6 +317,7 @@ void *hv_map_memory(void *addr, unsigned long size)
 
 	return vaddr;
 }
+EXPORT_SYMBOL_GPL(hv_map_memory);
 
 void hv_unmap_memory(void *addr)
 {
diff --git a/drivers/net/hyperv/hyperv_net.h b/drivers/net/hyperv/hyperv_net.h
index aa7c9962dbd8..862419912bfb 100644
--- a/drivers/net/hyperv/hyperv_net.h
+++ b/drivers/net/hyperv/hyperv_net.h
@@ -164,6 +164,7 @@ struct hv_netvsc_packet {
 	u32 total_bytes;
 	u32 send_buf_index;
 	u32 total_data_buflen;
+	struct hv_dma_range *dma_range;
 };
 
 #define NETVSC_HASH_KEYLEN 40
@@ -1074,6 +1075,7 @@ struct netvsc_device {
 
 	/* Receive buffer allocated by us but manages by NetVSP */
 	void *recv_buf;
+	void *recv_original_buf;
 	u32 recv_buf_size; /* allocated bytes */
 	u32 recv_buf_gpadl_handle;
 	u32 recv_section_cnt;
@@ -1082,6 +1084,7 @@ struct netvsc_device {
 
 	/* Send buffer allocated by us */
 	void *send_buf;
+	void *send_original_buf;
 	u32 send_buf_size;
 	u32 send_buf_gpadl_handle;
 	u32 send_section_cnt;
@@ -1731,4 +1734,6 @@ struct rndis_message {
 #define RETRY_US_HI	10000
 #define RETRY_MAX	2000	/* >10 sec */
 
+void netvsc_dma_unmap(struct hv_device *hv_dev,
+		      struct hv_netvsc_packet *packet);
 #endif /* _HYPERV_NET_H */
diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index f19bffff6a63..edd336b08c2c 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -153,8 +153,21 @@ static void free_netvsc_device(struct rcu_head *head)
 	int i;
 
 	kfree(nvdev->extension);
-	vfree(nvdev->recv_buf);
-	vfree(nvdev->send_buf);
+
+	if (nvdev->recv_original_buf) {
+		vunmap(nvdev->recv_buf);
+		vfree(nvdev->recv_original_buf);
+	} else {
+		vfree(nvdev->recv_buf);
+	}
+
+	if (nvdev->send_original_buf) {
+		vunmap(nvdev->send_buf);
+		vfree(nvdev->send_original_buf);
+	} else {
+		vfree(nvdev->send_buf);
+	}
+
 	kfree(nvdev->send_section_map);
 
 	for (i = 0; i < VRSS_CHANNEL_MAX; i++) {
@@ -347,6 +360,7 @@ static int netvsc_init_buf(struct hv_device *device,
 	unsigned int buf_size;
 	size_t map_words;
 	int i, ret = 0;
+	void *vaddr;
 
 	/* Get receive buffer area. */
 	buf_size = device_info->recv_sections * device_info->recv_section_size;
@@ -382,6 +396,17 @@ static int netvsc_init_buf(struct hv_device *device,
 		goto cleanup;
 	}
 
+	if (hv_isolation_type_snp()) {
+		vaddr = hv_map_memory(net_device->recv_buf, buf_size);
+		if (!vaddr) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		net_device->recv_original_buf = net_device->recv_buf;
+		net_device->recv_buf = vaddr;
+	}
+
 	/* Notify the NetVsp of the gpadl handle */
 	init_packet = &net_device->channel_init_pkt;
 	memset(init_packet, 0, sizeof(struct nvsp_message));
@@ -485,6 +510,17 @@ static int netvsc_init_buf(struct hv_device *device,
 		goto cleanup;
 	}
 
+	if (hv_isolation_type_snp()) {
+		vaddr = hv_map_memory(net_device->send_buf, buf_size);
+		if (!vaddr) {
+			ret = -ENOMEM;
+			goto cleanup;
+		}
+
+		net_device->send_original_buf = net_device->send_buf;
+		net_device->send_buf = vaddr;
+	}
+
 	/* Notify the NetVsp of the gpadl handle */
 	init_packet = &net_device->channel_init_pkt;
 	memset(init_packet, 0, sizeof(struct nvsp_message));
@@ -775,7 +811,7 @@ static void netvsc_send_tx_complete(struct net_device *ndev,
 
 	/* Notify the layer above us */
 	if (likely(skb)) {
-		const struct hv_netvsc_packet *packet
+		struct hv_netvsc_packet *packet
 			= (struct hv_netvsc_packet *)skb->cb;
 		u32 send_index = packet->send_buf_index;
 		struct netvsc_stats *tx_stats;
@@ -791,6 +827,7 @@ static void netvsc_send_tx_complete(struct net_device *ndev,
 		tx_stats->bytes += packet->total_bytes;
 		u64_stats_update_end(&tx_stats->syncp);
 
+		netvsc_dma_unmap(ndev_ctx->device_ctx, packet);
 		napi_consume_skb(skb, budget);
 	}
 
@@ -955,6 +992,87 @@ static void netvsc_copy_to_send_buf(struct netvsc_device *net_device,
 		memset(dest, 0, padding);
 }
 
+void netvsc_dma_unmap(struct hv_device *hv_dev,
+		      struct hv_netvsc_packet *packet)
+{
+	u32 page_count = packet->cp_partial ?
+		packet->page_buf_cnt - packet->rmsg_pgcnt :
+		packet->page_buf_cnt;
+	int i;
+
+	if (!hv_is_isolation_supported())
+		return;
+
+	if (!packet->dma_range)
+		return;
+
+	for (i = 0; i < page_count; i++)
+		dma_unmap_single(&hv_dev->device, packet->dma_range[i].dma,
+				 packet->dma_range[i].mapping_size,
+				 DMA_TO_DEVICE);
+
+	kfree(packet->dma_range);
+}
+
+/* netvsc_dma_map - Map swiotlb bounce buffer with data page of
+ * packet sent by vmbus_sendpacket_pagebuffer() in the Isolation
+ * VM.
+ *
+ * In isolation VM, netvsc send buffer has been marked visible to
+ * host and so the data copied to send buffer doesn't need to use
+ * bounce buffer. The data pages handled by vmbus_sendpacket_pagebuffer()
+ * may not be copied to send buffer and so these pages need to be
+ * mapped with swiotlb bounce buffer. netvsc_dma_map() is to do
+ * that. The pfns in the struct hv_page_buffer need to be converted
+ * to bounce buffer's pfn. The loop here is necessary becuase the
+ * entries in the page buffer array are not necessarily full
+ * pages of data.  Each entry in the array has a separate offset and
+ * len that may be non-zero, even for entries in the middle of the
+ * array.  And the entries are not physically contiguous.  So each
+ * entry must be individually mapped rather than as a contiguous unit.
+ * So not use dma_map_sg() here.
+ */
+int netvsc_dma_map(struct hv_device *hv_dev,
+		   struct hv_netvsc_packet *packet,
+		   struct hv_page_buffer *pb)
+{
+	u32 page_count =  packet->cp_partial ?
+		packet->page_buf_cnt - packet->rmsg_pgcnt :
+		packet->page_buf_cnt;
+	dma_addr_t dma;
+	int i;
+
+	if (!hv_is_isolation_supported())
+		return 0;
+
+	packet->dma_range = kcalloc(page_count,
+				    sizeof(*packet->dma_range),
+				    GFP_KERNEL);
+	if (!packet->dma_range)
+		return -ENOMEM;
+
+	for (i = 0; i < page_count; i++) {
+		char *src = phys_to_virt((pb[i].pfn << HV_HYP_PAGE_SHIFT)
+					 + pb[i].offset);
+		u32 len = pb[i].len;
+
+		dma = dma_map_single(&hv_dev->device, src, len,
+				     DMA_TO_DEVICE);
+		if (dma_mapping_error(&hv_dev->device, dma)) {
+			kfree(packet->dma_range);
+			return -ENOMEM;
+		}
+
+		packet->dma_range[i].dma = dma;
+		packet->dma_range[i].mapping_size = len;
+		pb[i].pfn = dma >> HV_HYP_PAGE_SHIFT;
+		pb[i].offset = offset_in_hvpage(dma);
+		pb[i].len = len;
+	}
+
+	return 0;
+}
+
 static inline int netvsc_send_pkt(
 	struct hv_device *device,
 	struct hv_netvsc_packet *packet,
@@ -995,14 +1113,24 @@ static inline int netvsc_send_pkt(
 
 	trace_nvsp_send_pkt(ndev, out_channel, rpkt);
 
+	packet->dma_range = NULL;
 	if (packet->page_buf_cnt) {
 		if (packet->cp_partial)
 			pb += packet->rmsg_pgcnt;
 
+		ret = netvsc_dma_map(ndev_ctx->device_ctx, packet, pb);
+		if (ret) {
+			ret = -EAGAIN;
+			goto exit; 
+		}
+
 		ret = vmbus_sendpacket_pagebuffer(out_channel,
 						  pb, packet->page_buf_cnt,
 						  &nvmsg, sizeof(nvmsg),
 						  req_id);
+
+		if (ret)
+			netvsc_dma_unmap(ndev_ctx->device_ctx, packet);
 	} else {
 		ret = vmbus_sendpacket(out_channel,
 				       &nvmsg, sizeof(nvmsg),
@@ -1010,6 +1138,7 @@ static inline int netvsc_send_pkt(
 				       VMBUS_DATA_PACKET_FLAG_COMPLETION_REQUESTED);
 	}
 
+exit:
 	if (ret == 0) {
 		atomic_inc_return(&nvchan->queue_sends);
 
diff --git a/drivers/net/hyperv/rndis_filter.c b/drivers/net/hyperv/rndis_filter.c
index f6c9c2a670f9..448fcc325ed7 100644
--- a/drivers/net/hyperv/rndis_filter.c
+++ b/drivers/net/hyperv/rndis_filter.c
@@ -361,6 +361,8 @@ static void rndis_filter_receive_response(struct net_device *ndev,
 			}
 		}
 
+		netvsc_dma_unmap(((struct net_device_context *)
+			netdev_priv(ndev))->device_ctx, &request->pkt);
 		complete(&request->wait_event);
 	} else {
 		netdev_err(ndev,
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index 724a735d722a..139a43ad65a1 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1596,6 +1596,11 @@ struct hyperv_service_callback {
 	void (*callback)(void *context);
 };
 
+struct hv_dma_range {
+	dma_addr_t dma;
+	u32 mapping_size;
+};
+
 #define MAX_SRV_VER	0x7ffffff
 extern bool vmbus_prep_negotiate_resp(struct icmsg_hdr *icmsghdrp, u8 *buf, u32 buflen,
 				const int *fw_version, int fw_vercnt,
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
