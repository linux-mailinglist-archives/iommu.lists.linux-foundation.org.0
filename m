Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEAE26A959
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 18:09:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39BCD8690F;
	Tue, 15 Sep 2020 16:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PKQQ3JJI9RHu; Tue, 15 Sep 2020 16:09:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EF2DE8359A;
	Tue, 15 Sep 2020 16:09:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E09C2C0051;
	Tue, 15 Sep 2020 16:09:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8261EC0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7110F87246
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8i0O1D27j4wg for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 16:09:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 23A5A8707C
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=4VyhbiOMgzm0QPHeJGUyTZJJAAD6pLEtbJL5rBmX2KE=; b=EVw+5UvoluZB3eJ6b8C05Ki3r/
 qmryI7WEF5ab64mHzPbaIatrZ1US9k0tzAxQ54kO3OBb4lqjPH65JQcbJ2Ft0lrQayV2eF7Vg/yGV
 otOuoODny2dUJDUZr0bVtcG7wkyP8e3TEqK0wp/asnQRaOLwrR+M0z4gdWYBrmcMFEe6h888n7GuL
 K0NEwaEAiZqm2c4vYRJxAYgQ67ngfmTiD6tZlyRSVdZ6YmOWyJb4iVV/FUEQKoMZ2CW8dhrTnZdTt
 GQ9oZnmqbteXn8qbck40adE7ZXtD7pQ56tGHtk46yWWYyho6gG5PhOPd/T/Tlz+fTJoU5MbIGp/Dh
 40SyJU+w==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIDVj-0004PH-Ca; Tue, 15 Sep 2020 16:08:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Matt Porter <mporter@kernel.crashing.org>, iommu@lists.linux-foundation.org
Subject: [PATCH 07/18] 53c700: improve non-coherent DMA handling
Date: Tue, 15 Sep 2020 17:51:11 +0200
Message-Id: <20200915155122.1768241-8-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915155122.1768241-1-hch@lst.de>
References: <20200915155122.1768241-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
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

Switch the 53c700 driver to only use non-coherent descriptor memory if it
really has to because dma_alloc_coherent fails.  This doesn't matter for
any of the platforms it runs on currently, but that will change soon.

To help with this two new helpers to transfer ownership to and from the
device are added that abstract the syncing of the non-coherent memory.
The two current bidirectional cases are mapped to transfers to the
device, as that appears to what they are used for.  Note that for parisc,
which is the only architecture this driver needs to use non-coherent
memory on, the direction argument of dma_cache_sync is ignored, so this
will not change behavior in any way.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/53c700.c | 113 +++++++++++++++++++++++-------------------
 drivers/scsi/53c700.h |  17 ++++---
 2 files changed, 72 insertions(+), 58 deletions(-)

diff --git a/drivers/scsi/53c700.c b/drivers/scsi/53c700.c
index 84b57a8f86bfa9..c59226d7e2f6b5 100644
--- a/drivers/scsi/53c700.c
+++ b/drivers/scsi/53c700.c
@@ -269,6 +269,20 @@ NCR_700_get_SXFER(struct scsi_device *SDp)
 					      spi_period(SDp->sdev_target));
 }
 
+static inline void dma_sync_to_dev(struct NCR_700_Host_Parameters *h,
+		void *addr, size_t size)
+{
+	if (h->noncoherent)
+		dma_cache_sync(h->dev, addr, size, DMA_TO_DEVICE);
+}
+
+static inline void dma_sync_from_dev(struct NCR_700_Host_Parameters *h,
+		void *addr, size_t size)
+{
+	if (h->noncoherent)
+		dma_cache_sync(h->dev, addr, size, DMA_FROM_DEVICE);
+}
+
 struct Scsi_Host *
 NCR_700_detect(struct scsi_host_template *tpnt,
 	       struct NCR_700_Host_Parameters *hostdata, struct device *dev)
