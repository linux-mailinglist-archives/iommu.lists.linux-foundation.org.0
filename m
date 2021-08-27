Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03B3F967C
	for <lists.iommu@lfdr.de>; Fri, 27 Aug 2021 10:54:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36C83600CA;
	Fri, 27 Aug 2021 08:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id saXTkBb5foSA; Fri, 27 Aug 2021 08:54:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 416A961533;
	Fri, 27 Aug 2021 08:54:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1D546C0022;
	Fri, 27 Aug 2021 08:54:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54288C000E;
 Fri, 27 Aug 2021 08:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4355B82FBE;
 Fri, 27 Aug 2021 08:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8Nwgx4ZZRLa; Fri, 27 Aug 2021 08:53:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BB9D82FB1;
 Fri, 27 Aug 2021 08:53:58 +0000 (UTC)
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Gwtl94LbQz67LY3;
 Fri, 27 Aug 2021 16:52:37 +0800 (CST)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 27 Aug 2021 10:53:54 +0200
Received: from [10.47.92.37] (10.47.92.37) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.8; Fri, 27 Aug
 2021 09:53:53 +0100
From: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH v11 10/12] vduse: Implement an MMU-based software IOTLB
To: Xie Yongji <xieyongji@bytedance.com>, <mst@redhat.com>,
 <jasowang@redhat.com>, <stefanha@redhat.com>, <sgarzare@redhat.com>,
 <parav@nvidia.com>, <hch@infradead.org>, <christian.brauner@canonical.com>,
 <rdunlap@infradead.org>, <willy@infradead.org>, <viro@zeniv.linux.org.uk>,
 <axboe@kernel.dk>, <bcrl@kvack.org>, <corbet@lwn.net>,
 <mika.penttila@nextfour.com>, <dan.carpenter@oracle.com>, <joro@8bytes.org>,
 <gregkh@linuxfoundation.org>, <zhe.he@windriver.com>,
 <xiaodong.liu@intel.com>, <joe@perches.com>, <robin.murphy@arm.com>
References: <20210818120642.165-1-xieyongji@bytedance.com>
 <20210818120642.165-11-xieyongji@bytedance.com>
Message-ID: <2d807de3-e245-c2fb-ae5d-7cacbe35dfcb@huawei.com>
Date: Fri, 27 Aug 2021 09:57:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210818120642.165-11-xieyongji@bytedance.com>
Content-Language: en-US
X-Originating-IP: [10.47.92.37]
X-ClientProxiedBy: lhreml706-chm.china.huawei.com (10.201.108.55) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org
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

On 18/08/2021 13:06, Xie Yongji wrote:
> +
> +static dma_addr_t
> +vduse_domain_alloc_iova(struct iova_domain *iovad,
> +			unsigned long size, unsigned long limit)
> +{
> +	unsigned long shift = iova_shift(iovad);
> +	unsigned long iova_len = iova_align(iovad, size) >> shift;
> +	unsigned long iova_pfn;
> +
> +	/*
> +	 * Freeing non-power-of-two-sized allocations back into the IOVA caches
> +	 * will come back to bite us badly, so we have to waste a bit of space
> +	 * rounding up anything cacheable to make sure that can't happen. The
> +	 * order of the unadjusted size will still match upon freeing.
> +	 */
> +	if (iova_len < (1 << (IOVA_RANGE_CACHE_MAX_SIZE - 1)))
> +		iova_len = roundup_pow_of_two(iova_len);

Whether it's proper to use this "fast" API or not here, this seems to be 
copied verbatim from dma-iommu.c, which tells me that something should 
be factored out.

Indeed, this rounding up seems a requirement of the rcache, so not sure 
why this is not done there.

> +	iova_pfn = alloc_iova_fast(iovad, iova_len, limit >> shift, true);


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
