Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 511802C757
	for <lists.iommu@lfdr.de>; Tue, 28 May 2019 15:06:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C1D8E1CD7;
	Tue, 28 May 2019 13:06:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 075101CD0
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 13:06:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8829113A
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 13:06:06 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 9196F290A5DB12249000;
	Tue, 28 May 2019 21:06:03 +0800 (CST)
Received: from [127.0.0.1] (10.177.23.164) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Tue, 28 May 2019
	21:05:52 +0800
Subject: Re: [PATCH v7 1/1] iommu: enhance IOMMU dma mode build options
To: Joerg Roedel <joro@8bytes.org>
References: <20190520135947.14960-1-thunder.leizhen@huawei.com>
	<20190520135947.14960-2-thunder.leizhen@huawei.com>
	<20190527142140.GH8420@8bytes.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <5CED322E.20102@huawei.com>
Date: Tue, 28 May 2019 21:05:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20190527142140.GH8420@8bytes.org>
X-Originating-IP: [10.177.23.164]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-ia64 <linux-ia64@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	linux-doc <linux-doc@vger.kernel.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Paul Mackerras <paulus@samba.org>, "H . Peter Anvin" <hpa@zytor.com>,
	linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, x86 <x86@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Fenghua Yu <fenghua.yu@intel.com>,
	Will Deacon <will.deacon@arm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>, Gerald
	Schaefer <gerald.schaefer@de.ibm.com>, Tony Luck <tony.luck@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	iommu <iommu@lists.linux-foundation.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>
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



On 2019/5/27 22:21, Joerg Roedel wrote:
> Hi Zhen Lei,
> 
> On Mon, May 20, 2019 at 09:59:47PM +0800, Zhen Lei wrote:
>>  arch/ia64/kernel/pci-dma.c                |  2 +-
>>  arch/powerpc/platforms/powernv/pci-ioda.c |  3 ++-
>>  arch/s390/pci/pci_dma.c                   |  2 +-
>>  arch/x86/kernel/pci-dma.c                 |  7 ++---
>>  drivers/iommu/Kconfig                     | 44 ++++++++++++++++++++++++++-----
>>  drivers/iommu/amd_iommu_init.c            |  3 ++-
>>  drivers/iommu/intel-iommu.c               |  2 +-
>>  drivers/iommu/iommu.c                     |  3 ++-
>>  8 files changed, 48 insertions(+), 18 deletions(-)
> 
> This needs Acks from the arch maintainers of ia64, powerpc, s390 and
> x86, at least.
> 
> It is easier for them if you split it up into the Kconfig change and
> separete patches per arch and per iommu driver. Then collect the Acks on
> the individual patches.

OK, thanks. I will do it tomorrow.

> 
> Thanks,
> 
> 	Joerg
> 
> .
> 

-- 
Thanks!
BestRegards

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
