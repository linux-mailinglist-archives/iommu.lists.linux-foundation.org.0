Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5887840AF1D
	for <lists.iommu@lfdr.de>; Tue, 14 Sep 2021 15:39:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD97402A1;
	Tue, 14 Sep 2021 13:39:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRTXLy7BRt3s; Tue, 14 Sep 2021 13:39:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id AADE74031F;
	Tue, 14 Sep 2021 13:39:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9442AC0011;
	Tue, 14 Sep 2021 13:39:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F1AEC000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:39:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F274180D55
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3UBqJMTpW5L for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 13:39:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5A8080D54
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:39:34 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id j6so11935777pfa.4
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 06:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=02yTUUUdT/7RUZ1OmKs0RzX0RhFgmF+tfZ6adAfAN0Q=;
 b=ArjBR52nkO4bzAaOf5wvfC4rn632GJGm1maXaaJ0TgHHpjedDqm+WJBv+1VeIaZgH8
 5flQwVivXRx6pq+gRBaVASuOXo4ymVynu6o0WucDl6BnBxy/91jZ+nwMIgdhlKICaUAN
 fL2xHyxJgQNN+aDYvnsnscMMXj3E3OC8kfXdFSGOUc0+WouUasML3nSV8Cf8i+dRrNsL
 SBZXPNecPo4cfaG1kwB4eYB7mQqvkhfeKDY6slY3Csa2hCRcX2Jhc3s7mqeRwF6/hgpa
 VplUwV00fbi/jQIiWIZD05ygm/4jJojIcYosTkxoDhhh7QGJk2WMeezVJnuWZVbEcLJ2
 7OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=02yTUUUdT/7RUZ1OmKs0RzX0RhFgmF+tfZ6adAfAN0Q=;
 b=oDKG4uYilUZ2SZ5X5BsAYWVqKAQGQkZqaCX/oOsZLkQHM/je30lnpgQKKpkVLjy8Nx
 dXhjCFy2COaTA1f1X9Qw7bmrUoVWz2lRyKYtl4QDmxowHUzfInTWEP3Qww6mf9IEZF5N
 8g28Lp2O9SMxbkiPWz7B6/OLo37fMr/WLGsItAAqgVK+CuHK6p1EDeDkMj8KvBK51WTW
 Ozs9A1twme3BbzI/E22WgfDPrQWM/qvc94RP6oMnKYNEOZTT+nohgUOElxBn3mho07uo
 QJQWr2xb02ZoYXpLBfpVENLivpeCmpv9/Xh9y1VKj6z8rqWvvPEddlptwKhHGWP46msh
 HLgQ==
X-Gm-Message-State: AOAM5338ntWTlVhGUUF06oJQVWs35dqfr+Mz6/Q8hfspiIZkNN7M3DBJ
 C7+5vPtdMczP2pGSUKjsLvw=
X-Google-Smtp-Source: ABdhPJzPDtIgzdi7XXhZ9rLdA7pHLUxlkJdK1Y4rWJkJJlHJjwPXRjwfsPAQ3lITRYtRblyGoAlIXQ==
X-Received: by 2002:a63:6544:: with SMTP id z65mr15696367pgb.325.1631626774304; 
 Tue, 14 Sep 2021 06:39:34 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:6ea2:a529:4af3:5057])
 by smtp.gmail.com with ESMTPSA id v13sm10461234pfm.16.2021.09.14.06.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:39:33 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, arnd@arndb.de,
 hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 brijesh.singh@amd.com, Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com,
 pgonda@google.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, sfr@canb.auug.org.au,
 aneesh.kumar@linux.ibm.com, saravanand@fb.com, krish.sadhukhan@oracle.com,
 xen-devel@lists.xenproject.org, tj@kernel.org, rientjes@google.com,
 michael.h.kelley@microsoft.com
Subject: [PATCH V5 04/12] Drivers: hv: vmbus: Mark vmbus ring buffer visible
 to host in Isolation VM
Date: Tue, 14 Sep 2021 09:39:05 -0400
Message-Id: <20210914133916.1440931-5-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914133916.1440931-1-ltykernel@gmail.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
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

Mark vmbus ring buffer visible with set_memory_decrypted() when
establish gpadl handle.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change sincv v4
	* Change gpadl handle in netvsc and uio driver from u32 to
	  struct vmbus_gpadl.
	* Change vmbus_establish_gpadl()'s gpadl_handle parameter
	  to vmbus_gpadl data structure.

