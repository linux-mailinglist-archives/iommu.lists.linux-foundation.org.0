Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F743A4C17
	for <lists.iommu@lfdr.de>; Sat, 12 Jun 2021 03:22:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA8C583DE2;
	Sat, 12 Jun 2021 01:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HtknI5vXo9aP; Sat, 12 Jun 2021 01:22:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 15CDD83DE1;
	Sat, 12 Jun 2021 01:22:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3BC8C0024;
	Sat, 12 Jun 2021 01:22:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81727C000B
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 01:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74A8683DBB
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 01:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sSE1i3hrCNK9 for <iommu@lists.linux-foundation.org>;
 Sat, 12 Jun 2021 01:22:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D6D583DE1
 for <iommu@lists.linux-foundation.org>; Sat, 12 Jun 2021 01:22:05 +0000 (UTC)
IronPort-SDR: PV5JWMLp3DtVmq4JDseWDbEKAauGpUnfWy+ZNzvQymaLdstJnKY5VduFWrM1wdUOpQKqwJCvJY
 kcfMlFiqxBfg==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="203805064"
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="203805064"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 18:22:05 -0700
IronPort-SDR: HGSyKzehp43FjYp0rgwHlcVfxC/9mqaKeNAcAIonOHPHnDnfDerhV26RKa823oHg4ZqVAypTei
 ihffYAKT/tTA==
X-IronPort-AV: E=Sophos;i="5.83,268,1616482800"; d="scan'208";a="483464843"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.238.4.20])
 ([10.238.4.20])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 18:22:02 -0700
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, robin.murphy@arm.com
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-3-git-send-email-john.garry@huawei.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v12 2/5] iommu: Enhance IOMMU default DMA mode build
 options
Message-ID: <a4c85f00-918b-5952-7585-8e1110ac5195@linux.intel.com>
Date: Sat, 12 Jun 2021 09:21:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1623414043-40745-3-git-send-email-john.garry@huawei.com>
Content-Language: en-US
Cc: linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On 2021/6/11 20:20, John Garry wrote:
> +config IOMMU_DEFAULT_LAZY
> +	bool "lazy"
> +	help
> +	  Support lazy mode, where for every IOMMU DMA unmap operation, the
> +	  flush operation of IOTLB and the free operation of IOVA are deferred.
> +	  They are only guaranteed to be done before the related IOVA will be
> +	  reused.
> +
> +	  The isolation provided in this mode is not as secure as STRICT mode,
> +	  such that a vulnerable time window may be created between the DMA
> +	  unmap and the mapping finally being torn down in the IOMMU, where the
> +	  device can still access the system memory. However this mode may

" ... and the mappings cached in the IOMMU IOTLB or device TLB finally
being invalidated, where the device probably can still access the memory
which has already been unmapped by the device driver."

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
