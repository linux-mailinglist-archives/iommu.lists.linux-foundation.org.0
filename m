Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6474830A6E2
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 12:53:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17F0885BD3;
	Mon,  1 Feb 2021 11:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYuRCaL6cub5; Mon,  1 Feb 2021 11:52:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EA6A7848AB;
	Mon,  1 Feb 2021 11:52:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CED3EC013A;
	Mon,  1 Feb 2021 11:52:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A86F1C013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 11:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9F28920334
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 11:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5hm6nyvAmcy for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 11:52:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by silver.osuosl.org (Postfix) with ESMTPS id 7BB2A2002D
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 11:52:55 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DTmWC0lfWzjHP0;
 Mon,  1 Feb 2021 19:51:35 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Feb 2021 19:52:45 +0800
Subject: Re: [PATCH v13 02/15] iommu: Introduce bind/unbind_guest_msi
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <kvm@vger.kernel.org>, <kvmarm@lists.cs.columbia.edu>, <will@kernel.org>,
 <joro@8bytes.org>, <maz@kernel.org>, <robin.murphy@arm.com>,
 <alex.williamson@redhat.com>
References: <20201118112151.25412-1-eric.auger@redhat.com>
 <20201118112151.25412-3-eric.auger@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <6a70d93d-329f-4129-bd90-03f8589c5de4@huawei.com>
Date: Mon, 1 Feb 2021 19:52:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20201118112151.25412-3-eric.auger@redhat.com>
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, vivek.gautam@arm.com, zhangfei.gao@linaro.org
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

Hi Eric,

On 2020/11/18 19:21, Eric Auger wrote:
> On ARM, MSI are translated by the SMMU. An IOVA is allocated
> for each MSI doorbell. If both the host and the guest are exposed
> with SMMUs, we end up with 2 different IOVAs allocated by each.
> guest allocates an IOVA (gIOVA) to map onto the guest MSI
> doorbell (gDB). The Host allocates another IOVA (hIOVA) to map
> onto the physical doorbell (hDB).
> 
> So we end up with 2 untied mappings:
>          S1            S2
> gIOVA    ->    gDB
>               hIOVA    ->    hDB
> 
> Currently the PCI device is programmed by the host with hIOVA
> as MSI doorbell. So this does not work.
> 
> This patch introduces an API to pass gIOVA/gDB to the host so
> that gIOVA can be reused by the host instead of re-allocating
> a new IOVA. So the goal is to create the following nested mapping:
Does the gDB can be reused under non-nested mode?

> 
>          S1            S2
> gIOVA    ->    gDB     ->    hDB
> 
> and program the PCI device with gIOVA MSI doorbell.
> 
> In case we have several devices attached to this nested domain
> (devices belonging to the same group), they cannot be isolated
> on guest side either. So they should also end up in the same domain
> on guest side. We will enforce that all the devices attached to
> the host iommu domain use the same physical doorbell and similarly
> a single virtual doorbell mapping gets registered (1 single
> virtual doorbell is used on guest as well).
> 
[...]

> + *
> + * The associated IOVA can be reused by the host to create a nested
> + * stage2 binding mapping translating into the physical doorbell used
> + * by the devices attached to the domain.
> + *
> + * All devices within the domain must share the same physical doorbell.
> + * A single MSI GIOVA/GPA mapping can be attached to an iommu_domain.
> + */
> +
> +int iommu_bind_guest_msi(struct iommu_domain *domain,
> +			 dma_addr_t giova, phys_addr_t gpa, size_t size)
> +{
> +	if (unlikely(!domain->ops->bind_guest_msi))
> +		return -ENODEV;
> +
> +	return domain->ops->bind_guest_msi(domain, giova, gpa, size);
> +}
> +EXPORT_SYMBOL_GPL(iommu_bind_guest_msi);
> +
> +void iommu_unbind_guest_msi(struct iommu_domain *domain,
> +			    dma_addr_t iova)
nit: s/iova/giova

> +{
> +	if (unlikely(!domain->ops->unbind_guest_msi))
> +		return;
> +
> +	domain->ops->unbind_guest_msi(domain, iova);
> +}
> +EXPORT_SYMBOL_GPL(iommu_unbind_guest_msi);
> +
[...]

Thanks,
Keqian

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