Change since v3:
	* Change vmbus_teardown_gpadl() parameter and put gpadl handle,
	  buffer and buffer size in the struct vmbus_gpadl.
---
 drivers/hv/channel.c            | 54 ++++++++++++++++++++++++---------
 drivers/net/hyperv/hyperv_net.h |  5 +--
 drivers/net/hyperv/netvsc.c     | 17 ++++++-----
 drivers/uio/uio_hv_generic.c    | 20 ++++++------
 include/linux/hyperv.h          | 12 ++++++--
 5 files changed, 71 insertions(+), 37 deletions(-)

diff --git a/drivers/hv/channel.c b/drivers/hv/channel.c
index f3761c73b074..cf419eb1de77 100644
--- a/drivers/hv/channel.c
+++ b/drivers/hv/channel.c
@@ -17,6 +17,7 @@
 #include <linux/hyperv.h>
 #include <linux/uio.h>
 #include <linux/interrupt.h>
+#include <linux/set_memory.h>
 #include <asm/page.h>
 #include <asm/mshyperv.h>
 
@@ -456,7 +457,7 @@ static int create_gpadl_header(enum hv_gpadl_type type, void *kbuffer,
 static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 				   enum hv_gpadl_type type, void *kbuffer,
 				   u32 size, u32 send_offset,
-				   u32 *gpadl_handle)
+				   struct vmbus_gpadl *gpadl)
 {
 	struct vmbus_channel_gpadl_header *gpadlmsg;
 	struct vmbus_channel_gpadl_body *gpadl_body;
@@ -474,6 +475,15 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	if (ret)
 		return ret;
 
+	ret = set_memory_decrypted((unsigned long)kbuffer,
+				   HVPFN_UP(size));
+	if (ret) {
+		dev_warn(&channel->device_obj->device,
+			 "Failed to set host visibility for new GPADL %d.\n",
+			 ret);
+		return ret;
+	}
+
 	init_completion(&msginfo->waitevent);
 	msginfo->waiting_channel = channel;
 
@@ -537,7 +547,10 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	}
 
 	/* At this point, we received the gpadl created msg */
-	*gpadl_handle = gpadlmsg->gpadl;
+	gpadl->gpadl_handle = gpadlmsg->gpadl;
+	gpadl->buffer = kbuffer;
+	gpadl->size = size;
+
 
 cleanup:
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
@@ -549,6 +562,11 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
 	}
 
 	kfree(msginfo);
+
+	if (ret)
+		set_memory_encrypted((unsigned long)kbuffer,
+				     HVPFN_UP(size));
+
 	return ret;
 }
 
@@ -561,10 +579,10 @@ static int __vmbus_establish_gpadl(struct vmbus_channel *channel,
  * @gpadl_handle: some funky thing
  */
 int vmbus_establish_gpadl(struct vmbus_channel *channel, void *kbuffer,
-			  u32 size, u32 *gpadl_handle)
+			  u32 size, struct vmbus_gpadl *gpadl)
 {
 	return __vmbus_establish_gpadl(channel, HV_GPADL_BUFFER, kbuffer, size,
-				       0U, gpadl_handle);
+				       0U, gpadl);
 }
 EXPORT_SYMBOL_GPL(vmbus_establish_gpadl);
 
@@ -639,6 +657,7 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 	struct vmbus_channel_open_channel *open_msg;
 	struct vmbus_channel_msginfo *open_info = NULL;
 	struct page *page = newchannel->ringbuffer_page;
+	struct vmbus_gpadl gpadl;
 	u32 send_pages, recv_pages;
 	unsigned long flags;
 	int err;
@@ -675,7 +694,7 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 		goto error_clean_ring;
 
 	/* Establish the gpadl for the ring buffer */
