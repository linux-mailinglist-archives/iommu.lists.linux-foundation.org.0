Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E52924F28A
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 08:31:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EFA85204A0;
	Mon, 24 Aug 2020 06:31:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xoro4vpAcU1j; Mon, 24 Aug 2020 06:31:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 280E92049A;
	Mon, 24 Aug 2020 06:31:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBDA3C0051;
	Mon, 24 Aug 2020 06:31:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86372C0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 06:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B81285C4C
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 06:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yyiskxhyp2j for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 06:31:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EA70485B94
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 06:31:27 +0000 (UTC)
IronPort-SDR: y3GtcaSuxVRwOZh+Hk7h+WeozzdfFHU7DBiTRkXL6FxUvC8C985p3tNtAdXGlwI6MHrbro9Kwr
 SBxLSixsLLVQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="153257931"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="153257931"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2020 23:31:27 -0700
IronPort-SDR: 0V4ihqf+WXUXYsQ0IJPdnuxlWzcWibJUmcIDItXdB12I1iL9p5Tn/KGpZmxlqjCoYrCqAw7vJq
 BDM21KyjS4Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; d="scan'208";a="328377856"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.214.99])
 ([10.254.214.99])
 by orsmga008.jf.intel.com with ESMTP; 23 Aug 2020 23:31:24 -0700
Subject: Re: [PATCH v4 07/15] iommu/vt-d: Delegate the dma domain to upper
 layer
To: Chris Wilson <chris@chris-wilson.co.uk>,
 David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>
References: <20190525054136.27810-1-baolu.lu@linux.intel.com>
 <20190525054136.27810-8-baolu.lu@linux.intel.com>
 <159803479017.29194.1359332295829225843@build.alporthouse.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <65125687-14ae-182f-da07-7d29b4910364@linux.intel.com>
Date: Mon, 24 Aug 2020 14:31:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <159803479017.29194.1359332295829225843@build.alporthouse.com>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
 tmurphy@arista.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

Hi Chris,

On 2020/8/22 2:33, Chris Wilson wrote:
> Quoting Lu Baolu (2019-05-25 06:41:28)
>> This allows the iommu generic layer to allocate a dma domain and
>> attach it to a device through the iommu api's. With all types of
>> domains being delegated to upper layer, we can remove an internal
>> flag which was used to distinguish domains mananged internally or
>> externally.
> 
> I'm seeing some really strange behaviour with this patch on a 32b
> Skylake system (and still present on mainline). Before this patch
> everything is peaceful and appears to work correctly. Applying this patch,
> and we fail to initialise the GPU with a few DMAR errors reported, e.g.
> 
> [   20.279445] DMAR: DRHD: handling fault status reg 3
> [   20.279508] DMAR: [DMA Read] Request device [00:02.0] fault addr 8900a000 [fault reason 05] PTE Write access is not set
> 
> Setting an identity map for the igfx made the DMAR errors disappear, but
> the GPU still failed to initialise.
> 
> There's no difference in the DMAR configuration dmesg between working and
> the upset patch. And the really strange part is that switching to a 64b
> kernel with this patch, it's working.
> 
> Any suggestions on what I should look for?

Can the patch titled "[PATCH] iommu/intel: Handle 36b addressing for
x86-32" solve this problem?

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
