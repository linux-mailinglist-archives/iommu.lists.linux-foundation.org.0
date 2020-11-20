Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5902BA736
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 11:20:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7FF65870BC;
	Fri, 20 Nov 2020 10:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id odTCA1-thhil; Fri, 20 Nov 2020 10:20:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 025D5870BB;
	Fri, 20 Nov 2020 10:20:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1D5FC0891;
	Fri, 20 Nov 2020 10:20:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A32EC0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 10:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 09B30870AF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 10:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LX0n2eNnU88f for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 10:20:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 82BB986E9C
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 10:20:14 +0000 (UTC)
IronPort-SDR: dAPDRAr85RJnsateRBLjY9CKsms92wbS40pE0C4ePBkcWyYjigIJf2YuNbG76TdrCJlQaDETfw
 mYyZdoub5FFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="189550603"
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="189550603"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 02:20:14 -0800
IronPort-SDR: aW8I8Urkkd2GFoGv3fErKLdeB5fPnv11SGEjt7MP9PopNfcLKqENg8YD2derH/3Wzf3zd2hEKx
 nFoQxF1MPiQw==
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="360392031"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.215.97])
 ([10.254.215.97])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 02:20:11 -0800
Subject: Re: [PATCH v4 0/7] Convert the intel iommu driver to the dma-iommu api
To: Joerg Roedel <joro@8bytes.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Will Deacon <will@kernel.org>
References: <20200927063437.13988-1-baolu.lu@linux.intel.com>
 <e999e371-6d36-ffea-542f-a5f4b230b0ed@linux.intel.com>
 <c2af9a9d-1cae-b8f7-a0b3-880574060a23@linux.intel.com>
 <8bac9e91-36a0-c1d6-a887-4d60567ac75a@linux.intel.com>
 <3f5694f3-62f9-cc2b-1c2b-f9e99a4788c1@linux.intel.com>
 <1ce5b94a-38b3-548e-3b1a-a68390b93953@linux.intel.com>
 <82dab98e-0761-8946-c31c-92f19a0615b4@linux.intel.com>
 <99a0d1eb-7fde-dff4-225f-92b68fbf7620@linux.intel.com>
 <160439750572.8460.14782978404889004150@jlahtine-mobl.ger.corp.intel.com>
 <20201103105442.GD22888@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <e3299ef9-99ab-8e5a-027a-608495f5a293@linux.intel.com>
Date: Fri, 20 Nov 2020 18:20:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201103105442.GD22888@8bytes.org>
Content-Language: en-US
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

On 2020/11/3 18:54, Joerg Roedel wrote:
> Hi,
> 
> On Tue, Nov 03, 2020 at 11:58:26AM +0200, Joonas Lahtinen wrote:
>> Would that work for you? We intend to send the feature pull requests
>> to DRM for 5.11 in the upcoming weeks.
> 
> For the IOMMU side it is best to include the workaround for now. When
> the DRM fixes are merged into v5.11-rc1 together with this conversion,
> it can be reverted and will not be in 5.11-final.

Okay! So I will keep the workaround and send a new version (mostly
rebase) to Will.

Best regards,
baolu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
