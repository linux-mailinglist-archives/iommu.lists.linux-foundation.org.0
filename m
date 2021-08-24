Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B80EE3F61B6
	for <lists.iommu@lfdr.de>; Tue, 24 Aug 2021 17:33:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E67C407BD;
	Tue, 24 Aug 2021 15:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KW4g9-kM49Mt; Tue, 24 Aug 2021 15:33:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 41620407AC;
	Tue, 24 Aug 2021 15:33:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B0FAC001F;
	Tue, 24 Aug 2021 15:33:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1862C000E
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 15:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D10B18102F
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 15:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWGP6XgKf5QO for <iommu@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 15:33:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 083A680FA6
 for <iommu@lists.linux-foundation.org>; Tue, 24 Aug 2021 15:33:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E9C431B;
 Tue, 24 Aug 2021 08:33:23 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C6F63F766;
 Tue, 24 Aug 2021 08:33:21 -0700 (PDT)
Subject: Re: [PATCH] iommu/io-pgtable: Abstract iommu_iotlb_gather access
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
 <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <ad5ae140-6398-a2d2-ed90-2d59cab01f0f@arm.com>
Date: Tue, 24 Aug 2021 16:33:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
Content-Language: en-GB
Cc: kernel test robot <lkp@intel.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

On 2021-08-24 14:55, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Fri, Aug 20, 2021 at 3:22 PM Robin Murphy <robin.murphy@arm.com> wrote:
>> Previously io-pgtable merely passed the iommu_iotlb_gather pointer
>> through to helpers, but now it has grown its own direct dereference.
>> This turns out to break the build for !IOMMU_API configs where the
>> structure only has a dummy definition. It will probably also crash
>> drivers who don't use the gather mechanism and simply pass in NULL.
>>
>> Wrap this dereference in a suitable helper which can both be stubbed
>> out for !IOMMU_API and encapsulate a NULL check otherwise.
>>
>> Fixes: 7a7c5badf858 ("iommu: Indicate queued flushes via gather data")
> 
> Is this the right Fixes tag?

Conceptually, yes - that's where the new member was introduced, so 
that's where its accessor should have been introduced as well, had I not 
managed to overlook the structure being conditionally defined and assume 
it didn't need anything special doing. Of course it's not going to make 
much difference in practice since they are immediately adjacent commits 
anyway, but it felt right to point at where I made the fundamental 
mistake rather than where the symptom appeared :)

> The build issue was introduced by:
> Fixes: a8e5f04458c4e496 ("iommu/io-pgtable: Remove non-strict quirk")
> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Thanks, this fixes the build issues I was seeing.
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for confirming!

Robin.

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
