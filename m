Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 11010314091
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 21:35:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B184287163;
	Mon,  8 Feb 2021 20:35:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Up-HluOwneha; Mon,  8 Feb 2021 20:35:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B586D87116;
	Mon,  8 Feb 2021 20:35:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A174C1DA9;
	Mon,  8 Feb 2021 20:35:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5933C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 20:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B1F7B221C6
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 20:35:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RkqxkWHbCaRY for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 20:35:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by silver.osuosl.org (Postfix) with ESMTPS id 132792155D
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 20:35:35 +0000 (UTC)
Received: from DGGEMM404-HUB.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DZHmx3ft1z5NXL;
 Tue,  9 Feb 2021 04:34:09 +0800 (CST)
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 DGGEMM404-HUB.china.huawei.com (10.3.20.212) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Tue, 9 Feb 2021 04:35:32 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggpemm500011.china.huawei.com (7.185.36.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Tue, 9 Feb 2021 04:35:32 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Tue, 9 Feb 2021 04:35:32 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, David Hildenbrand <david@redhat.com>
Subject: RE: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory pin
Thread-Topic: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory
 pin
Thread-Index: AQHW/SrsWWMRpilf2UC1Pz29QqsBVqpNZGQAgACtCgCAAKKukA==
Date: Mon, 8 Feb 2021 20:35:31 +0000
Message-ID: <0dca000a6cd34d8183062466ba7d6eaf@hisilicon.com>
References: <1612685884-19514-1-git-send-email-wangzhou1@hisilicon.com>
 <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
 <a587bd61-9194-4b46-c122-8b4da7b941a8@redhat.com>
 <20210208183348.GV4718@ziepe.ca>
In-Reply-To: <20210208183348.GV4718@ziepe.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.200.92]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chensihang \(A\)" <chensihang1@hisilicon.com>,
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



> -----Original Message-----
> From: Jason Gunthorpe [mailto:jgg@ziepe.ca]
> Sent: Tuesday, February 9, 2021 7:34 AM
> To: David Hildenbrand <david@redhat.com>
> Cc: Wangzhou (B) <wangzhou1@hisilicon.com>; linux-kernel@vger.kernel.org;
> iommu@lists.linux-foundation.org; linux-mm@kvack.org;
> linux-arm-kernel@lists.infradead.org; linux-api@vger.kernel.org; Andrew
> Morton <akpm@linux-foundation.org>; Alexander Viro <viro@zeniv.linux.org.uk>;
> gregkh@linuxfoundation.org; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>; kevin.tian@intel.com;
> jean-philippe@linaro.org; eric.auger@redhat.com; Liguozhu (Kenneth)
> <liguozhu@hisilicon.com>; zhangfei.gao@linaro.org; chensihang (A)
> <chensihang1@hisilicon.com>
> Subject: Re: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory
> pin
> 
> On Mon, Feb 08, 2021 at 09:14:28AM +0100, David Hildenbrand wrote:
> 
> > People are constantly struggling with the effects of long term pinnings
> > under user space control, like we already have with vfio and RDMA.
> >
> > And here we are, adding yet another, easier way to mess with core MM in the
> > same way. This feels like a step backwards to me.
> 
> Yes, this seems like a very poor candidate to be a system call in this
> format. Much too narrow, poorly specified, and possibly security
> implications to allow any process whatsoever to pin memory.
> 
> I keep encouraging people to explore a standard shared SVA interface
> that can cover all these topics (and no, uaccel is not that
> interface), that seems much more natural.
> 
> I still haven't seen an explanation why DMA is so special here,
> migration and so forth jitter the CPU too, environments that care
> about jitter have to turn this stuff off.

This paper has a good explanation:
https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=7482091

mainly because page fault can go directly to the CPU and we have
many CPUs. But IO Page Faults go a different way, thus mean much
higher latency 3-80x slower than page fault:
events in hardware queue -> Interrupts -> cpu processing page fault
-> return events to iommu/device -> continue I/O.

Copied from the paper:

If the IOMMU's page table walker fails to find the desired
translation in the page table, it sends an ATS response to
the GPU notifying it of this failure. This in turn corresponds
to a page fault. In response, the GPU sends another request to
the IOMMU called a Peripheral Page Request (PPR). The IOMMU
places this request in a memory-mapped queue and raises an
interrupt on the CPU. Multiple PPR requests can be queued
before the CPU is interrupted. The OS must have a suitable
IOMMU driver to process this interrupt and the queued PPR
requests. In Linux, while in an interrupt context, the driver
pulls PPR requests from the queue and places them in a work-queue
for later processing. Presumably this design decision was made
to minimize the time spent executing in an interrupt context,
where lower priority interrupts would be dis-abled. At a later
time, an OS worker-thread calls back into the driver to process
page fault requests in the work-queue. Once the requests are
serviced, the driver notifies the IOMMU. In turn, the IOMMU
notifies the GPU. The GPU then sends an-other ATS request to
retry the translation for the original fault-ing address.

Comparison with CPU: On the CPU, a hardware excep-tion is
raised on a page fault, which immediately switches to the
OS. In most cases in Linux, this routine services the page
fault directly, instead of queuing it for later processing.
Con-trast this with a page fault from an accelerator, where
the IOMMU has to interrupt the CPU to request service on
its be-half, and also note the several back-and-forth messages
be-tween the accelerator, the IOMMU, and the CPU. Further-more,
page faults on the CPU are generally handled one at a time
on the CPU, while for the GPU they are batched by the IOMMU
and OS work-queue mechanism.

> 
> Jason

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
