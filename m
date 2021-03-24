Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 745223472B6
	for <lists.iommu@lfdr.de>; Wed, 24 Mar 2021 08:33:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E9A7A40E52;
	Wed, 24 Mar 2021 07:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cReDxrDO-DeV; Wed, 24 Mar 2021 07:33:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7B340E4F;
	Wed, 24 Mar 2021 07:33:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B144C0012;
	Wed, 24 Mar 2021 07:33:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 789E3C000A
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 07:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5587E40E50
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 07:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnJ7vicfXmmh for <iommu@lists.linux-foundation.org>;
 Wed, 24 Mar 2021 07:33:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1630A40E4F
 for <iommu@lists.linux-foundation.org>; Wed, 24 Mar 2021 07:33:30 +0000 (UTC)
Received: from dggeme759-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4F50Jr2qCHz5gP7;
 Wed, 24 Mar 2021 15:30:52 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 24 Mar 2021 15:33:23 +0800
Received: from dggemi761-chm.china.huawei.com ([10.9.49.202]) by
 dggemi761-chm.china.huawei.com ([10.9.49.202]) with mapi id 15.01.2106.013;
 Wed, 24 Mar 2021 15:33:23 +0800
From: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
To: Christoph Hellwig <hch@lst.de>, "tiantao (H)" <tiantao6@hisilicon.com>
Subject: RE: [PATCH] dma-mapping: make map_benchmark compile into module
Thread-Topic: [PATCH] dma-mapping: make map_benchmark compile into module
Thread-Index: AQHXIFPOFGbiIAxEO0+6jc+KbhZliqqSM4CAgACIJUA=
Date: Wed, 24 Mar 2021 07:33:23 +0000
Message-ID: <6153f9d247214d58b5eb7a76cb1258b3@hisilicon.com>
References: <1616552258-22282-1-git-send-email-tiantao6@hisilicon.com>
 <20210324071305.GB647@lst.de>
In-Reply-To: <20210324071305.GB647@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.126.201.12]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Cc: "paulmck@kernel.org" <paulmck@kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "ast@kernel.org" <ast@kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>
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
> From: Christoph Hellwig [mailto:hch@lst.de]
> Sent: Wednesday, March 24, 2021 8:13 PM
> To: tiantao (H) <tiantao6@hisilicon.com>
> Cc: akpm@linux-foundation.org; peterz@infradead.org; paulmck@kernel.org;
> ast@kernel.org; tglx@linutronix.de; rostedt@goodmis.org; hch@lst.de;
> m.szyprowski@samsung.com; Song Bao Hua (Barry Song)
> <song.bao.hua@hisilicon.com>; iommu@lists.linux-foundation.org;
> linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] dma-mapping: make map_benchmark compile into module
> 
> On Wed, Mar 24, 2021 at 10:17:38AM +0800, Tian Tao wrote:
> > under some scenarios, it is necessary to compile map_benchmark
> > into module to test iommu, so this patch changed Kconfig and
> > export_symbol to implement map_benchmark compiled into module.
> >
> > On the other hand, map_benchmark is a driver, which is supposed
> > to be able to run as a module.
> >
> > Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> 
> Nope, we're not going to export more kthread internals for a test
> module.

The requirement comes from an colleague who is frequently changing
the map-bench code for some customized test purpose. and he doesn't
want to build kernel image and reboot every time. So I moved the
requirement to Tao Tian.

Right now, kthread_bind() is exported, kthread_bind_mask() seems
to be a little bit "internal" as you said, maybe a wrapper like
kthread_bind_node() won't be that "internal", comparing to exposing
the cpumask?
Anyway, we don't find other driver users for this, hardly I can
convince you it is worth.

Thanks
Barry
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
