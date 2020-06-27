Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C055D20C11E
	for <lists.iommu@lfdr.de>; Sat, 27 Jun 2020 13:53:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 42BDE8808E;
	Sat, 27 Jun 2020 11:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZyEpT8e9HYR; Sat, 27 Jun 2020 11:53:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B35048814E;
	Sat, 27 Jun 2020 11:53:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9845DC016F;
	Sat, 27 Jun 2020 11:53:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94BC7C016F
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 11:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 505DF2048D
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 11:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4p4ubKT3UN5 for <iommu@lists.linux-foundation.org>;
 Sat, 27 Jun 2020 11:53:09 +0000 (UTC)
X-Greylist: delayed 00:07:51 by SQLgrey-1.7.6
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by silver.osuosl.org (Postfix) with ESMTPS id BBF172047F
 for <iommu@lists.linux-foundation.org>; Sat, 27 Jun 2020 11:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D88E9626F1CF;
 Sat, 27 Jun 2020 13:45:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nyKl7qGuVRZM; Sat, 27 Jun 2020 13:45:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 5BD9C626F1B7;
 Sat, 27 Jun 2020 13:45:16 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ZTYWiHUKOkTX; Sat, 27 Jun 2020 13:45:16 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 32B0D626F1AB;
 Sat, 27 Jun 2020 13:45:16 +0200 (CEST)
Date: Sat, 27 Jun 2020 13:45:16 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: iommu@lists.linux-foundation.org
Message-ID: <1669515915.65540.1593258316061.JavaMail.zimbra@nod.at>
Subject: Passing NULL dev to dma_alloc_coherent() allowed or not?
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Index: 13sQTWOYZsCUQyAkPRAVyk7WekFvGA==
Thread-Topic: Passing NULL dev to dma_alloc_coherent() allowed or not?
Cc: linux-kernel@vger.kernel.org, sumit.semwal@linaro.org, robin.murphy@arm.com,
 hch@lst.de, dan.carpenter@oracle.com
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

Hi!

While porting on an old out-of-tree driver I noticed that dma_alloc_coherent()
was used with dev being NULL.

commit 148a97d5a02a62f81b5d6176f871c94a65e1f3af
Author: Dan Carpenter <dan.carpenter@oracle.com>
Date:   Wed Apr 24 17:24:37 2019 +0300

    dma-mapping: remove an unnecessary NULL check
    
    We already dereferenced "dev" when we called get_dma_ops() so this NULL
    check is too late.  We're not supposed to pass NULL "dev" pointers to
    dma_alloc_attrs().
    
    Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
    Signed-off-by: Christoph Hellwig <hch@lst.de>

says that dma_alloc_attrs() with dev being NULL is not allowed, but in
include/linux/dma-mapping.h we have:

static inline void *dma_alloc_coherent(struct device *dev, size_t size,
                dma_addr_t *dma_handle, gfp_t gfp)
{

        return dma_alloc_attrs(dev, size, dma_handle, gfp,
                        (gfp & __GFP_NOWARN) ? DMA_ATTR_NO_WARN : 0);
}

In Linus' tree I see at least three callers of dma_alloc_coherent() with a NULL device.
drivers/staging/emxx_udc/emxx_udc.c:2596:                       ep->virt_buf = dma_alloc_coherent(NULL, PAGE_SIZE,
drivers/tty/synclink.c:3667:            info->buffer_list = dma_alloc_coherent(NULL, BUFFERLISTSIZE, &info->buffer_list_dma_addr, GFP_KERNEL);
drivers/tty/synclink.c:3777:                    BufferList[i].virt_addr = dma_alloc_coherent(NULL, DMABUFFERSIZE, &BufferList[i].dma_addr, GFP_KERNEL);

I think these callers are wrong.
Can you please clarify?

Thanks,
//richard
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
