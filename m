Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE3F3128C1
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 02:31:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68CD486B58;
	Mon,  8 Feb 2021 01:31:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0wXl5xPofOZ; Mon,  8 Feb 2021 01:31:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D376A85FFD;
	Mon,  8 Feb 2021 01:31:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE55BC013A;
	Mon,  8 Feb 2021 01:31:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F1B0C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 01:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7EDD085B55
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 01:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6etBBQFf-9i2 for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 01:31:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED97D857BB
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 01:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=lD7QVBDoo2n3B5TjjWe/LazElHNVpG8lB7yZkwrFfwc=; b=MaJMVf613EdZuXmqlYeAtKUuHj
 Y1do0olDL4LMFLRLVerYvQCug2SqeQLzlJ8NzAPMCYrVBJXRHGDVz1tBDYWcSrGha+Tpu2Id7Mtmm
 tAb30QyZmu9ZhJbiEFOIz6GuKN9xCRRdCA7HEDU1qVgg6i70eTyQ6rIDgtWwoHGBH+uoN6zydBL34
 Iab+t9xLe8qt8LfgKIYJfpN3O3pxnioA+yvAVnarVxjSkWY8vd+QbOn/hiVTlV8NwZ9qDHhFP/Jwe
 TUnXf6m8p5iH6eMf9YUnyVUZOfuEb/040qR0nuT1cb7GOibjLaWDBaVjiK0x5J/FvBH86/Fg3M9pP
 yn9SsJ6Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l8vOC-005L6R-9O; Mon, 08 Feb 2021 01:30:56 +0000
Date: Mon, 8 Feb 2021 01:30:56 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory pin
Message-ID: <20210208013056.GM308988@casper.infradead.org>
References: <1612685884-19514-1-git-send-email-wangzhou1@hisilicon.com>
 <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
 <20210207213409.GL308988@casper.infradead.org>
 <f4b2d7db8a1047d9952cbbfaf9e27824@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f4b2d7db8a1047d9952cbbfaf9e27824@hisilicon.com>
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chensihang \(A\)" <chensihang1@hisilicon.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Sun, Feb 07, 2021 at 10:24:28PM +0000, Song Bao Hua (Barry Song) wrote:
> > > In high-performance I/O cases, accelerators might want to perform
> > > I/O on a memory without IO page faults which can result in dramatically
> > > increased latency. Current memory related APIs could not achieve this
> > > requirement, e.g. mlock can only avoid memory to swap to backup device,
> > > page migration can still trigger IO page fault.
> > 
> > Well ... we have two requirements.  The application wants to not take
> > page faults.  The system wants to move the application to a different
> > NUMA node in order to optimise overall performance.  Why should the
> > application's desires take precedence over the kernel's desires?  And why
> > should it be done this way rather than by the sysadmin using numactl to
> > lock the application to a particular node?
> 
> NUMA balancer is just one of many reasons for page migration. Even one
> simple alloc_pages() can cause memory migration in just single NUMA
> node or UMA system.
> 
> The other reasons for page migration include but are not limited to:
> * memory move due to CMA
> * memory move due to huge pages creation
> 
> Hardly we can ask users to disable the COMPACTION, CMA and Huge Page
> in the whole system.

You're dodging the question.  Should the CMA allocation fail because
another application is using SVA?

I would say no.  The application using SVA should take the one-time
performance hit from having its memory moved around.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
