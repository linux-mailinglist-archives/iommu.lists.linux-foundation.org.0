Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95931594F
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 23:23:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 663EC6F4E9
	for <lists.iommu@lfdr.de>; Tue,  9 Feb 2021 22:23:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTnKzHGzVGId for <lists.iommu@lfdr.de>;
	Tue,  9 Feb 2021 22:23:01 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id AA4336F546; Tue,  9 Feb 2021 22:23:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27EA26F4AA;
	Tue,  9 Feb 2021 22:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF5A3C013A;
	Tue,  9 Feb 2021 22:22:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63A09C013A
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 22:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 510706E7E7
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 22:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 15Y4vgjGkh1x for <iommu@lists.linux-foundation.org>;
 Tue,  9 Feb 2021 22:22:55 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 5582C6F4AA; Tue,  9 Feb 2021 22:22:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FD186E7E7
 for <iommu@lists.linux-foundation.org>; Tue,  9 Feb 2021 22:22:52 +0000 (UTC)
Received: from DGGEMM401-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DZy5p3j1qz5KDt;
 Wed, 10 Feb 2021 06:21:02 +0800 (CST)
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 DGGEMM401-HUB.china.huawei.com (10.3.20.209) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 10 Feb 2021 06:22:48 +0800
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggpemm500011.china.huawei.com (7.185.36.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2106.2; Wed, 10 Feb 2021 06:22:47 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.006;
 Wed, 10 Feb 2021 06:22:47 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory pin
Thread-Topic: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory
 pin
Thread-Index: AQHW/SrsWWMRpilf2UC1Pz29QqsBVqpNZGQAgACtCgCAAKKukP//jqmAgADcIzCAADaMgIABCrxA
Date: Tue, 9 Feb 2021 22:22:47 +0000
Message-ID: <2527b4ac8df14fa1b427bef65dace719@hisilicon.com>
References: <1612685884-19514-1-git-send-email-wangzhou1@hisilicon.com>
 <1612685884-19514-2-git-send-email-wangzhou1@hisilicon.com>
 <a587bd61-9194-4b46-c122-8b4da7b941a8@redhat.com>
 <20210208183348.GV4718@ziepe.ca>
 <0dca000a6cd34d8183062466ba7d6eaf@hisilicon.com>
 <20210208213023.GZ4718@ziepe.ca>
 <0868d209d7424942a46d1238674cf75d@hisilicon.com>
 <20210209135331.GF4718@ziepe.ca>
In-Reply-To: <20210209135331.GF4718@ziepe.ca>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.202.77]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "chensihang \(A\)" <chensihang1@hisilicon.com>,
 David Hildenbrand <david@redhat.com>,
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
> Sent: Wednesday, February 10, 2021 2:54 AM
> To: Song Bao Hua (Barry Song) <song.bao.hua@hisilicon.com>
> Cc: David Hildenbrand <david@redhat.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; linux-kernel@vger.kernel.org;
> iommu@lists.linux-foundation.org; linux-mm@kvack.org;
> linux-arm-kernel@lists.infradead.org; linux-api@vger.kernel.org; Andrew
> Morton <akpm@linux-foundation.org>; Alexander Viro <viro@zeniv.linux.org.uk>;
> gregkh@linuxfoundation.org; kevin.tian@intel.com; jean-philippe@linaro.org;
> eric.auger@redhat.com; Liguozhu (Kenneth) <liguozhu@hisilicon.com>;
> zhangfei.gao@linaro.org; chensihang (A) <chensihang1@hisilicon.com>
> Subject: Re: [RFC PATCH v3 1/2] mempinfd: Add new syscall to provide memory
> pin
> 
> On Tue, Feb 09, 2021 at 03:01:42AM +0000, Song Bao Hua (Barry Song) wrote:
> 
> > On the other hand, wouldn't it be the benefit of hardware accelerators
> > to have a lower and more stable latency zip/encryption than CPU?
> 
> No, I don't think so.

Fortunately or unfortunately, I think my people have this target to have
a lower-latency and more stable zip/encryption by using accelerators,
otherwise, they are going to use CPU directly if there is no advantage
of accelerators.

> 
> If this is an important problem then it should apply equally to CPU
> and IO jitter.
> 
> Honestly I find the idea that occasional migration jitters CPU and DMA
> to not be very compelling. Such specialized applications should
> allocate special pages to avoid this, not adding an API to be able to
> lock down any page

That is exactly what we have done to provide a hugeTLB pool so that
applications can allocate memory from this pool.

+-------------------------------------------+
 |                                           |
 |applications using accelerators            |
 +-------------------------------------------+


     alloc from pool             free to pool
           +                      ++
           |                       |
           |                       |
           |                       |
           |                       |
           |                       |
           |                       |
           |                       |
+----------+-----------------------+---------+
|                                            |
|                                            |
|      HugeTLB memory pool                   |
|                                            |
|                                            |
+--------------------------------------------+

The problem is that SVA declares we can use any memory of a process
to do I/O. And in real scenarios, we are unable to customize most
applications to make them use the pool. So we are looking for some
extension generically for applications such as Nginx, Ceph.

I am also thinking about leveraging vm.compact_unevictable_allowed
which David suggested and making an extension on it, for example,
permit users to disable compaction and numa balancing on unevictable
pages of SVA process,  which might be a smaller deal.

> 
> Jason

Thanks
Barry

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