-	newchannel->ringbuffer_gpadlhandle = 0;
+	newchannel->ringbuffer_gpadlhandle.gpadl_handle = 0;
 
 	err = __vmbus_establish_gpadl(newchannel, HV_GPADL_RING,
 				      page_address(newchannel->ringbuffer_page),
@@ -701,7 +720,8 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 	open_msg->header.msgtype = CHANNELMSG_OPENCHANNEL;
 	open_msg->openid = newchannel->offermsg.child_relid;
 	open_msg->child_relid = newchannel->offermsg.child_relid;
-	open_msg->ringbuffer_gpadlhandle = newchannel->ringbuffer_gpadlhandle;
+	open_msg->ringbuffer_gpadlhandle
+		= newchannel->ringbuffer_gpadlhandle.gpadl_handle;
 	/*
 	 * The unit of ->downstream_ringbuffer_pageoffset is HV_HYP_PAGE and
 	 * the unit of ->ringbuffer_send_offset (i.e. send_pages) is PAGE, so
@@ -759,8 +779,8 @@ static int __vmbus_open(struct vmbus_channel *newchannel,
 error_free_info:
 	kfree(open_info);
 error_free_gpadl:
-	vmbus_teardown_gpadl(newchannel, newchannel->ringbuffer_gpadlhandle);
-	newchannel->ringbuffer_gpadlhandle = 0;
+	vmbus_teardown_gpadl(newchannel, &newchannel->ringbuffer_gpadlhandle);
+	newchannel->ringbuffer_gpadlhandle.gpadl_handle = 0;
 error_clean_ring:
 	hv_ringbuffer_cleanup(&newchannel->outbound);
 	hv_ringbuffer_cleanup(&newchannel->inbound);
@@ -806,7 +826,7 @@ EXPORT_SYMBOL_GPL(vmbus_open);
 /*
  * vmbus_teardown_gpadl -Teardown the specified GPADL handle
  */
-int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
+int vmbus_teardown_gpadl(struct vmbus_channel *channel, struct vmbus_gpadl *gpadl)
 {
 	struct vmbus_channel_gpadl_teardown *msg;
 	struct vmbus_channel_msginfo *info;
@@ -825,7 +845,7 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 
 	msg->header.msgtype = CHANNELMSG_GPADL_TEARDOWN;
 	msg->child_relid = channel->offermsg.child_relid;
-	msg->gpadl = gpadl_handle;
+	msg->gpadl = gpadl->gpadl_handle;
 
 	spin_lock_irqsave(&vmbus_connection.channelmsg_lock, flags);
 	list_add_tail(&info->msglistentry,
@@ -859,6 +879,12 @@ int vmbus_teardown_gpadl(struct vmbus_channel *channel, u32 gpadl_handle)
 	spin_unlock_irqrestore(&vmbus_connection.channelmsg_lock, flags);
 
 	kfree(info);
+
+	ret = set_memory_encrypted((unsigned long)gpadl->buffer,
+				   HVPFN_UP(gpadl->size));
+	if (ret)
+		pr_warn("Fail to set mem host visibility in GPADL teardown %d.\n", ret);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(vmbus_teardown_gpadl);
@@ -896,6 +922,7 @@ void vmbus_reset_channel_cb(struct vmbus_channel *channel)
 static int vmbus_close_internal(struct vmbus_channel *channel)
 {
 	struct vmbus_channel_close_channel *msg;
+	struct vmbus_gpadl gpadl;
 	int ret;
 
 	vmbus_reset_channel_cb(channel);
@@ -933,9 +960,8 @@ static int vmbus_close_internal(struct vmbus_channel *channel)
 	}
 
 	/* Tear down the gpadl for the channel's ring buffer */
-	else if (channel->ringbuffer_gpadlhandle) {
-		ret = vmbus_teardown_gpadl(channel,
-					   channel->ringbuffer_gpadlhandle);
+	else if (channel->ringbuffer_gpadlhandle.gpadl_handle) {
+		ret = vmbus_teardown_gpadl(channel, &channel->ringbuffer_gpadlhandle);
 		if (ret) {
 			pr_err("Close failed: teardown gpadl return %d\n", ret);
 			/*
@@ -944,7 +970,7 @@ static int vmbus_close_internal(struct vmbus_channel *channel)
 			 */
 		}
 
-		channel->ringbuffer_gpadlhandle = 0;
+		channel->ringbuffer_gpadlhandle.gpadl_handle = 0;
 	}
 
 	if (!ret)
diff --git a/drivers/net/hyperv/hyperv_net.h b/drivers/net/hyperv/hyperv_net.h
index bc48855dff10..315278a7cf88 100644
--- a/drivers/net/hyperv/hyperv_net.h
+++ b/drivers/net/hyperv/hyperv_net.h
@@ -1075,14 +1075,15 @@ struct netvsc_device {
 	/* Receive buffer allocated by us but manages by NetVSP */
 	void *recv_buf;
 	u32 recv_buf_size; /* allocated bytes */
-	u32 recv_buf_gpadl_handle;
+	struct vmbus_gpadl recv_buf_gpadl_handle;
 	u32 recv_section_cnt;
 	u32 recv_section_size;
 	u32 recv_completion_cnt;
 
 	/* Send buffer allocated by us */
 	void *send_buf;
-	u32 send_buf_gpadl_handle;
+	u32 send_buf_size;
+	struct vmbus_gpadl send_buf_gpadl_handle;
 	u32 send_section_cnt;
 	u32 send_section_size;
 	unsigned long *send_section_map;
diff --git a/drivers/net/hyperv/netvsc.c b/drivers/net/hyperv/netvsc.c
index 7bd935412853..1f87e570ed2b 100644
--- a/drivers/net/hyperv/netvsc.c
+++ b/drivers/net/hyperv/netvsc.c
@@ -278,9 +278,9 @@ static void netvsc_teardown_recv_gpadl(struct hv_device *device,
 {
 	int ret;
 
-	if (net_device->recv_buf_gpadl_handle) {
+	if (net_device->recv_buf_gpadl_handle.gpadl_handle) {
 		ret = vmbus_teardown_gpadl(device->channel,
-					   net_device->recv_buf_gpadl_handle);
+					   &net_device->recv_buf_gpadl_handle);
 
 		/* If we failed here, we might as well return and have a leak
 		 * rather than continue and a bugchk
@@ -290,7 +290,7 @@ static void netvsc_teardown_recv_gpadl(struct hv_device *device,
 				   "unable to teardown receive buffer's gpadl\n");
 			return;
 		}
-		net_device->recv_buf_gpadl_handle = 0;
+		net_device->recv_buf_gpadl_handle.gpadl_handle = 0;
 	}
 }
 
@@ -300,9 +300,9 @@ static void netvsc_teardown_send_gpadl(struct hv_device *device,
 {
 	int ret;
 
-	if (net_device->send_buf_gpadl_handle) {
+	if (net_device->send_buf_gpadl_handle.gpadl_handle) {
 		ret = vmbus_teardown_gpadl(device->channel,
-					   net_device->send_buf_gpadl_handle);
+					   &net_device->send_buf_gpadl_handle);
 
 		/* If we failed here, we might as well return and have a leak
 		 * rather than continue and a bugchk
@@ -312,7 +312,7 @@ static void netvsc_teardown_send_gpadl(struct hv_device *device,
 				   "unable to teardown send buffer's gpadl\n");
 			return;
 		}
-		net_device->send_buf_gpadl_handle = 0;
+		net_device->send_buf_gpadl_handle.gpadl_handle = 0;
 	}
 }
 
@@ -380,7 +380,7 @@ static int netvsc_init_buf(struct hv_device *device,
 	memset(init_packet, 0, sizeof(struct nvsp_message));
 	init_packet->hdr.msg_type = NVSP_MSG1_TYPE_SEND_RECV_BUF;
 	init_packet->msg.v1_msg.send_recv_buf.
-		gpadl_handle = net_device->recv_buf_gpadl_handle;
+		gpadl_handle = net_device->recv_buf_gpadl_handle.gpadl_handle;
 	init_packet->msg.v1_msg.
 		send_recv_buf.id = NETVSC_RECEIVE_BUFFER_ID;
 
@@ -463,6 +463,7 @@ static int netvsc_init_buf(struct hv_device *device,
 		ret = -ENOMEM;
 		goto cleanup;
 	}
+	net_device->send_buf_size = buf_size;
 
 	/* Establish the gpadl handle for this buffer on this
 	 * channel.  Note: This call uses the vmbus connection rather
@@ -482,7 +483,7 @@ static int netvsc_init_buf(struct hv_device *device,
 	memset(init_packet, 0, sizeof(struct nvsp_message));
 	init_packet->hdr.msg_type = NVSP_MSG1_TYPE_SEND_SEND_BUF;
 	init_packet->msg.v1_msg.send_send_buf.gpadl_handle =
-		net_device->send_buf_gpadl_handle;
+		net_device->send_buf_gpadl_handle.gpadl_handle;
 	init_packet->msg.v1_msg.send_send_buf.id = NETVSC_SEND_BUFFER_ID;
 
 	trace_nvsp_send(ndev, init_packet);
diff --git a/drivers/uio/uio_hv_generic.c b/drivers/uio/uio_hv_generic.c
index 652fe2547587..548243dcd895 100644
--- a/drivers/uio/uio_hv_generic.c
+++ b/drivers/uio/uio_hv_generic.c
@@ -58,11 +58,11 @@ struct hv_uio_private_data {
 	atomic_t refcnt;
 
 	void	*recv_buf;
-	u32	recv_gpadl;
+	struct vmbus_gpadl recv_gpadl;
 	char	recv_name[32];	/* "recv_4294967295" */
 
 	void	*send_buf;
-	u32	send_gpadl;
+	struct vmbus_gpadl send_gpadl;
 	char	send_name[32];
 };
 
@@ -179,15 +179,15 @@ hv_uio_new_channel(struct vmbus_channel *new_sc)
 static void
 hv_uio_cleanup(struct hv_device *dev, struct hv_uio_private_data *pdata)
 {
-	if (pdata->send_gpadl) {
-		vmbus_teardown_gpadl(dev->channel, pdata->send_gpadl);
-		pdata->send_gpadl = 0;
+	if (pdata->send_gpadl.gpadl_handle) {
+		vmbus_teardown_gpadl(dev->channel, &pdata->send_gpadl);
+		pdata->send_gpadl.gpadl_handle = 0;
 		vfree(pdata->send_buf);
 	}
 
-	if (pdata->recv_gpadl) {
-		vmbus_teardown_gpadl(dev->channel, pdata->recv_gpadl);
-		pdata->recv_gpadl = 0;
+	if (pdata->recv_gpadl.gpadl_handle) {
+		vmbus_teardown_gpadl(dev->channel, &pdata->recv_gpadl);
+		pdata->recv_gpadl.gpadl_handle = 0;
 		vfree(pdata->recv_buf);
 	}
 }
@@ -303,7 +303,7 @@ hv_uio_probe(struct hv_device *dev,
 
 	/* put Global Physical Address Label in name */
 	snprintf(pdata->recv_name, sizeof(pdata->recv_name),
-		 "recv:%u", pdata->recv_gpadl);
+		 "recv:%u", pdata->recv_gpadl.gpadl_handle);
 	pdata->info.mem[RECV_BUF_MAP].name = pdata->recv_name;
 	pdata->info.mem[RECV_BUF_MAP].addr
 		= (uintptr_t)pdata->recv_buf;
@@ -324,7 +324,7 @@ hv_uio_probe(struct hv_device *dev,
 	}
 
 	snprintf(pdata->send_name, sizeof(pdata->send_name),
-		 "send:%u", pdata->send_gpadl);
+		 "send:%u", pdata->send_gpadl.gpadl_handle);
 	pdata->info.mem[SEND_BUF_MAP].name = pdata->send_name;
 	pdata->info.mem[SEND_BUF_MAP].addr
 		= (uintptr_t)pdata->send_buf;
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index ddc8713ce57b..a9e0bc3b1511 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -803,6 +803,12 @@ struct vmbus_device {
 
 #define VMBUS_DEFAULT_MAX_PKT_SIZE 4096
 
+struct vmbus_gpadl {
+	u32 gpadl_handle;
+	u32 size;
+	void *buffer;
+};
+
 struct vmbus_channel {
 	struct list_head listentry;
 
@@ -822,7 +828,7 @@ struct vmbus_channel {
 	bool rescind_ref; /* got rescind msg, got channel reference */
 	struct completion rescind_event;
 
-	u32 ringbuffer_gpadlhandle;
+	struct vmbus_gpadl ringbuffer_gpadlhandle;
 
 	/* Allocated memory for ring buffer */
 	struct page *ringbuffer_page;
@@ -1192,10 +1198,10 @@ extern int vmbus_sendpacket_mpb_desc(struct vmbus_channel *channel,
 extern int vmbus_establish_gpadl(struct vmbus_channel *channel,
 				      void *kbuffer,
 				      u32 size,
-				      u32 *gpadl_handle);
+				      struct vmbus_gpadl *gpadl);
 
 extern int vmbus_teardown_gpadl(struct vmbus_channel *channel,
-				     u32 gpadl_handle);
+				     struct vmbus_gpadl *gpadl);
 
 void vmbus_reset_channel_cb(struct vmbus_channel *channel);
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
