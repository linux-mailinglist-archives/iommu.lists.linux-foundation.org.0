Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CC33D253E
	for <lists.iommu@lfdr.de>; Thu, 22 Jul 2021 16:11:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7BCF4048C;
	Thu, 22 Jul 2021 14:11:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJxL-fknybd2; Thu, 22 Jul 2021 14:11:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 144844044C;
	Thu, 22 Jul 2021 14:11:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D91A1C001F;
	Thu, 22 Jul 2021 14:11:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7983C000E
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 14:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3FD1402B5
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 14:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXAV78OFsDRf for <iommu@lists.linux-foundation.org>;
 Thu, 22 Jul 2021 14:11:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D474D4044C
 for <iommu@lists.linux-foundation.org>; Thu, 22 Jul 2021 14:11:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DE25922674;
 Thu, 22 Jul 2021 14:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1626963058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=znqZXEBvAg7dEbM5a2gQPS3YjNE0Yq928OYkD/5qLAI=;
 b=AZV3erzgxGYb6H+cbwB2i3k4ARqpI4fnEI/VqXsoGEdXqlEn3d7a3CXeJ7rd9yjpMP4j8S
 cgatLfrtzOrSESMbl05PfuIciKEyDPg1Z7EIFjTnwCGdEcybeT3Ol/OBHce0iDUEnNymg2
 bbuZ9x1ORBRKhWbdB2VxMcvuRNzWA+M=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A8FAF13DCE;
 Thu, 22 Jul 2021 14:10:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UawqJ3J8+WC9VAAAMHmgww
 (envelope-from <ailiop@suse.com>); Thu, 22 Jul 2021 14:10:58 +0000
Date: Thu, 22 Jul 2021 16:10:55 +0200
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] dma-debug: fix debugfs initialization order
Message-ID: <YPl8b7KuoNBg52LE@technoir>
References: <20210722091818.13434-1-ailiop@suse.com>
 <1ea36b32-9bbc-a611-402d-9fa196eda166@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ea36b32-9bbc-a611-402d-9fa196eda166@arm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>
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
From: Anthony Iliopoulos via iommu <iommu@lists.linux-foundation.org>
Reply-To: Anthony Iliopoulos <ailiop@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Jul 22, 2021 at 11:10:24AM +0100, Robin Murphy wrote:
> On 2021-07-22 10:18, Anthony Iliopoulos wrote:
> > Due to link order, dma_debug_init is called before debugfs has a chance
> > to initialize (via debugfs_init which also happens in the core initcall
> > stage), so the directories for dma-debug are never created.
> > 
> > Move the dma_debug_init initcall from core to postcore stage so that
> > debugfs will already be initialized by the time this is called, making
> > it oblivious to link-ordering.
> 
> Playing initcall chicken here doesn't work so well - the later you
> initialise dma-debug itself, the more chance it has to miss early mappings
> and raise false positives later. As discussed previously[1] the better
> solution would be to decouple the debugfs setup so that just that part can
> be deferred until core_initcall_sync or later.

Thanks for pointing it out, makes sense. What about the following:

From: Anthony Iliopoulos <ailiop@suse.com>

Due to link order, dma_debug_init is called before debugfs has a chance
to initialize (via debugfs_init which also happens in the core initcall
stage), so the directories for dma-debug are never created.

Decouple dma_debug_fs_init from dma_debug_init and defer its init until
core_initcall_sync (after debugfs has been initialized) while letting
dma-debug initialization occur as soon as possible to catch any early
mappings, as suggested in [1].

[1] https://lore.kernel.org/linux-iommu/YIgGa6yF%2Fadg8OSN@kroah.com/

Fixes: 15b28bbcd567 ("dma-debug: move initialization to common code")
Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 kernel/dma/debug.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 14de1271463f..445754529917 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -794,7 +794,7 @@ static int dump_show(struct seq_file *seq, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(dump);

-static void dma_debug_fs_init(void)
+static int __init dma_debug_fs_init(void)
 {
 	struct dentry *dentry = debugfs_create_dir("dma-api", NULL);

@@ -807,7 +807,10 @@ static void dma_debug_fs_init(void)
 	debugfs_create_u32("nr_total_entries", 0444, dentry, &nr_total_entries);
 	debugfs_create_file("driver_filter", 0644, dentry, NULL, &filter_fops);
 	debugfs_create_file("dump", 0444, dentry, NULL, &dump_fops);
+
+	return 0;
 }
+core_initcall_sync(dma_debug_fs_init);

 static int device_dma_allocations(struct device *dev, struct dma_debug_entry **out_entry)
 {
@@ -892,8 +895,6 @@ static int dma_debug_init(void)
 		spin_lock_init(&dma_entry_hash[i].lock);
 	}

-	dma_debug_fs_init();
-
 	nr_pages = DIV_ROUND_UP(nr_prealloc_entries, DMA_DEBUG_DYNAMIC_ENTRIES);
 	for (i = 0; i < nr_pages; ++i)
 		dma_debug_create_entries(GFP_KERNEL);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
