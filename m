Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528B1A619A
	for <lists.iommu@lfdr.de>; Mon, 13 Apr 2020 04:49:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0629B83507;
	Mon, 13 Apr 2020 02:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ItG2kAzFb_fd; Mon, 13 Apr 2020 02:49:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DC4682468;
	Mon, 13 Apr 2020 02:49:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E871C1D74;
	Mon, 13 Apr 2020 02:49:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1DE7C0172
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 02:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C8A0D2000F
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 02:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vp4a5tNRiLBx for <iommu@lists.linux-foundation.org>;
 Mon, 13 Apr 2020 02:49:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by silver.osuosl.org (Postfix) with ESMTPS id E33351FEE0
 for <iommu@lists.linux-foundation.org>; Mon, 13 Apr 2020 02:49:00 +0000 (UTC)
IronPort-SDR: qW6b+xaXNv2w+Pov+ZMmpTWDnomc7GDOLOgGb5DMD/ELaoIEgKQqpvPtz7xx88f4SirDKMa3bq
 jtKO50fOULnQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2020 19:49:00 -0700
IronPort-SDR: 8h2kJz9H2xByAm0Ehh0zIvn6ATdAcGQpeq1tHagj9rbqQVoUMOGf47be9xS1Z5eyn7z+wHJA8X
 d3LLcRluFVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,377,1580803200"; d="scan'208";a="362961161"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.211.54])
 ([10.254.211.54])
 by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2020 19:48:55 -0700
Subject: Re: [PATCH 1/1] iommu/vt-d: use DMA domain for real DMA devices and
 subdevices
To: Daniel Drake <drake@endlessm.com>
References: <20200409191736.6233-1-jonathan.derrick@intel.com>
 <20200409191736.6233-2-jonathan.derrick@intel.com>
 <09c98569-ed22-8886-3372-f5752334f8af@linux.intel.com>
 <CAD8Lp45dJ3-t6qqctiP1a=c44PEWZ-L04yv0r0=1Nrvwfouz1w@mail.gmail.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <32cc4809-7029-bc5e-5a74-abbe43596e8d@linux.intel.com>
Date: Mon, 13 Apr 2020 10:48:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAD8Lp45dJ3-t6qqctiP1a=c44PEWZ-L04yv0r0=1Nrvwfouz1w@mail.gmail.com>
Content-Language: en-US
Cc: Linux PCI <linux-pci@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 Linux Upstreaming Team <linux@endlessm.com>,
 Jon Derrick <jonathan.derrick@intel.com>
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

Hi Daniel,

On 2020/4/13 10:25, Daniel Drake wrote:
> On Fri, Apr 10, 2020 at 9:22 AM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>> This is caused by the fragile private domain implementation. We are in
>> process of removing it by enhancing the iommu subsystem with per-group
>> default domain.
>>
>> https://www.spinics.net/lists/iommu/msg42976.html
>>
>> So ultimately VMD subdevices should have their own per-device iommu data
>> and support per-device dma ops.
> 
> Interesting. There's also this patchset you posted:
> [PATCH 00/19] [PULL REQUEST] iommu/vt-d: patches for v5.7
> https://lists.linuxfoundation.org/pipermail/iommu/2020-April/042967.html
> (to be pushed out to 5.8)

Both are trying to solve a same problem.

I have sync'ed with Joerg. This patch set will be replaced with Joerg's
proposal due to a race concern between domain switching and driver
binding. I will rebase all vt-d patches in this set on top of Joerg's
change.

Best regards,
baolu

> 
> In there you have:
>> iommu/vt-d: Don't force 32bit devices to uses DMA domain
> which seems to clash with the approach being explored in this thread.
> 
> And:
>> iommu/vt-d: Apply per-device dma_ops
> This effectively solves the trip point that caused me to open these
> discussions, where intel_map_page() -> iommu_need_mapping() would
> incorrectly determine that a intel-iommu DMA mapping was needed for a
> PCI subdevice running in identity mode. After this patch, a PCI
> subdevice in identity mode uses the default system dma_ops and
> completely avoids intel-iommu.
> 
> So that solves the issues I was looking at. Jon, you might want to
> check if the problems you see are likewise solved for you by these
> patches.
> 
> I didn't try Joerg's iommu group rework yet as it conflicts with those
> patches above.
> 
> Daniel
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
