Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE0A2772CF
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 15:42:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9E5382E12E;
	Thu, 24 Sep 2020 13:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlVpA1aeDSKg; Thu, 24 Sep 2020 13:42:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6EF182E118;
	Thu, 24 Sep 2020 13:42:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51CA0C0051;
	Thu, 24 Sep 2020 13:42:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13230C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 13:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0BF372E10B
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 13:42:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jJ0vErKGPzb1 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 13:42:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by silver.osuosl.org (Postfix) with ESMTPS id B30692E114
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 13:42:30 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id ABEC7382033A6CEF029B;
 Thu, 24 Sep 2020 21:42:18 +0800 (CST)
Received: from [10.174.185.226] (10.174.185.226) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Thu, 24 Sep 2020 21:42:10 +0800
Subject: Re: [PATCH v10 11/11] vfio: Document nested stage control
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>, <joro@8bytes.org>,
 <alex.williamson@redhat.com>, <jacob.jun.pan@linux.intel.com>,
 <yi.l.liu@intel.com>, <robin.murphy@arm.com>
References: <20200320161911.27494-1-eric.auger@redhat.com>
 <20200320161911.27494-12-eric.auger@redhat.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <26a85a63-6cc1-0348-e703-cb31ddd75339@huawei.com>
Date: Thu, 24 Sep 2020 21:42:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200320161911.27494-12-eric.auger@redhat.com>
Content-Language: en-US
X-Originating-IP: [10.174.185.226]
X-CFilter-Loop: Reflected
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Eric,

On 2020/3/21 0:19, Eric Auger wrote:
> The VFIO API was enhanced to support nested stage control: a bunch of
> new iotcls, one DMA FAULT region and an associated specific IRQ.
> 
> Let's document the process to follow to set up nested mode.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

[...]

> +The userspace must be prepared to receive faults. The VFIO-PCI device
> +exposes one dedicated DMA FAULT region: it contains a ring buffer and
> +its header that allows to manage the head/tail indices. The region is
> +identified by the following index/subindex:
> +- VFIO_REGION_TYPE_NESTED/VFIO_REGION_SUBTYPE_NESTED_DMA_FAULT
> +
> +The DMA FAULT region exposes a VFIO_REGION_INFO_CAP_PRODUCER_FAULT
> +region capability that allows the userspace to retrieve the ABI version
> +of the fault records filled by the host.

Nit: I don't see this capability in the code.


Thanks,
Zenghui
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
