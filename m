Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B6F40B324
	for <lists.iommu@lfdr.de>; Tue, 14 Sep 2021 17:30:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 088F8400BF;
	Tue, 14 Sep 2021 15:30:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWH1pyUAcKT1; Tue, 14 Sep 2021 15:30:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E664D400DF;
	Tue, 14 Sep 2021 15:30:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B57F6C001E;
	Tue, 14 Sep 2021 15:30:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23EA0C000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 15:30:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 127C56061A
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 15:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1k9l4sfQmzRT for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 15:30:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F8E86059A
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 15:30:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 375B567373; Tue, 14 Sep 2021 17:30:47 +0200 (CEST)
Date: Tue, 14 Sep 2021 17:30:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] swiotlb: set IO TLB segment size via cmdline
Message-ID: <20210914153046.GB815@lst.de>
References: <20210914151016.3174924-1-Roman_Skakun@epam.com>
 <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c04db79-7de1-93ff-0908-9bad60a287b9@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Roman Skakun <rm.skakun@gmail.com>, linux-doc@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 xen-devel@lists.xenproject.org, "Paul E. McKenney" <paulmck@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Muchun Song <songmuchun@bytedance.com>, Thomas Gleixner <tglx@linutronix.de>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Andrii Anisov <andrii_anisov@epam.com>, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Roman Skakun <roman_skakun@epam.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Mike Rapoport <rppt@kernel.org>, "Maciej W. Rozycki" <macro@orcam.me.uk>
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

On Tue, Sep 14, 2021 at 05:29:07PM +0200, Jan Beulich wrote:
> I'm not convinced the swiotlb use describe there falls under "intended
> use" - mapping a 1280x720 framebuffer in a single chunk? (As an aside,
> the bottom of this page is also confusing, as following "Then we can
> confirm the modified swiotlb size in the boot log:" there is a log
> fragment showing the same original size of 64Mb.

It doesn't.  We also do not add hacks to the kernel for whacky out
of tree modules.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
