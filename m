Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E52273539
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 23:53:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16EE886094;
	Mon, 21 Sep 2020 21:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgM9eC4j8RZe; Mon, 21 Sep 2020 21:53:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D50FC86074;
	Mon, 21 Sep 2020 21:53:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B92B5C0051;
	Mon, 21 Sep 2020 21:53:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3394DC0051
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 21:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2F68185886
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 21:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g9Mj6GP2EEiE for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 21:53:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 54695857BF
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 21:53:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 99CAC147A;
 Mon, 21 Sep 2020 14:53:25 -0700 (PDT)
Received: from [10.57.50.108] (unknown [10.57.50.108])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBDDA3F73B;
 Mon, 21 Sep 2020 14:53:23 -0700 (PDT)
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Support coherency for Mali LPAE
To: Will Deacon <will@kernel.org>
References: <cover.1600213517.git.robin.murphy@arm.com>
 <d2a3ddb17b3270e268e2f1adf7682ea938823941.1600213517.git.robin.murphy@arm.com>
 <20200921175717.GF3141@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <71cc6c53-7bd1-da1a-05fa-8172510b33d8@arm.com>
Date: Mon, 21 Sep 2020 22:53:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921175717.GF3141@willie-the-truck>
Content-Language: en-GB
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, narmstrong@baylibre.com,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
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

On 2020-09-21 18:57, Will Deacon wrote:
> On Wed, Sep 16, 2020 at 12:51:05AM +0100, Robin Murphy wrote:
>> Midgard GPUs have ACE-Lite master interfaces which allows systems to
>> integrate them in an I/O-coherent manner. It seems that from the GPU's
>> viewpoint, the rest of the system is its outer shareable domain, and so
>> even when snoop signals are wired up, they are only emitted for outer
>> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
>> indeed get coherent pagetable walks working nicely for the coherent
>> T620 in the Arm Juno SoC.
> 
> I can't help but think some of this commentary deserves to be in the code
> as well.

Sure, if you want.

> Do you know if this sort of thing is done for other SoCs too, or is this
> just a Juno quirk?

Yup, this is a "Midgard working as designed" thing. Juno is the coherent 
example I have to hand, but off the top of my head I believe some of the 
Exynos SoCs can also use their GPUs coherently if a switch is flipped in 
the interconnect to change routing between the CCI and a direct-to-RAM 
path; I expect there are probably further Midgard examples that I'm not 
aware of. Then there are definitely coherent Bifrost GPUs like the 
Amlogic S922/A311 that prompted me to revive this patch, which we 
currently drive in "Legacy" mode and thus behave the same way as Midgard 
(Bifrost's "AArch64" mode realigns Ish and Osh with the rest of the 
system, and instead invents a new "Internal Shareable" value in between 
Nsh and Ish to represent the shareability between cores within the GPU 
for which Midgard hijacked Ish).

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
