Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEC73DA8A2
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 18:13:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8437F4037F;
	Thu, 29 Jul 2021 16:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2QDkY-MkhwS; Thu, 29 Jul 2021 16:13:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 68DC1400AE;
	Thu, 29 Jul 2021 16:13:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DCB2C000E;
	Thu, 29 Jul 2021 16:13:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7EFE8C000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 16:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 568D140266
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 16:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mws51i5SAQ9b for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 16:13:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80E19400AE
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 16:13:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D568604DB;
 Thu, 29 Jul 2021 16:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627575221;
 bh=KVD7TN9dcK4ktTL6Ey8DL93tJliPrHY8gZ++t0vHUF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ygvx/+gIy1i+Qtm92gnOF4QTD+7jJzpbn1XjGqrGvEi5uSALRy7a0oJb+WDy0IzOs
 2ckLUQ18NWZfDBdV0SyEvckHE6bmqug/HgfXN98nd/Smce58NrUEFZSsH24xuSO9Mv
 v4KKei+Juvh2Qxnwz83+iFgJjfb0mnTOwfDzYnzj9D5r5wYpCUyFFpO7rx0/TFIbCy
 8IZJa/zybafLy1fx3RK0V6m9nJz/QWH4+gEAqG1LFKWpq930/SvhmIRIabwmZssaMs
 FAP8KrRGI/Ofj64yoY0uhHM4VPlYH5b5iQg6z67oQytfIIoIF+56XzN9P4KTMKUffY
 Z5ifueWR9CpdA==
Date: Thu, 29 Jul 2021 17:13:36 +0100
From: Will Deacon <will@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [powerpc][next-20210727] Boot failure - kernel BUG at
 arch/powerpc/kernel/interrupt.c:98!
Message-ID: <20210729161335.GA22016@willie-the-truck>
References: <1905CD70-7656-42AE-99E2-A31FC3812EAC@linux.vnet.ibm.com>
 <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQGVZnMe9hFieF8D@Ryzen-9-3900X.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org,
 linux-next@vger.kernel.org, Claire Chang <tientzu@chromium.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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

On Wed, Jul 28, 2021 at 10:35:34AM -0700, Nathan Chancellor wrote:
> On Wed, Jul 28, 2021 at 01:31:06PM +0530, Sachin Sant wrote:
> > next-20210723 was good. The boot failure seems to have been introduced with next-20210726.
> > 
> > I have attached the boot log.
> 
> I noticed this with OpenSUSE's ppc64le config [1] and my bisect landed on
> commit ad6c00283163 ("swiotlb: Free tbl memory in swiotlb_exit()"). That
> series just keeps on giving...

Yes, but look how handy our new print is!

[    0.010799] software IO TLB: tearing down default memory pool
[    0.010805] ------------[ cut here ]------------
[    0.010808] kernel BUG at arch/powerpc/kernel/interrupt.c:98!

Following Nick's suggestion, the diff below should help? I don't have a
relevant box on which I can test it though.

Will

--->8

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 1d829e257996..87f001b4c4e4 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -63,6 +63,9 @@ void __init svm_swiotlb_init(void)
 
 int set_memory_encrypted(unsigned long addr, int numpages)
 {
+       if (!mem_encrypt_active())
+               return 0;
+
        if (!PAGE_ALIGNED(addr))
                return -EINVAL;
 
@@ -73,6 +76,9 @@ int set_memory_encrypted(unsigned long addr, int numpages)
 
 int set_memory_decrypted(unsigned long addr, int numpages)
 {
+       if (!mem_encrypt_active())
+               return 0;
+
        if (!PAGE_ALIGNED(addr))
                return -EINVAL;
 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
