Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE4330D206
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 04:15:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52A9F85C54;
	Wed,  3 Feb 2021 03:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SX_iofS8FfYR; Wed,  3 Feb 2021 03:15:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9EA1185BD0;
	Wed,  3 Feb 2021 03:15:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8105AC013A;
	Wed,  3 Feb 2021 03:15:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E645C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 03:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 543868709D
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 03:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmIGgOZSztUF for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 03:15:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BB4D28701C
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 03:15:34 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVmxD46Gsz163RX;
 Wed,  3 Feb 2021 11:14:08 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.87) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Wed, 3 Feb 2021
 11:15:18 +0800
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add debug interfaces for SMMUv3
To: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>
References: <1611911184-116261-1-git-send-email-wangzhou1@hisilicon.com>
From: Zhou Wang <wangzhou1@hisilicon.com>
Message-ID: <5001d8b3-ed2c-f3e3-80c5-d0b6b5df634c@hisilicon.com>
Date: Wed, 3 Feb 2021 11:15:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1611911184-116261-1-git-send-email-wangzhou1@hisilicon.com>
X-Originating-IP: [10.40.188.87]
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 2021/1/29 17:06, Zhou Wang wrote:
> This RFC series is the followed patch of this discussion:
> https://www.spinics.net/lists/arm-kernel/msg866187.html. 
> 
> Currently there is no debug interface about SMMUv3 driver, which makes it
> not convenient when we want to dump some information, like the value of
> CD/STE, S1/S2 page table, SMMU registers or cmd/event/pri queues.
> 
> This series tries to add support of dumping CD/STE and page table. The
> interface design is that user sets device/pasid firstly by sysfs files
> and then read related sysfs file to get information:
> 
>  (currently only support PCI device)
>  echo <domain>:<bus>:<dev>.<fun> > /sys/kernel/debug/iommu/smmuv3/pci_dev
>  echo <pasid> > /sys/kernel/debug/iommu/smmuv3/pasid
>  
>  Then value in CD and STE can be got by:
>  cat /sys/kernel/debug/iommu/smmuv3/ste
>  cat /sys/kernel/debug/iommu/smmuv3/cd
>  
>  S1 and S2 page tables can be got by:
>  cat /sys/kernel/debug/iommu/smmuv3/pt_dump_s1
>  cat /sys/kernel/debug/iommu/smmuv3/pt_dump_s2
> 
> For STE, CD and page table, related device and pasid are set in pci_dev
> and pasid files as above.
> 
> First and second patch export some help functions or macros in arm-smmu-v3
> and io-pgtable-arm codes, so we can reuse them in debugfs.c. As a RFC, this
> series does not go further to dump SMMU registers and cmd/event/pri queues.
> I am not sure this series is in the right way, so let's post it out and have a
> discussion. Looking forward to any feedback.
> 
> Zhou Wang (3):
>   iommu/arm-smmu-v3: Export cd/ste get functions
>   iommu/io-pgtable: Export page table walk needed functions and macros
>   iommu/arm-smmu-v3: Add debug interfaces for SMMUv3
> 
>  drivers/iommu/Kconfig                       |  11 +
>  drivers/iommu/arm/arm-smmu-v3/Makefile      |   1 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  10 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  10 +
>  drivers/iommu/arm/arm-smmu-v3/debugfs.c     | 398 ++++++++++++++++++++++++++++
>  drivers/iommu/io-pgtable-arm.c              |  47 +---
>  drivers/iommu/io-pgtable-arm.h              |  43 +++
>  7 files changed, 475 insertions(+), 45 deletions(-)
>  create mode 100644 drivers/iommu/arm/arm-smmu-v3/debugfs.c
> 

Any comments about this series?

Best,
Zhou

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
