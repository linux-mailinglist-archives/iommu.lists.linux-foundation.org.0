Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4B181120
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 07:50:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6550B878F0;
	Wed, 11 Mar 2020 06:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFqJdsGOePhQ; Wed, 11 Mar 2020 06:50:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CA0B8742D;
	Wed, 11 Mar 2020 06:50:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86835C0177;
	Wed, 11 Mar 2020 06:50:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F860C0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 06:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4637C878F0
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 06:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbuZcpJgulGF for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 06:50:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 60B3C8742D
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 06:50:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 23:50:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,539,1574150400"; d="scan'208";a="242588178"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.208.137])
 ([10.254.208.137])
 by orsmga003.jf.intel.com with ESMTP; 10 Mar 2020 23:50:40 -0700
Subject: Re: [PATCH 0/6] Replace private domain with per-group default
To: Joerg Roedel <joro@8bytes.org>
References: <20200307062014.3288-1-baolu.lu@linux.intel.com>
 <20200310111503.GF3794@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <cd0f526c-da68-ef59-580f-665ad08a395f@linux.intel.com>
Date: Wed, 11 Mar 2020 14:50:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310111503.GF3794@8bytes.org>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 Daniel Drake <drake@endlessm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Derrick Jonathan <jonathan.derrick@intel.com>
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

Hi Joerg,

On 2020/3/10 19:15, Joerg Roedel wrote:
> Hi Baolu,
> 
> On Sat, Mar 07, 2020 at 02:20:08PM +0800, Lu Baolu wrote:
>> Lu Baolu (5):
>>    iommu: Configure default domain with dev_def_domain_type
>>    iommu/vt-d: Don't force 32bit devices to uses DMA domain
>>    iommu/vt-d: Don't force PCI sub-hierarchy to use DMA domain
>>    iommu/vt-d: Add dev_def_domain_type callback
>>    iommu/vt-d: Apply per-device dma_ops
>>
>> Sai Praneeth Prakhya (1):
>>    iommu: Add dev_def_domain_type() callback in iommu_ops
> 
> I like this patch-set, but I fear some regressions from patch
> "iommu/vt-d: Don't force 32bit devices to uses DMA domain". Have you
> tested this series on a couple of machines, ideally even older ones from
> the first generation of VT-d hardware?

The oldest hardware I have is Ivy Bridge. :-) Actually, The effect of
using identity domain for 32-bit devices is the same as that of adding
intel_iommu=off in the kernel parameter. Hence, if there is any
regression, people should also find it with intel_iommu=off.
intel_iommu=off support is added at the very beginning of VT-d driver.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