@@ -283,9 +297,13 @@ NCR_700_detect(struct scsi_host_template *tpnt,
 	if(tpnt->sdev_attrs == NULL)
 		tpnt->sdev_attrs = NCR_700_dev_attrs;
 
-	memory = dma_alloc_attrs(dev, TOTAL_MEM_SIZE, &pScript,
-				 GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
-	if(memory == NULL) {
+	memory = dma_alloc_coherent(dev, TOTAL_MEM_SIZE, &pScript, GFP_KERNEL);
+	if (!memory) {
+		hostdata->noncoherent = 1;
+		memory = dma_alloc_attrs(dev, TOTAL_MEM_SIZE, &pScript,
+					 GFP_KERNEL, DMA_ATTR_NON_CONSISTENT);
+	}
+	if (!memory) {
 		printk(KERN_ERR "53c700: Failed to allocate memory for driver, detaching\n");
 		return NULL;
 	}
@@ -339,11 +357,11 @@ NCR_700_detect(struct scsi_host_template *tpnt,
 	for (j = 0; j < PATCHES; j++)
 		script[LABELPATCHES[j]] = bS_to_host(pScript + SCRIPT[LABELPATCHES[j]]);
 	/* now patch up fixed addresses. */
-	script_patch_32(hostdata->dev, script, MessageLocation,
+	script_patch_32(hostdata, script, MessageLocation,
 			pScript + MSGOUT_OFFSET);
-	script_patch_32(hostdata->dev, script, StatusAddress,
+	script_patch_32(hostdata, script, StatusAddress,
 			pScript + STATUS_OFFSET);
-	script_patch_32(hostdata->dev, script, ReceiveMsgAddress,
+	script_patch_32(hostdata, script, ReceiveMsgAddress,
 			pScript + MSGIN_OFFSET);
 
 	hostdata->script = script;
@@ -395,8 +413,12 @@ NCR_700_release(struct Scsi_Host *host)
 	struct NCR_700_Host_Parameters *hostdata = 
 		(struct NCR_700_Host_Parameters *)host->hostdata[0];
 
-	dma_free_attrs(hostdata->dev, TOTAL_MEM_SIZE, hostdata->script,
-		       hostdata->pScript, DMA_ATTR_NON_CONSISTENT);
+	if (hostdata->noncoherent)
+		dma_free_attrs(hostdata->dev, TOTAL_MEM_SIZE, hostdata->script,
+			       hostdata->pScript, DMA_ATTR_NON_CONSISTENT);
+	else
+		dma_free_coherent(hostdata->dev, TOTAL_MEM_SIZE,
+				  hostdata->script, hostdata->pScript);
 	return 1;
 }
 
@@ -804,8 +826,8 @@ process_extended_message(struct Scsi_Host *host,
 			shost_printk(KERN_WARNING, host,
 				"Unexpected SDTR msg\n");
 			hostdata->msgout[0] = A_REJECT_MSG;
-			dma_cache_sync(hostdata->dev, hostdata->msgout, 1, DMA_TO_DEVICE);
-			script_patch_16(hostdata->dev, hostdata->script,
+			dma_sync_to_dev(hostdata, hostdata->msgout, 1);
+			script_patch_16(hostdata, hostdata->script,
 			                MessageCount, 1);
 			/* SendMsgOut returns, so set up the return
 			 * address */
@@ -817,9 +839,8 @@ process_extended_message(struct Scsi_Host *host,
 		printk(KERN_INFO "scsi%d: (%d:%d), Unsolicited WDTR after CMD, Rejecting\n",
 		       host->host_no, pun, lun);
 		hostdata->msgout[0] = A_REJECT_MSG;
-		dma_cache_sync(hostdata->dev, hostdata->msgout, 1, DMA_TO_DEVICE);
-		script_patch_16(hostdata->dev, hostdata->script, MessageCount,
-		                1);
+		dma_sync_to_dev(hostdata, hostdata->msgout, 1);
+		script_patch_16(hostdata, hostdata->script, MessageCount, 1);
 		resume_offset = hostdata->pScript + Ent_SendMessageWithATN;
 
 		break;
@@ -832,9 +853,8 @@ process_extended_message(struct Scsi_Host *host,
 		printk("\n");
 		/* just reject it */
 		hostdata->msgout[0] = A_REJECT_MSG;
-		dma_cache_sync(hostdata->dev, hostdata->msgout, 1, DMA_TO_DEVICE);
-		script_patch_16(hostdata->dev, hostdata->script, MessageCount,
-		                1);
+		dma_sync_to_dev(hostdata, hostdata->msgout, 1);
+		script_patch_16(hostdata, hostdata->script, MessageCount, 1);
 		/* SendMsgOut returns, so set up the return
 		 * address */
 		resume_offset = hostdata->pScript + Ent_SendMessageWithATN;
@@ -917,9 +937,8 @@ process_message(struct Scsi_Host *host,	struct NCR_700_Host_Parameters *hostdata
 		printk("\n");
 		/* just reject it */
 		hostdata->msgout[0] = A_REJECT_MSG;
-		dma_cache_sync(hostdata->dev, hostdata->msgout, 1, DMA_TO_DEVICE);
-		script_patch_16(hostdata->dev, hostdata->script, MessageCount,
-		                1);
+		dma_sync_to_dev(hostdata, hostdata->msgout, 1);
+		script_patch_16(hostdata, hostdata->script, MessageCount, 1);
 		/* SendMsgOut returns, so set up the return
 		 * address */
 		resume_offset = hostdata->pScript + Ent_SendMessageWithATN;
@@ -928,7 +947,7 @@ process_message(struct Scsi_Host *host,	struct NCR_700_Host_Parameters *hostdata
 	}
 	NCR_700_writel(temp, host, TEMP_REG);
 	/* set us up to receive another message */
-	dma_cache_sync(hostdata->dev, hostdata->msgin, MSG_ARRAY_SIZE, DMA_FROM_DEVICE);
+	dma_sync_from_dev(hostdata, hostdata->msgin, MSG_ARRAY_SIZE);
 	return resume_offset;
 }
 
@@ -1008,8 +1027,8 @@ process_script_interrupt(__u32 dsps, __u32 dsp, struct scsi_cmnd *SCp,
 				slot->SG[1].ins = bS_to_host(SCRIPT_RETURN);
 				slot->SG[1].pAddr = 0;
 				slot->resume_offset = hostdata->pScript;
-				dma_cache_sync(hostdata->dev, slot->SG, sizeof(slot->SG[0])*2, DMA_TO_DEVICE);
-				dma_cache_sync(hostdata->dev, SCp->sense_buffer, SCSI_SENSE_BUFFERSIZE, DMA_FROM_DEVICE);
+				dma_sync_to_dev(hostdata, slot->SG, sizeof(slot->SG[0])*2);
+				dma_sync_from_dev(hostdata, SCp->sense_buffer, SCSI_SENSE_BUFFERSIZE);
 
 				/* queue the command for reissue */
 				slot->state = NCR_700_SLOT_QUEUED;
@@ -1129,11 +1148,11 @@ process_script_interrupt(__u32 dsps, __u32 dsp, struct scsi_cmnd *SCp,
 			hostdata->cmd = slot->cmnd;
 
 			/* re-patch for this command */
-			script_patch_32_abs(hostdata->dev, hostdata->script,
+			script_patch_32_abs(hostdata, hostdata->script,
 			                    CommandAddress, slot->pCmd);
-			script_patch_16(hostdata->dev, hostdata->script,
+			script_patch_16(hostdata, hostdata->script,
 					CommandCount, slot->cmnd->cmd_len);
-			script_patch_32_abs(hostdata->dev, hostdata->script,
+			script_patch_32_abs(hostdata, hostdata->script,
 			                    SGScriptStartAddress,
 					    to32bit(&slot->pSG[0].ins));
 
@@ -1144,14 +1163,14 @@ process_script_interrupt(__u32 dsps, __u32 dsp, struct scsi_cmnd *SCp,
 			 * should therefore always clear ACK */
 			NCR_700_writeb(NCR_700_get_SXFER(hostdata->cmd->device),
 				       host, SXFER_REG);
-			dma_cache_sync(hostdata->dev, hostdata->msgin,
-				       MSG_ARRAY_SIZE, DMA_FROM_DEVICE);
-			dma_cache_sync(hostdata->dev, hostdata->msgout,
-				       MSG_ARRAY_SIZE, DMA_TO_DEVICE);
+			dma_sync_from_dev(hostdata, hostdata->msgin,
+				       MSG_ARRAY_SIZE);
+			dma_sync_to_dev(hostdata, hostdata->msgout,
+				       MSG_ARRAY_SIZE);
 			/* I'm just being paranoid here, the command should
 			 * already have been flushed from the cache */
-			dma_cache_sync(hostdata->dev, slot->cmnd->cmnd,
-				       slot->cmnd->cmd_len, DMA_TO_DEVICE);
+			dma_sync_to_dev(hostdata, slot->cmnd->cmnd,
+				       slot->cmnd->cmd_len);
 
 
 			
@@ -1214,8 +1233,7 @@ process_script_interrupt(__u32 dsps, __u32 dsp, struct scsi_cmnd *SCp,
 		hostdata->reselection_id = reselection_id;
 		/* just in case we have a stale simple tag message, clear it */
 		hostdata->msgin[1] = 0;
-		dma_cache_sync(hostdata->dev, hostdata->msgin,
-			       MSG_ARRAY_SIZE, DMA_BIDIRECTIONAL);
+		dma_sync_to_dev(hostdata, hostdata->msgin, MSG_ARRAY_SIZE);
 		if(hostdata->tag_negotiated & (1<<reselection_id)) {
 			resume_offset = hostdata->pScript + Ent_GetReselectionWithTag;
 		} else {
@@ -1329,8 +1347,7 @@ process_selection(struct Scsi_Host *host, __u32 dsp)
 	hostdata->cmd = NULL;
 	/* clear any stale simple tag message */
 	hostdata->msgin[1] = 0;
-	dma_cache_sync(hostdata->dev, hostdata->msgin, MSG_ARRAY_SIZE,
-		       DMA_BIDIRECTIONAL);
+	dma_sync_to_dev(hostdata, hostdata->msgin, MSG_ARRAY_SIZE);
 
 	if(id == 0xff) {
 		/* Selected as target, Ignore */
@@ -1427,30 +1444,26 @@ NCR_700_start_command(struct scsi_cmnd *SCp)
 		NCR_700_set_flag(SCp->device, NCR_700_DEV_BEGIN_SYNC_NEGOTIATION);
 	}
 
-	script_patch_16(hostdata->dev, hostdata->script, MessageCount, count);
-
+	script_patch_16(hostdata, hostdata->script, MessageCount, count);
 
-	script_patch_ID(hostdata->dev, hostdata->script,
-			Device_ID, 1<<scmd_id(SCp));
+	script_patch_ID(hostdata, hostdata->script, Device_ID, 1<<scmd_id(SCp));
 
-	script_patch_32_abs(hostdata->dev, hostdata->script, CommandAddress,
+	script_patch_32_abs(hostdata, hostdata->script, CommandAddress,
 			    slot->pCmd);
-	script_patch_16(hostdata->dev, hostdata->script, CommandCount,
-	                SCp->cmd_len);
+	script_patch_16(hostdata, hostdata->script, CommandCount, SCp->cmd_len);
 	/* finally plumb the beginning of the SG list into the script
 	 * */
-	script_patch_32_abs(hostdata->dev, hostdata->script,
+	script_patch_32_abs(hostdata, hostdata->script,
 	                    SGScriptStartAddress, to32bit(&slot->pSG[0].ins));
 	NCR_700_clear_fifo(SCp->device->host);
 
 	if(slot->resume_offset == 0)
 		slot->resume_offset = hostdata->pScript;
 	/* now perform all the writebacks and invalidates */
-	dma_cache_sync(hostdata->dev, hostdata->msgout, count, DMA_TO_DEVICE);
-	dma_cache_sync(hostdata->dev, hostdata->msgin, MSG_ARRAY_SIZE,
-		       DMA_FROM_DEVICE);
-	dma_cache_sync(hostdata->dev, SCp->cmnd, SCp->cmd_len, DMA_TO_DEVICE);
-	dma_cache_sync(hostdata->dev, hostdata->status, 1, DMA_FROM_DEVICE);
+	dma_sync_to_dev(hostdata, hostdata->msgout, count);
+	dma_sync_from_dev(hostdata, hostdata->msgin, MSG_ARRAY_SIZE);
+	dma_sync_to_dev(hostdata, SCp->cmnd, SCp->cmd_len);
+	dma_sync_from_dev(hostdata, hostdata->status, 1);
 
 	/* set the synchronous period/offset */
 	NCR_700_writeb(NCR_700_get_SXFER(SCp->device),
@@ -1626,7 +1639,7 @@ NCR_700_intr(int irq, void *dev_id)
 					slot->SG[i].ins = bS_to_host(SCRIPT_NOP);
 					slot->SG[i].pAddr = 0;
 				}
-				dma_cache_sync(hostdata->dev, slot->SG, sizeof(slot->SG), DMA_TO_DEVICE);
+				dma_sync_to_dev(hostdata, slot->SG, sizeof(slot->SG));
 				/* and pretend we disconnected after
 				 * the command phase */
 				resume_offset = hostdata->pScript + Ent_MsgInDuringData;
@@ -1878,7 +1891,7 @@ NCR_700_queuecommand_lck(struct scsi_cmnd *SCp, void (*done)(struct scsi_cmnd *)
 		}
 		slot->SG[i].ins = bS_to_host(SCRIPT_RETURN);
 		slot->SG[i].pAddr = 0;
-		dma_cache_sync(hostdata->dev, slot->SG, sizeof(slot->SG), DMA_TO_DEVICE);
+		dma_sync_to_dev(hostdata, slot->SG, sizeof(slot->SG));
 		DEBUG((" SETTING %p to %x\n",
 		       (&slot->pSG[i].ins),
 		       slot->SG[i].ins));
diff --git a/drivers/scsi/53c700.h b/drivers/scsi/53c700.h
index 05fe439b66afe5..c9f8c497babb3d 100644
--- a/drivers/scsi/53c700.h
+++ b/drivers/scsi/53c700.h
@@ -209,6 +209,7 @@ struct NCR_700_Host_Parameters {
 #endif
 	__u32	chip710:1;	/* set if really a 710 not 700 */
 	__u32	burst_length:4;	/* set to 0 to disable 710 bursting */
+	__u32	noncoherent:1;	/* needs to use non-coherent DMA */
 
 	/* NOTHING BELOW HERE NEEDS ALTERING */
 	__u32	fast:1;		/* if we can alter the SCSI bus clock
@@ -422,33 +423,33 @@ struct NCR_700_Host_Parameters {
 #define NCR_710_MIN_XFERP	0
 #define NCR_700_MIN_PERIOD	25 /* for SDTR message, 100ns */
 
-#define script_patch_32(dev, script, symbol, value) \
+#define script_patch_32(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		__u32 val = bS_to_cpu((script)[A_##symbol##_used[i]]) + da; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_cache_sync((dev), &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
-#define script_patch_32_abs(dev, script, symbol, value) \
+#define script_patch_32_abs(h, script, symbol, value) \
 { \
 	int i; \
 	dma_addr_t da = value; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
 		(script)[A_##symbol##_used[i]] = bS_to_host(da); \
-		dma_cache_sync((dev), &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching %s at %d to %pad\n", \
 		       #symbol, A_##symbol##_used[i], &da)); \
 	} \
 }
 
 /* Used for patching the SCSI ID in the SELECT instruction */
-#define script_patch_ID(dev, script, symbol, value) \
+#define script_patch_ID(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -456,13 +457,13 @@ struct NCR_700_Host_Parameters {
 		val &= 0xff00ffff; \
 		val |= ((value) & 0xff) << 16; \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_cache_sync((dev), &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching ID field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
 }
 
-#define script_patch_16(dev, script, symbol, value) \
+#define script_patch_16(h, script, symbol, value) \
 { \
 	int i; \
 	for(i=0; i< (sizeof(A_##symbol##_used) / sizeof(__u32)); i++) { \
@@ -470,7 +471,7 @@ struct NCR_700_Host_Parameters {
 		val &= 0xffff0000; \
 		val |= ((value) & 0xffff); \
 		(script)[A_##symbol##_used[i]] = bS_to_host(val); \
-		dma_cache_sync((dev), &(script)[A_##symbol##_used[i]], 4, DMA_TO_DEVICE); \
+		dma_sync_to_dev((h), &(script)[A_##symbol##_used[i]], 4); \
 		DEBUG((" script, patching short field %s at %d to 0x%x\n", \
 		       #symbol, A_##symbol##_used[i], val)); \
 	} \
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
