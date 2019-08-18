Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EE48F91442
	for <lists.iommu@lfdr.de>; Sun, 18 Aug 2019 05:13:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C0590C6D;
	Sun, 18 Aug 2019 03:13:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8BDFFC5C
	for <iommu@lists.linux-foundation.org>;
	Sun, 18 Aug 2019 03:13:46 +0000 (UTC)
X-Greylist: delayed 23:34:15 by SQLgrey-1.7.6
Received: from r3-21.sinamail.sina.com.cn (r3-21.sinamail.sina.com.cn
	[202.108.3.21])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 190A3E5
	for <iommu@lists.linux-foundation.org>;
	Sun, 18 Aug 2019 03:13:44 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([222.131.78.247])
	by sina.com with ESMTP
	id 5D58C2630003416E; Sun, 18 Aug 2019 11:13:42 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 679581463007
From: Hillf Danton <hdanton@sina.com>
To: Tobias Klausmann <tobias.johannes.klausmann@mni.thm.de>
Subject: Re: regression in ath10k dma allocation
Date: Sun, 18 Aug 2019 11:13:28 +0800
Message-Id: <20190818031328.11848-1-hdanton@sina.com>
In-Reply-To: <20190816222506.GA24413@Asurada-Nvidia.nvidia.com>
References: <8fe8b415-2d34-0a14-170b-dcb31c162e67@mni.thm.de>
	<20190816164301.GA3629@lst.de>
	<af96ea6a-2b17-9b66-7aba-b7dae5bcbba5@mni.thm.de>
	<20190816222506.GA24413@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
	davem@davemloft.net, Nicolin Chen <nicoleotsuka@gmail.com>,
	iommu@lists.linux-foundation.org, tobias.klausmann@freenet.de,
	robin.murphy@arm.com, Christoph Hellwig <hch@lst.de>, kvalo@codeaurora.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org


On Sat, 17 Aug 2019 00:42:48 +0200 Tobias Klausmann wrote:
>Hi Nicolin,
>
>On 17.08.19 00:25, Nicolin Chen wrote:
>> Hi Tobias
>>
>> On Fri, Aug 16, 2019 at 10:16:45PM +0200, Tobias Klausmann wrote:
>>>> do you have CONFIG_DMA_CMA set in your config?  If not please make sure
>>>> you have this commit in your testing tree, and if the problem still
>>>> persists it would be a little odd and we'd have to dig deeper:
>>>>
>>>> commit dd3dcede9fa0a0b661ac1f24843f4a1b1317fdb6
>>>> Author: Nicolin Chen <nicoleotsuka@gmail.com>
>>>> Date:   Wed May 29 17:54:25 2019 -0700
>>>>
>>>>       dma-contiguous: fix !CONFIG_DMA_CMA version of dma_{alloc, free}_contiguous()
>>> yes CONFIG_DMA_CMA is set (=y, see attached config), the commit you mention
>>> above is included, if you have any hints how to go forward, please let me
>>> know!
>> For CONFIG_DMA_CMA=y, by judging the log with error code -12, I
>> feel this one should work for you. Would you please check if it
>> is included or try it out otherwise?
>>
>> dma-contiguous: do not overwrite align in dma_alloc_contiguous()
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c6622a425acd1d2f3a443cd39b490a8777b622d7
>
>
>Thanks for the hint, yet the commit is included and does not fix the 
>problem!
>
Hi Tobias

Two minor diffs below in hope that they might make sense.

1, fallback unless dma coherent ok.

--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -246,6 +246,10 @@ struct page *dma_alloc_contiguous(struct
 		size_t cma_align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
 
 		page = cma_alloc(cma, count, cma_align, gfp & __GFP_NOWARN);
+		if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
+			dma_free_contiguous(dev, page, size);
+			page = NULL;
+		}
 	}
 
 	/* Fallback allocation of normal pages */
--

2, cleanup: cma unless contiguous

--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -234,18 +234,13 @@ struct page *dma_alloc_contiguous(struct
 	size_t count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	size_t align = get_order(PAGE_ALIGN(size));
 	struct page *page = NULL;
-	struct cma *cma = NULL;
-
-	if (dev && dev->cma_area)
-		cma = dev->cma_area;
-	else if (count > 1)
-		cma = dma_contiguous_default_area;
 
 	/* CMA can be used only in the context which permits sleeping */
-	if (cma && gfpflags_allow_blocking(gfp)) {
+	if (count > 1 && gfpflags_allow_blocking(gfp)) {
 		size_t cma_align = min_t(size_t, align, CONFIG_CMA_ALIGNMENT);
 
-		page = cma_alloc(cma, count, cma_align, gfp & __GFP_NOWARN);
+		page = cma_alloc(dev_get_cma_area(dev), count, cma_align,
+							gfp & __GFP_NOWARN);
 		if (page && !dma_coherent_ok(dev, page_to_phys(page), size)) {
 			dma_free_contiguous(dev, page, size);
 			page = NULL;
--

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
